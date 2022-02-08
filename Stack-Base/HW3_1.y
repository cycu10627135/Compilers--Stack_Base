%{
#include <stdio.h>
#include <string.h>
#include <math.h>

int a;
int b = 1;
int yylex();
void yyerror(const char *message);
%}
%union {
int ival;
}
%token LOAD
%token ADD
%token SUB
%token MUL
%token MOD
%token INC
%token DEC
%token <ival> INUMBER
%type <ival> exp

%%
input : exp { a = $1; }
	; 
exp : LOAD INUMBER	{ $$ = $2; }
	| exp exp ADD	{ $$ = $2 + $1; }
	| exp exp SUB	{ $$ = $2 - $1; }
	| exp exp MUL	{ $$ = $2 * $1; }
	| exp exp MOD	{ $$ = $2 % $1; }
	| exp INC	{ $$ = $1 + 1 ; }
	| exp DEC	{ $$ = $1 - 1 ; }
   ; 
%%
void yyerror ( const char *message )
{
	b = 0;
        
}
int main(int argc, char *argv[]) {
        yyparse();
	if ( b == 1 ) {
		printf( "%d\n", a );
	} // if
	else {
		printf ( "Invalid format\n" );
	} // else

        return(0);
}