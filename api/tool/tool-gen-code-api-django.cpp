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

void genView(string table){ 
	ofstream cout ("django-view.txt", ios_base::app);
	
	cout<<"# *********************************************	"<<endl;
	cout<<"# begin "<<table<<"	"<<endl;
	cout<<"@api_view(['POST'])	"<<endl;
	cout<<"@parser_classes((JSONParser,))	"<<endl;
	cout<<"# get all data from "<<table<<"	"<<endl;
	cout<<"def createData"<<table<<"(request, format=None):	"<<endl;
	cout<<"    data = json.loads(json.dumps(request.data))	"<<endl;
	cout<<"    obj = models."<<table<<"(**data)	"<<endl;
	cout<<"    obj.save()	"<<endl;
	cout<<"    return Response({\"id\": obj.id, \"result\": \"ok\"})"<<endl;
	cout<<"	"<<endl;
	cout<<"	"<<endl;
	cout<<"@api_view(['POST'])	"<<endl;
	cout<<"@parser_classes((JSONParser,))	"<<endl;
	cout<<"# get all data from "<<table<<"	"<<endl;
	cout<<"def readData"<<table<<"(request, format=None):	"<<endl;
	cout<<"    return Response(serializers.serialize(\"json\", models."<<table<<".objects.all()))	"<<endl;
	cout<<"	"<<endl;
	cout<<"	"<<endl;
	cout<<"@api_view(['POST'])	"<<endl;
	cout<<"@parser_classes((JSONParser,))	"<<endl;
	cout<<"# get update data from "<<table<<"	"<<endl;
	cout<<"def updateData"<<table<<"(request, format=None):	"<<endl;
	cout<<"    data = json.loads(json.dumps(request.data))	"<<endl;
	cout<<"    models."<<table<<"(**data).save()	"<<endl;
	cout<<"    return Response({\"result\": \"ok\"})	"<<endl;
	cout<<"	"<<endl;
	cout<<"	"<<endl;
	cout<<"@api_view(['POST'])	"<<endl;
	cout<<"@parser_classes((JSONParser,))	"<<endl;
	cout<<"# get delete data from "<<table<<"	"<<endl;
	cout<<"def deleteData"<<table<<"(request, format=None):	"<<endl;
	cout<<"    data = json.loads(json.dumps(request.data))	"<<endl;
	cout<<"    models."<<table<<"(**data).delete()	"<<endl;
	cout<<"    return Response({\"result\": \"ok\"})	"<<endl;
	cout<<"	"<<endl;
	cout<<"	"<<endl;
	cout<<"@api_view(['POST'])	"<<endl;
	cout<<"@parser_classes((JSONParser,))	"<<endl;
	cout<<"# get delete data from "<<table<<"	"<<endl;
	cout<<"def findData"<<table<<"(request, format=None):	"<<endl;
	cout<<"    return Response(serializers.serialize(\"json\", models."<<table<<".objects.filter(pk=request.data['pk'])))	"<<endl;
	cout<<"	"<<endl;
	cout<<"# end "<<table<<"	"<<endl;
	cout<<"# *********************************************	"<<endl; 
	cout<<endl;
}

void genUrl(string table){
	ofstream cout("django-url.txt", ios_base::app);
	cout<<"    # *******************************************************	"<<endl;
	cout<<"    # begin "<<table<<"	"<<endl;
	cout<<"    path('createData"<<table<<"', views.createData"<<table<<", name='createData"<<table<<"'), 	"<<endl;
	cout<<"    path('readData"<<table<<"', views.readData"<<table<<", name='readData"<<table<<"'), 	"<<endl;
	cout<<"    path('updateData"<<table<<"', views.updateData"<<table<<", name='updateData"<<table<<"'), 	"<<endl;
	cout<<"    path('deleteData"<<table<<"', views.deleteData"<<table<<", name='deleteData"<<table<<"'),  	"<<endl;
	cout<<"    path('findData"<<table<<"', views.findData"<<table<<", name='findData"<<table<<"'),  	"<<endl;
	cout<<"    # end "<<table<<"	"<<endl;
	cout<<"    # *******************************************************	"<<endl;
	cout<<endl;
}

int main(){
	ifstream cin ("input-train.txt");
	
	string s,temp,table, param1, param2, param3, param4;
	vector<string> result;
	int n;
	cin>>n; 
	while(n--){
		cin>>s; 
		table = s.substr(0,s.find("("));
		genView(table);
		genUrl(table); 
	} 
 
	 
	return 0;
}


