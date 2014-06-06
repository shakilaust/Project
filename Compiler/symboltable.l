/*Bismiahir Rahmanir Rahim*/
%{
	#include<stdio.h>
    #include<stdlib.h>
    #include<string.h>
	#include<math.h>
	#include<map>
	#include<iostream>
	#include<vector>
	using namespace std;

        
     int yyval = 0;
     
    int idx = 0;
	int i , j  , tmp , sz;
	
	struct abc
	{
	    string name , type , value ;
	    
	}inp[100005];
	map < string , int > mp;
	bool inttype = false , floattype = false , chartype = false , doubletype = false; 
	bool flag = true;
	bool euqalsign = false;
	bool printfstart = false;
	bool rt = true;
	bool pt = true;
	bool semi = true;
	bool valueinsert = false;
	string str = "" ;
	string add = "";
	string valueadd = "";
	
	vector <string> ptf;
    
%}


/* matching string */

printf "printf"
int "int"
float "float"
double "double"
char "char"
main "main"
return "return"
if "if"
else "else"
for "for"
while "while"
switch "switch"
case "case"
do "do"
continue "continue"
break "break"
space " "




digit [0-9]+
floatingpoint [0-9]+\.[0-9]+
variable [A-Za-z]+[0-9]*[A-Za-z]*




%%
{int} {
         inttype = true ;
		 floattype = false;
		 chartype = false;
		 doubletype = false;
         str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "int" ;
		   inp[idx].type = "keyword: Data Type";
		   inp[idx].value = "NA";
		   
		 }
       }
{float} {
         inttype = false;
		 floattype = true;
		 chartype = false;
		 doubletype = false;
         str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "float" ;
		   inp[idx].type = "keyword: Data Type";
		   inp[idx].value = "NA";
		   
		 }
       }
{char} {
         inttype = false ;
		 floattype = false;
		 chartype = true;
		 doubletype = false;
         str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "char" ;
		   inp[idx].type = "keyword: Data Type";
		   inp[idx].value = "NA";
		   
		 }
       }
{double} {
         inttype = false ;
		 floattype = false;
		 chartype = false;
		 doubletype = true ;
         str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "double" ;
		   inp[idx].type = "keyword: Data Type";
		   inp[idx].value = "NA";
		   
		 }
       }
{main} {
        str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "main" ;
		   inp[idx].type = "Identifier: Function";
		   inp[idx].value = "NA";
		   
		 }
        }
{return} {
        str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "return" ;
		   inp[idx].type = "keyword	";
		   inp[idx].value = "NA";
		   
		 }
		 rt = true;
		 flag = false;
        }
{if} {
        str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "if" ;
		   inp[idx].type = "keyword	";
		   inp[idx].value = "NA";
		   
		 }
        }
{else} {
        str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "else" ;
		   inp[idx].type = "keyword	";
		   inp[idx].value = "NA";
		   
		 }
        }
{for} {
        str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "for" ;
		   inp[idx].type = "keyword	";
		   inp[idx].value = "NA";
		   
		 }
        }
{switch} {
        str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "switch" ;
		   inp[idx].type = "keyword	";
		   inp[idx].value = "NA";
		   
		 }
        }
{case} {
        str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "case" ;
		   inp[idx].type = "keyword	";
		   inp[idx].value = "NA";
		   
		 }
        }

{do} {
        str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "do" ;
		   inp[idx].type = "keyword	";
		   inp[idx].value = "NA";
		   
		 }
        }
{continue} {
        str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "continue" ;
		   inp[idx].type = "keyword	";
		   inp[idx].value = "NA";
		   
		 }
        }
{break} {
        str = (string)yytext;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "break" ;
		   inp[idx].type = "keyword	";
		   inp[idx].value = "NA";
		   
		 }
        }
{printf} {
        pt = true;
        flag = false;
		printfstart = true;
		valueinsert = true;
		add = "";
        str = (string)yytext;
		//cout<<yytext<<endl;
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = "printf" ;
		   inp[idx].type = "keyword : function	";
		   inp[idx].value = "NA";
		   
		 }
        }

