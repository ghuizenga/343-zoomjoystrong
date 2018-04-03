%{
	#include <stdio.h>
	void yyerror(const char* msg);
	int yylex();
%}

%error-verbose
%start statement_list

%union {int i; char* str; float f;}



%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token INT
%token FLOAT

%type<i> INT
%type<float> FLOAT
%type<str> POINT
%type<str> LINE
%type<str> CIRCLE
%type<str> RECTANGLE
%type<str> SET_COLOR

%%

statement_list:		statement END
	 |		statement statement_list
;

statement:		POINT INT INT END_STATEMENT {point($2, $3);}
	 |		LINE INT INT INT INT END_STATEMENT {
						line($2, $3, $4, $5);}
	 |		CIRCLE INT INT INT END_STATEMENT {
						circle($2, $3, $4);}
	 |		RECTANGLE INT INT INT INT END_STATEMENT {
						rectangle($2, $3, $4, $5);}
	 |		SET_COLOR INT INT INT END_STATEMENT {
						set_color($2, $3, $4);}
;






%%

int main(int argc, char** argv){
	yyparse();
	return 0;
}

void yyerror(const char* msg){
	fprintf(stderr, "ERROR! %s\n", msg);
}
