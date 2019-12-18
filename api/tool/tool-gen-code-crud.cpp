#include<iostream>
#include<bits/stdc++.h>
#include <dir.h> 
#include <process.h> 
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

/**
* genHtml
*/
void genHtml(string table, string tableUppercase, vector<string> result){ 
	string fileName = table+ "/"+ table + ".component.html";
	ofstream cout (fileName.c_str());
	  
	cout<<"<mat-card> 	"<<endl;
	cout<<"  <!-- header -->	"<<endl;
	cout<<"  <mat-card-header>	"<<endl;
	cout<<"    <mat-card-title>"<<tableUppercase<<" Info</mat-card-title>	"<<endl;
	cout<<"    <mat-card-subtitle>Pinks ways</mat-card-subtitle>	"<<endl;
	cout<<"  </mat-card-header>	"<<endl;
	cout<<"	"<<endl;
	cout<<"  <mat-card-content>	"<<endl;
	cout<<"    <!-- BEGIN INSERT UPDATE -->	"<<endl;
	cout<<"    <mat-accordion>	"<<endl;
	cout<<"      <mat-expansion-panel #matExpansionPanel>	"<<endl;
	cout<<"        <mat-expansion-panel-header>	"<<endl;
	cout<<"          <mat-panel-title>	"<<endl;
	cout<<"            "<<tableUppercase<<" data	"<<endl;
	cout<<"          </mat-panel-title>	"<<endl;
	cout<<"          <mat-panel-description>	"<<endl;
	cout<<"            Type your Insert or Update	"<<endl;
	cout<<"          </mat-panel-description>	"<<endl;
	cout<<"        </mat-expansion-panel-header>	"<<endl;
	cout<<"	"<<endl;
	cout<<"        <!-- begin insert form fill -->	"<<endl;
	
	for(int i=1;i<result.size();i++){ 
		char firstUpper = toupper(result[i][0]);
		string uppercaseParam =  firstUpper + result[i].substr(1);
		
		cout<<"        <!-- "<<result[i]<<" field -->	"<<endl;
		cout<<"        <mat-form-field class=\"example-full-width\">	"<<endl;
		cout<<"          <input matInput [(ngModel)]=\"input."<<result[i]<<"\" [required]=\"'true'\" placeholder=\""<<uppercaseParam<<"\">	"<<endl;
		cout<<"        </mat-form-field>	"<<endl;
		cout<<"	"<<endl;
	}
 
	cout<<"        <!-- end insert form fill -->	"<<endl;
	cout<<"	"<<endl;
	cout<<"        <div style=\"text-align: center\">	"<<endl;
	cout<<"          <button (click)=\"onClickInsert()\" style=\"margin-right:10px\" mat-stroked-button>INSERT</button>	"<<endl;
	cout<<"          <button (click)=\"onClickUpdate()\" style=\"margin-right:10px\" mat-stroked-button color=\"primary\">UPDATE</button>	"<<endl;
	cout<<"          <button (click)=\"onClickDelete()\" style=\"margin-right:10px\" mat-stroked-button color=\"warn\">DELETE</button>	"<<endl;
	cout<<"          <button (click)=\"clearDataInput()\" style=\"margin-right:10px\" mat-stroked-button color=\"accent\">CLEAR</button>	"<<endl;
	cout<<"        </div>	"<<endl;
	cout<<"	"<<endl;
	cout<<"      </mat-expansion-panel>	"<<endl;
	cout<<"    </mat-accordion>	"<<endl;
	cout<<"    <!-- END INSERT UPDATE -->	"<<endl;
	cout<<"	"<<endl;
	cout<<"    <br>	"<<endl;
	cout<<"	"<<endl;
	cout<<"    <!-- fillter -->	"<<endl;
	cout<<"    <mat-form-field>	"<<endl;
	cout<<"      <input matInput (keyup)=\"applyFilter($event.target.value)\" [required]=\"'true'\" placeholder=\"Filter\">	"<<endl;
	cout<<"    </mat-form-field>	"<<endl;
	cout<<"	"<<endl;
	cout<<"    <!-- table -->	"<<endl;
	cout<<"    <div class=\"mat-elevation-z8\">	"<<endl;
	cout<<"      <table mat-table [dataSource]=\"dataSource\" matSort>	"<<endl;
	cout<<"	"<<endl;
	
	for(int i=0;i<result.size();i++){
		char firstUpper = toupper(result[i][0]);
		string uppercaseParam =  firstUpper + result[i].substr(1);
		
		cout<<"        <!-- "<<result[i]<<" Column -->	"<<endl;
		cout<<"        <ng-container matColumnDef=\""<<result[i]<<"\">	"<<endl;
		cout<<"          <th mat-header-cell *matHeaderCellDef mat-sort-header> "<<uppercaseParam<<" </th>	"<<endl;
		cout<<"          <td mat-cell *matCellDef=\"let element\"> {{element."<<result[i]<<"}} </td>	"<<endl;
		cout<<"        </ng-container>	"<<endl;
		cout<<"	"<<endl;
	}  
	 
	cout<<"        <tr mat-header-row *matHeaderRowDef=\"displayedColumns\"></tr>	"<<endl;
	cout<<"        <tr (dblclick)=\"onDblclickRowData(row)\" mat-row *matRowDef=\"let row; columns: displayedColumns;\"></tr>	"<<endl;
	cout<<"      </table>	"<<endl;
	cout<<"	"<<endl;
	cout<<"      <mat-paginator [pageSizeOptions]=\"[5, 10, 25, 100]\" showFirstLastButtons></mat-paginator>	"<<endl;
	cout<<"    </div>	"<<endl;
	cout<<"  </mat-card-content>	"<<endl;
	cout<<"	"<<endl;
	cout<<"</mat-card>	"<<endl;

}

