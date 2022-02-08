%option noyywrap
%{
#include "HW3_1.tab.h"
%}

%%
\n        {}
[ \t]+	  {}
"load"	{ return LOAD; }
"add" 	{ return ADD; }
"sub"	{ return SUB; }
"mul"	{ return MUL; }
"mod"	{ return MOD; }
"inc"	{ return INC; }
"dec"	{ return DEC; }
[0-9]+	{ yylval.ival = atoi(yytext); return( INUMBER ); }
.		{ return( yytext[0] ); }
%%