%{
	#include zoomjoystrong.tab.lex
	#include stdlib.h
%}

%%

[0-9]+				{yylval.i = atoi(yytext); return INT;}
[0-9]+\.[0-9]+			{yylval.f = atoi(yytext); return FLOAT;}
\;				{yylVal.str = strdup(yytext);
					return END_STATEMENT;}
END				{yylVal.str = strdup(yytext); return END;}
[lL]ine				{yylVal.str = strdup(yytext); return LINE;}
[cC]ircle			{yylVal.str = strdup(yytext); return CIRCLE;}
[rR]ectangle			{yylVal.str = strdup(yytext); return RECTANGLE;}
[pP]oint			{yylVal.str = strdup(yytext); return POINT;}
[sS]et\_[cC]olor		{yylVal.str = strdup(yytext); return SET_COLOR;}
[ \t\n]				;
.				{printf("unexpected entry");}


%%