/**
* gen css
*/
void genCss(string table, string tableUppercase, vector<string> result){ 
	string fileName =  table+ "/"+ table + ".component.scss";
	ofstream cout (fileName.c_str());
	  
	cout<<"table {	"<<endl;
	cout<<"    width: 100%;	"<<endl;
	cout<<"}	"<<endl;
	cout<<"	"<<endl;
	cout<<".mat-form-field {	"<<endl;
	cout<<"    font-size: 14px;	"<<endl;
	cout<<"    width: 100%;	"<<endl;
	cout<<"}	"<<endl;
	cout<<"	"<<endl;
	cout<<"td,	"<<endl;
	cout<<"th {	"<<endl;
	cout<<"    width: "<<floor(100/result.size())<<"%;	"<<endl;
	cout<<"}	"<<endl;
	cout<<"	"<<endl;
	cout<<".example-full-width {	"<<endl;
	cout<<"    width: 100%;	"<<endl;
	cout<<"}	"<<endl; 
}


/**
* gen component
*/
void genComponent(string table, string tableUppercase, vector<string> result){ 
	string fileName =  table+ "/"+ table + ".component.ts";
	ofstream cout (fileName.c_str());
	  
	cout<<"import { Component, OnInit, ViewChild, OnDestroy } from '@angular/core';	"<<endl;
	cout<<"import { MatPaginator } from '@angular/material/paginator';	"<<endl;
	cout<<"import { MatTableDataSource } from '@angular/material/table';	"<<endl;
	cout<<"import { MatSort, MatExpansionPanel } from '@angular/material';	"<<endl;
	cout<<"import { CrudFirebaseService } from '../../../common/api-service/crud-service';	"<<endl;
	cout<<"import { Subscription } from 'rxjs';"<<endl;
	cout<<"	"<<endl;
	cout<<"/**	"<<endl;
	cout<<" * @title Table CRUD "<<table<<" by PinkWays	"<<endl;
	cout<<" */	"<<endl;
	cout<<"@Component({	"<<endl;
	cout<<"  selector: 'app-"<<table<<"',	"<<endl;
	cout<<"  templateUrl: './"<<table<<".component.html',	"<<endl;
	cout<<"  styleUrls: ['./"<<table<<".component.scss']	"<<endl;
	cout<<"})	"<<endl;
	cout<<"export class "<<tableUppercase<<"Component implements OnInit, OnDestroy {	"<<endl;
	cout<<""<<endl;
	cout<<"  subscription: Subscription[] = [];"<<endl;
	cout<<""<<endl;
	cout<<"  // input data of table material	"<<endl;
	cout<<"  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;	"<<endl;
	cout<<"  @ViewChild(MatSort, { static: true }) sort: MatSort;	"<<endl;
	cout<<"  @ViewChild('matExpansionPanel', { static: true }) matExpansionPanel: MatExpansionPanel;	"<<endl;
	
	// cout<<"  displayedColumns: string[] = ['id', 'username', 'fullname', 'born', 'sex', 'email', 'phone', 'address', 'level'];	"<<endl;
	string param = "";
	for(int i=0;i<result.size();i++){
		if(i<result.size()-1){
			param +="'"+result[i]+"', ";
		}else{
			param +="'"+result[i]+"'";
		}
	}
	cout<<"  displayedColumns: string[] = ["<<param<<"];	"<<endl;
	
	cout<<"  dataSource = new MatTableDataSource<any>([]);	"<<endl;
	cout<<"	"<<endl;
	cout<<"  row: any = null;	"<<endl;
	cout<<"	"<<endl;
	cout<<"  // init input value	"<<endl;
	cout<<"  input: any = {	"<<endl;
	
	for(int i=1;i<result.size();i++){
		cout<<"    "<<result[i]<<": '',	"<<endl;
	} 
	
	cout<<"  };	"<<endl;
	cout<<"	"<<endl;
	cout<<"  /**	"<<endl;
	cout<<"   * constructor	"<<endl;
	cout<<"   * @param crudFirebase 	"<<endl;
	cout<<"   */	"<<endl;
	cout<<"  constructor(private crudFirebase: CrudFirebaseService) {	"<<endl;
	cout<<"	"<<endl;
	cout<<"  }	"<<endl;
	cout<<"	"<<endl;
	cout<<"  /**	"<<endl;
	cout<<"   * ngOnInit	"<<endl;
	cout<<"   */	"<<endl;
	cout<<"  ngOnInit() {	"<<endl;
	cout<<"    this.loadDataTable();	"<<endl;
	cout<<"  }	"<<endl;
	cout<<"	"<<endl;

	cout<<"  /**	"<<endl;
	cout<<"   * ngOnDestroy	"<<endl;
	cout<<"   */	"<<endl;
	cout<<"  ngOnDestroy() {	"<<endl;
	cout<<"    this.subscription.forEach(item => {"<<endl;
	cout<<"      item.unsubscribe();"<<endl;
	cout<<"    });"<<endl;
	cout<<"    this.subscription = [];"<<endl;
	cout<<"  }	"<<endl;
	cout<<"	"<<endl;

	cout<<"  /**	"<<endl;
	cout<<"   * apply Filter for search	"<<endl;
	cout<<"   * @param filterValue 	"<<endl;
	cout<<"   */	"<<endl;
	cout<<"  applyFilter(filterValue: string) {	"<<endl;
	cout<<"    this.dataSource.filter = filterValue.trim().toLowerCase();	"<<endl;
	cout<<"	"<<endl;
	cout<<"    if (this.dataSource.paginator) {	"<<endl;
	cout<<"      this.dataSource.paginator.firstPage();	"<<endl;
	cout<<"    }	"<<endl;
	cout<<"  }	"<<endl;
	cout<<"	"<<endl;
	cout<<"  /**	"<<endl;
	cout<<"   * load Data Table	"<<endl;
	cout<<"   */	"<<endl;
	cout<<"  loadDataTable() {	"<<endl;
	cout<<"    this.subscription.push(this.crudFirebase.getAllDataFrom"<<tableUppercase<<"().subscribe((data) => {	"<<endl;
	cout<<"      // set data for table 	"<<endl;
	cout<<"      this.dataSource = new MatTableDataSource<any>(this.crudFirebase.convertData(data));	"<<endl;
	cout<<"      this.dataSource.paginator = this.paginator;	"<<endl;
	cout<<"      this.dataSource.sort = this.sort;	"<<endl;
	cout<<"    }));"<<endl;
	cout<<"  }	"<<endl;
	cout<<"	"<<endl;
	cout<<"  /**	"<<endl;
	cout<<"   * onClickInsert	"<<endl;
	cout<<"   */	"<<endl;
	cout<<"  onClickInsert() {	"<<endl;
	cout<<"    // insert data to database	"<<endl;
	cout<<"    this.crudFirebase.insertDataTo"<<tableUppercase<<"(this.input);	"<<endl;
	cout<<"	"<<endl;
	cout<<"    // collapse input form	"<<endl;
	cout<<"    this.matExpansionPanel.expanded = false;	"<<endl;
	cout<<"	"<<endl;
	cout<<"    // clear data input	"<<endl;
	cout<<"    this.clearDataInput();	"<<endl;
	cout<<"  }	"<<endl;
	cout<<"	"<<endl;
	cout<<"  /**	"<<endl;
	cout<<"   * on double click row data	"<<endl;
	cout<<"   * @param row 	"<<endl;
	cout<<"   */	"<<endl;
	cout<<"  onDblclickRowData(row) {	"<<endl;
	cout<<"    // save data	"<<endl;
	cout<<"    this.row = row;	"<<endl;
	cout<<"	"<<endl;
	cout<<"    // open and fill data to input form	"<<endl;
	cout<<"    this.input = {	"<<endl;
	
	for(int i=1;i<result.size();i++){
		cout<<"      "<<result[i]<<": row."<<result[i]<<",	"<<endl;
	} 
	
	cout<<"    };	"<<endl;
	cout<<"	"<<endl;
	cout<<"    this.matExpansionPanel.expanded = true;	"<<endl;
	cout<<"	"<<endl;
	cout<<"    // scroll to top	"<<endl;
	cout<<"    window.scrollTo({ left: 0, top: 0, behavior: 'smooth' });	"<<endl;
	cout<<"  }	"<<endl;
	cout<<"	"<<endl;
	cout<<"  /**	"<<endl;
	cout<<"   * onClickUpdate	"<<endl;
	cout<<"   */	"<<endl;
	cout<<"  onClickUpdate() {	"<<endl;
	cout<<"    if (this.row.id) {	"<<endl;
	cout<<"      // update id of input	"<<endl;
	cout<<"      this.input.id = this.row.id;	"<<endl;
	cout<<"	"<<endl;
	cout<<"      // update data to database 	"<<endl;
	cout<<"      this.crudFirebase.updateData"<<tableUppercase<<"(this.input);	"<<endl;
	cout<<"	"<<endl; 
	cout<<"      // collapse input form	"<<endl;
	cout<<"      this.matExpansionPanel.expanded = false;	"<<endl; 
	cout<<"	"<<endl;
	cout<<"      // clear data input	"<<endl;
	cout<<"      this.clearDataInput();	"<<endl;
	cout<<"    }	"<<endl;
	cout<<"  }	"<<endl;
	cout<<"	"<<endl;
	cout<<"  /**	"<<endl;
	cout<<"   * onClickDelete	"<<endl;
	cout<<"   */	"<<endl;
	cout<<"  onClickDelete() {	"<<endl;
	cout<<"    if (this.row.id) {	"<<endl;
	cout<<"      // update data to database 	"<<endl;
	cout<<"      this.crudFirebase.deleteData"<<tableUppercase<<"(this.row.id);	"<<endl;
	cout<<"	"<<endl;
	cout<<"      // collapse input form	"<<endl;
	cout<<"      this.matExpansionPanel.expanded = false;	"<<endl;
	cout<<"	"<<endl;
	cout<<"      // clear data input	"<<endl;
	cout<<"      this.clearDataInput();	"<<endl;
	cout<<"    }	"<<endl;
	cout<<"  }	"<<endl;
	cout<<"	"<<endl;
	cout<<"  /**	"<<endl;
	cout<<"   * clear data input	"<<endl;
	cout<<"   */	"<<endl;
	cout<<"  clearDataInput() {	"<<endl;
	cout<<"    this.input = {	"<<endl;
	
	for(int i=1;i<result.size();i++){
		cout<<"      "<<result[i]<<": '',	"<<endl;
	}
 
	cout<<"    };	"<<endl;
	cout<<"  }	"<<endl;
	cout<<"}	"<<endl; 
}

