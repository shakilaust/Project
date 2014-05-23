    /* Bismillahir Rahmanir Rahim */
%{
    #include <stdio.h>
    #include <stdlib.h>    
%}

%%

"int"      {                
              printf("%s -> Integer type Data Type\n", yytext);
          }
"float"	{
		printf("%s -> Floating type Data Type\n", yytext);
	}
"double"	{
		printf("%s ->Double type Data Type\n", yytext);
	}
"char"	{
		printf("%s ->Char type Data Type\n", yytext);
	}
"long long int"    {                
              printf("%s -> Long Integer type Data Type\n", yytext);
          }
"long double"    {                
              printf("%s -> Long double type Data Type\n", yytext);
          }
"unsigned long long int"    {                
              printf("%s -> unsigned long long int type Data Type\n", yytext);
          }

"short"  {                
              printf("%s -> Short integer type Data Type\n", yytext);
        }
([a-z])* { 
		printf("%s -> Not a data type\n", yytext);
	 }
([0-9])* { 
		printf("%s -> Not a data type\n", yytext);
	 }
	 
([(-/!@#$%^&*()=-?:"'])* {}
([;->])* {}
([a-z])([+])([0-9])*   { 
		printf("%s -> Not a data type\n", yytext);
	 }     	 
[ \t\n] {}


%%

int yywrap(void) {
    return 1;
}

int main(int argc , char *argv[]) {
    FILE *f;
	f = fopen("input.txt","r");
	yyin = f;
    yylex();
	fclose(yyin);
    return 0;
}
