%{
	#include "zoomjoystrong.tab.h"
	#include <stdlib.h>
%}

%option noyywrap

%%

[0-9]+				{yylval.i = atoi(yytext); return INT;}
[0-9]+\.[0-9]+			{yylval.f = atoi(yytext); return FLOAT;}
\;				{yylval.str = strdup(yytext);
					return END_STATEMENT;}
END				{yylval.str = strdup(yytext); return END;}
[lL]ine				{yylval.str = strdup(yytext); return LINE;}
[cC]ircle			{yylval.str = strdup(yytext); return CIRCLE;}
[rR]ectangle			{yylval.str = strdup(yytext); return RECTANGLE;}
[pP]oint			{yylval.str = strdup(yytext); return POINT;}
[sS]et\_[cC]olor		{yylval.str = strdup(yytext); return SET_COLOR;}
[ \t\n]				;
.				{printf("unexpected entry");}


%%