/**
* gen module
*/
void genModule(string table, string tableUppercase, vector<string> result){ 
	string fileName =  table+ "/"+ table + ".module.ts";
	ofstream cout (fileName.c_str());
	  
	cout<<"	import { NgModule } from '@angular/core';	"<<endl;
	cout<<"	import { CommonModule } from '@angular/common';	"<<endl;
	cout<<"	import { RouterModule } from '@angular/router';	"<<endl;
	cout<<"	import { "<<tableUppercase<<"Component } from './"<<table<<".component';	"<<endl;
	cout<<"	import { ApiService } from '../../../common/api-service/api.service';	"<<endl;
	cout<<"		"<<endl;
	cout<<"	import { 	"<<endl;
	cout<<"	  MatButtonModule, 	"<<endl;
	cout<<"	  MatCardModule, 	"<<endl;
	cout<<"	  MatExpansionModule,	"<<endl;
	cout<<"	  MatGridListModule, 	"<<endl;
	cout<<"	  MatInputModule, 	"<<endl;
	cout<<"	  MatPaginatorModule, 	"<<endl;
	cout<<"	  MatSortModule, 	"<<endl;
	cout<<"	  MatTableModule,	"<<endl;
	cout<<"	} from '@angular/material'; 	"<<endl;
	cout<<"import { FormsModule, ReactiveFormsModule } from '@angular/forms';	"<<endl;
	cout<<"	"<<endl;
	cout<<"@NgModule({	"<<endl;
	cout<<"  declarations: ["<<tableUppercase<<"Component],	"<<endl;
	cout<<"  imports: [	"<<endl;
	cout<<"    CommonModule,	"<<endl;
	cout<<"    FormsModule,	"<<endl;
	cout<<"    ReactiveFormsModule,	"<<endl;
	cout<<"    	"<<endl;
	cout<<"    RouterModule.forChild([	"<<endl;
	cout<<"      {	"<<endl;
	cout<<"        path: '', component: "<<tableUppercase<<"Component	"<<endl;
	cout<<"      },	"<<endl;
	cout<<"    ]),	"<<endl;
	cout<<"    MatButtonModule,	"<<endl;
	cout<<"    MatCardModule,	"<<endl;
	cout<<"    MatExpansionModule,	"<<endl;
	cout<<"    MatGridListModule,	"<<endl;
	cout<<"    MatInputModule,	"<<endl;
	cout<<"    MatPaginatorModule,	"<<endl;
	cout<<"    MatSortModule,	"<<endl;
	cout<<"    MatTableModule,	"<<endl;
	cout<<"  ],	"<<endl;
	cout<<"  providers: [ApiService]	"<<endl;
	cout<<"})	"<<endl;
	cout<<"export class "<<tableUppercase<<"Module { }	"<<endl; 

}

int main(){
	ifstream cin ("input.txt");
	
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
		
		// create directory
		int check; 
	    string dirname = table;  
	    mkdir(dirname.c_str());    
		
		// gen html 
		genHtml(table, tableUppercase, result);
		
		// gen css
		genCss(table, tableUppercase, result); 
		
		// gen component
		genComponent(table, tableUppercase, result);
		
		// gen module
		genModule(table, tableUppercase, result);
		
	} 
	return 0;
}