"=" {
 if(printfstart) add += (string)yytext;
   euqalsign = true;
}
"%d"|"%f"|"%lf"|"%c"|"%s"|"\n" { if(printfstart) add += (string)yytext;
}
{variable} {
        if(printfstart) { add += (string)yytext; ptf.push_back((string)yytext);}
		
		
        if(flag == false ) continue;
        str = (string)yytext;
		
         if(mp[str]==0)
		 {
		   mp[str] = ++idx;
		   inp[idx].name = str;
		  
		   if(inttype)
		   inp[idx].type= "Identifier: Integer" ;
		   else if(floattype)
		   inp[idx].type= "Identifier: Floating_Point" ;
		   else if(doubletype)
		   inp[idx].type= "Identifier: Double" ;
		   else if(chartype)
		   inp[idx].type= "Identifier: Char" ;
		   inp[idx].value = "NA";
		   
		 }
		 tmp = mp[str];
		 // if(printfstart) add += (string)yytext;
        }
["] {
//cout<<"ADD size"<<add.size()<<endl;

  if(printfstart == false) { printfstart == true; add += (string)yytext; }
  else { printfstart == false;
     semi = false;
       if(add.size())
	 {
	  
	   if(mp[add]==0)
		 {
		   mp[add] = ++idx;
		   inp[idx].name = add ;
		   inp[idx].type = "constant : string";
		   cout<<"sz" <<ptf.size()<<endl;
		  sz = add.size();
		   j = 0 ;
		   valueadd = "";
		   for ( i = 0 ; i < sz ; i++ )
		   {
		      if(add[i]=='%' && i+1<sz && add[i+1]=='d')
			  {
			     valueadd += inp[mp[ptf[j]]].value;
				 
				 j++;
				 i++;
			  }
			  else if(add[i]=='%' && i+1<sz && add[i+1]=='f')
			  {
			      valueadd += inp[mp[ptf[j]]].value;
				 j++;
				 i++;
			  }
			  else if(add[i]=='%' && i+1<sz && add[i+1]=='c')
			  {
			      valueadd += inp[mp[ptf[j]]].value;
				 j++;
				 i++;
			  }
			   else if(add[i]=='%' && i+2<sz && add[i+1]=='l' && add[i+2]=='f')
			  {
			      valueadd += inp[mp[ptf[j]]].value;
				 j++;
				 i++;
				 i++;
			  }
			  else valueadd += add[i];
		   }
		   ptf.clear();
		   inp[idx].value = valueadd;
	 }
	 }
	 }
	
}
")" {
  
    valueinsert = false;
   pt = false;

}
"{"|"}" {
}
"," {
   
    if(printfstart) add += (string)yytext;
}
";" {
         if(printfstart) add += (string)yytext;
         inttype = false ;
		 floattype = false;
		 chartype = false;
		 doubletype = false;
		 printfstart = false;
}
{digit} {
 if(printfstart) add += (string)yytext;
if(rt == false) continue ;
if(flag == false) continue;
	if(euqalsign) {
	inp[tmp].value = (string)yytext ;
	euqalsign = false;
	}
}
{space} {
  if(printfstart) add += (string)yytext;
}
{floatingpoint} {
 if(printfstart) add += (string)yytext;

if(rt == false ) continue;
if(flag==false) continue;
if(euqalsign) {
inp[tmp].value = (string)yytext ;
euqalsign = false ; }
}
[ \t\n]+ {}

%%

int yywrap()
{
	return 1;
}


int main(int argc, char *argv[]) {
	yyin = fopen(argv[1], "r");
	yylex();
	
    printf("\nToken\tName\tType\t\tValue\n");
	for ( i = 1 ; i <= idx ; i++ )
	cout<<i<<"\t"<<inp[i].name<<"\t"<<inp[i].type<<"\t"<<inp[i].value<<endl;
	fclose(yyin);
}
