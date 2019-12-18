#include<iostream>
#include<bits/stdc++.h>
//#include <boost/algorithm/string.hpp> 

using namespace std;

vector<string> split(string str,string delimiter){  
	vector<string> result;
	size_t pos = 0; 
	while ((pos = str.find(delimiter)) != string::npos) {
	   	result.push_back(str.substr(0, pos)); 
	    str.erase(0, pos + delimiter.length());
	} 
	result.push_back(str.substr(0, str.length()-1)); 
	return result;
}

int main(){
	ifstream cin ("input.txt");
	ofstream cout ("output_sql.txt");
	string s,temp,table, param1, param2, param3, param4;
	vector<string> result;
	int n,pos,ans=10;
	cin>>n;
	while(n--){
		cin>>s; 
		table = s.substr(0,s.find("("));
		temp = s.substr(s.find("(") +1 ,s.length()-1);
		result = split(temp,",");   
		param1 = s.substr(s.find(",") +1);
		param2 = "";
		param3 = "";
		param4 = "";
		
		// get all data from table
		// select * from table
		         
		cout<<"        //******************"<<table<<"************************"<<endl;
		cout<<"        // "<<s<<endl;
		cout<<"        // Get all data from "<<table<<endl;
		cout<<"        case "<<ans<<": {"<<endl;
		cout<<"            $sql = |SELECT * FROM "<<table<<"|;"<<endl;
		cout<<"            break;"<<endl;
		cout<<"        }"<<endl<<endl;
			
		for(int i=1;i<result.size()-1;i++){
			// insert
			param2 += "'$data->"+result[i]+"',";  
			
			// update
			param3 += ""+result[i]+"='$data->"+result[i]+"', "; 
		} 
		// insert
		param2 += "'$data->"+result[result.size()-1]+"'"; 
		
		// updata
		param3 += ""+result[result.size()-1]+" = '$data->"+result[result.size()-1]+"'"; 
		
		// Insert data to table 
		cout<<"        // Insert data to "<<table<<endl;
		cout<<"        case "<<ans + 1<<": {"<<endl;
		cout<<"            $sql = |INSERT INTO "<<table<<"("+param1+""<<endl;
		cout<<"            		VALUES("+param2+")|;"<<endl;
		cout<<"            break;"<<endl;
		cout<<"        }"<<endl<<endl;
		
		// Update data table 
		cout<<"        // Update data "<<table<<endl;
		cout<<"        case "<<ans + 2<<": {"<<endl;
		cout<<"            $sql = |UPDATE "<<table<<" SET "+param3+""<<endl;
		cout<<"            		WHERE id='$data->id'|;"<<endl;
		cout<<"            break;"<<endl;
		cout<<"        }"<<endl<<endl;
		
		// Delete data from id
		cout<<"        // Delete data of "<<table<<endl;
		cout<<"        case "<<ans + 3<<": {"<<endl;
		cout<<"            $sql = |DELETE FROM "<<table<<endl;
		cout<<"            		WHERE id='$data->id'|;"<<endl;
		cout<<"            break;"<<endl;
		cout<<"        }"<<endl<<endl;
		
		// Find data with id
		cout<<"        // Find data with id "<<table<<endl;
		cout<<"        case "<<ans + 4<<": {"<<endl;
		cout<<"            $sql = |SELECT * FROM "<<table<<endl;
		cout<<"            		WHERE id='$data->id'|;"<<endl;
		cout<<"            break;"<<endl;
		cout<<"        }"<<endl<<endl;
		
		cout<<endl;
		ans+=10;
	} 
	return 0;
}


