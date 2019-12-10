                              
;* 161044105 HALİL İBRAHİM KÖSE  *

 #include <ctype.h>
 
%{ 
int 	EXIT = 0;
%} 

keywords("and"|"or"|"not"|"equal"|"less"|"nil"|"list"|"append"|"concat"|"set"|"deffun"|"for"|"if"|"exit"|"load"|"disp"|"true"|"false")

value_zero([ 0 ])

value([1-9][0-9]*)

id([a-zA-Z][a-zA-Z0-9]*" "*)

operators("+"|"-"|"/"|"*"|"("|")"|"**"|",")


/*** Rule Section has three rules ***/

%% 


"+"  {printf("OP_PLUS\n");}
"-"  {printf("OP_MINUS\n");}
"/"	 {printf("OP_DIV\n");}
"*"  {printf("OP_MULT\n");}
"("  {printf("OP_OP\n");}
")"  {printf("OP_CP\n");}
"\"" {printf("OP_CO\n");}
"**" {printf("OP_DBLMULT\n");}
","  {printf("OP_COMMA\n");}
"“" {printf("OP_CO\n");}
"”" {printf("OP_CC\n");}
;;.* {printf("COMMENT\n");}

{keywords}" "+ {printf("KW_");
				if(!(strncmp(yytext, "exit", 4)))
					EXIT = 1;
				while(yytext[0])
					printf("%c", yytext++[0]-32);
				printf("\n");

				if(EXIT){
					printf("EXIT\n");
					return 0;
				}}	


{id}				{	
						printf("IDENTIFIER\n");
					}
							

{value}				{
						printf("VALUE\n");
					}

{value_zero}		
{
						printf("VALUE\n");
					}

[ \t\n]+				{}


{value}{id}			{
						printf("SYNTAX_ERROR %s\n", yytext);
					}


.	 				{
						printf("SYNTAX_ERROR %s\n", yytext);
					} 
<<EOF>>		{return 0;} 
%% 


int yywrap(){} 
int main(){ 



yylex(); 

return 0; 
} 

