import pandas as pd
import re   
from . import common

# *******************************
# "{Private Sub}{ }[MethodName]{(}[int a, string b]{)}"  => "(Private Sub)( )(.+)(\()(.+)(\))"
# *******************************
def convert_pattern_to_regex(str1): 
    str1 = str1.replace(r'{(}',r'{\(}') 
    str1 = str1.replace(r'{)}',r'{\)}')
    str1 = str1.replace(r'{',r'(').replace(r'}',r')')

    regex = r"(\[.+\])"
    size = (len(re.findall(r'\[',str1)))  
    for x in range(1,size):
        regex= regex + r".+(\[.+\])"

    matches = re.finditer(regex, str1, re.MULTILINE)
    for matchNum, match in enumerate(matches, start=1):
        for groupNum in range(0, len(match.groups())):
            groupNum += 1
            str1 = str1.replace(match.group(groupNum),r'(.+)')
    
    return str1

# *******************************
# call method by string 
# example: call_method_by_string('method_name(param)')
# *******************************
def call_method_by_string(str_method):
# check method is valid
    if(str_method != ""):
        results = re.findall(r"(.+)(\(.+\))",str_method) 
        if(results): 
            method_name = results[0][0] 
            params = results[0][1].replace('(','').replace(')','')  
            return globals()[method_name](*params.split(','))
    return None

# *******************************
# {} mô tả key tìm kiếm chính xác, nếu càng nhiều key thì tỉ lệ tìm kiếm thấy và convert đúng càng cao
# [] mô tả giá trị có thể thay đổi bất kỳ và sẽ dùng để convert qua source mới
# giá trị value bên trong [] có thể sử dụng để gọi một phương thức làm thay đổi giá trị trước khi thay thế
# input_pattern    => "{Private Sub}{ }[MethodName]{(}[int a, string b]{)}"
# mỗi cặp {} hoặc [] trong chuối được tính là 1 vị trí trong của output, và nó bắt đầu từ 0
# Ví dụ trong output_pattern {0} = Private Sub, {2} = MethodName 
# output_pattern   => "private {2}({4})"
# source           => Private Sub MethodName(int a, string b)
# output_convert   => 
# method           => ["methodName(param1, param2)","methodName1(param1, param2)"]
# cần thực hiện được các method như convert 1 lần nữa với value
# Dùng value để gọi hàm
# *******************************
def convert_source_by_pattern(input_pattern, output_pattern, source, *methods): 
    # convert custom input pattern to regex pattern
    input_regex = convert_pattern_to_regex(input_pattern)   
    
    # find source by pattern
    matches = re.finditer(input_regex, source, re.MULTILINE) 
    
    # count space and tab     
    count_space = source.count('    ') + source.count('\t') 
    
    # format list extract from string by input regex
    formats = [] 
    for matchNum, match in enumerate(matches, start=1): 
        for groupNum in range(0, len(match.groups())):
            groupNum = groupNum + 1
            formats.append(match.group(groupNum).strip())
            
    # check call method and update value  
    formats_temp = formats
    format_flag = False  
    
    for i in range(0,len(methods[0])): 
        method = methods[0][i] 
        if method: 
            format_flag = True 
            index = re.findall(r"(\{.+\})",method)[0].replace('{','').replace('}','') 
            method_full = method.replace(re.findall(r"(\{.+\})",method)[0],formats[int(index)]) 
            formats_temp[i] = call_method_by_string(method_full)
    
    # check flag
    if format_flag:
        formats = formats_temp
    
    return "    "*count_space + output_pattern.format(*formats)


#************************************
# Export function have sql
#************************************
def export_function_have_sql(data_source):
    # restore nháy kép
    data_source = data_source.replace('nhaykep','"') 
    data_source = data_source.split('\n')  
    source_output = ''
    source_temp = '' 

    begin = 0
    mid = 0
    end = 0
    ans = 0
    # loop in source
    for source in data_source:  
        if (re.findall('Private Function',source)):
            begin = ans
            
        if (re.findall('SELECT', source) 
            or re.findall('UPDATE', source) 
            or re.findall('DELETE', source) 
            or re.findall('INSERT', source)):
            mid = ans 
            
        if (re.findall('End Function',source) and ans > begin):
            end = ans
            if (mid > begin and mid < end):  
                for source in data_source[begin:end+1]:  
                    source_output+=source +'\n'
                
                source_output+="\n\n****************************************************\n\n"
                
        ans+=1
        
    return source_output


#************************************
# Main function migrate tool
#************************************
def main_migrate(data_source, data_pattern): 
    # get data pattern
    data_pattern = data_pattern.split('||') 

    # restore nháy kép
    data_source = data_source.replace('nhaykep','"')
    print(data_source)

    data_source = data_source.split('\n') 
    source_output = ''
    # loop in source
    for source in data_source: 
        source_temp = '' 
        
        # migrate
        for patterns in data_pattern:
            patterns = patterns.split('&&')
            input_pattern = patterns[0]
            output_pattern = patterns[1]
            methods = patterns[2]
            
            # check method and init
            if  type(methods) == float:  
                methods = str('[]')

            if re.search(convert_pattern_to_regex(input_pattern), source):
                source_temp = convert_source_by_pattern(input_pattern, output_pattern, source, eval(methods))
                break
            else:
                source_temp = source
                
        # add source convert     
        source_output += source_temp + '\n'

    # write output file
    print('Migrate finish ^.< Please check file output.txt. Pink Ways!')
    return source_output

    