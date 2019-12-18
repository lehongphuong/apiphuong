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
	ofstream cout ("output_firebase.txt");
	string s,temp,table, param1, param2, param3, param4;
	vector<string> result;
	int n,pos,ans=10;
	cin>>n;
	while(n--){
		cin>>s; 
		table = s.substr(0,s.find("("));
		
		char firstUpper = toupper(table[0]);
		string tableUppercase =  firstUpper + table.substr(1);
		
		temp = s.substr(s.find("(") +1 ,s.length()-1);
		result = split(temp,",");   
		param1 = s.substr(s.find(",") +1);
		param2 = "";
		param3 = "";
		param4 = "";
		
		// get all data from table
		// select * from table
		         
		cout<<"   //******************"<<table<<"************************"<<endl;
		cout<<"    // "<<s<<endl; 
		
		cout<<"   /**	"<<endl;
		cout<<"     * Get all data from "<<table<<endl;
		cout<<"     */ 	"<<endl;
		cout<<"    public getAllDataFrom"<<tableUppercase<<"() {	"<<endl;
		cout<<"        return this.fb.getDataFrom('"<<table<<"');	"<<endl;
		cout<<"    }	"<<endl;
		
		cout<<"	"<<endl; 
		
		cout<<"   /**	"<<endl; 
		cout<<"    * Insert data to "<<table<<endl;
		cout<<"    * @param data 	"<<endl;
		cout<<"    */	"<<endl;
		cout<<"   public insertDataTo"<<tableUppercase<<"(data) {	"<<endl;
		cout<<"       this.fb.addDataTo('"<<table<<"', data);	"<<endl;
		cout<<"   }	"<<endl;
		
		cout<<"	"<<endl;
		
		cout<<"   /**	"<<endl;
		cout<<"    * Update data "<<table<<endl;
		cout<<"    * @param data 	"<<endl;
		cout<<"    */	"<<endl;
		cout<<"   public updateData"<<tableUppercase<<"(data) {	"<<endl;
		cout<<"       this.fb.updateDataOf('"<<table<<"', data);	"<<endl;
		cout<<"   }	"<<endl;
		
		cout<<"	"<<endl;
		
		cout<<"   /**	"<<endl;
		cout<<"    * Delete data of "<<table<<endl;
		cout<<"    * @param id 	"<<endl;
		cout<<"    */	"<<endl;
		cout<<"   public deleteData"<<tableUppercase<<"(id) {	"<<endl;
		cout<<"       this.fb.deleteDataOf('"<<table<<"', id);	"<<endl;
		cout<<"   }	"<<endl;
		
		cout<<"	"<<endl;
		
		cout<<"   /**	"<<endl;
		cout<<"    * Find data "<<table<<" by id	"<<endl;
		cout<<"    * @param id 	"<<endl;
		cout<<"    */	"<<endl;
		cout<<"   public findData"<<tableUppercase<<"ById(id) {	"<<endl;
		cout<<"       this.fb.findDataById('"<<table<<"', id);	"<<endl;
		cout<<"   }	"<<endl;

		
		cout<<endl;
		ans+=10;
	} 
	return 0;
}


