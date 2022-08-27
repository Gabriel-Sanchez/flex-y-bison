%{
/* fichero instrucciones.y */ 
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
extern int yylineno;
extern int column;
#define YYERROR_VERBOSE 1
%}
%token IDENTIFICADOR OPAS CONSTENTERA NL MAS APAR CPAR P_PRINTF COMILLA S_SCANF DECIMAL START_COM END_COM
%start instrucciones
%%
instrucciones: instrucciones instruccion | instruccion ;
instruccion: IDENTIFICADOR OPAS expresion NL | PRINT NL | COMMENT NL ;
expresion: termino | expresion MAS termino | DECIMAL;
termino: IDENTIFICADOR | CONSTENTERA | APAR expresion CPAR ;
PRINT: IN_OUT APAR COMILLA CAD COMILLA CPAR;
IN_OUT: P_PRINTF | S_SCANF;
COMMENT: START_COM CAD END_COM ;
CAD: TEXT ;
TEXT: TEXT IDENTIFICADOR | IDENTIFICADOR | TEXT CONSTENTERA | TEXT DECIMAL | CONSTENTERA | DECIMAL; ;
%%
void yyerror(const char *str)
{
    fprintf(stderr,"Error: %s en la linea %d, columna %d\n", str, yylineno, column);
}
int main()
{
   yyparse();
}