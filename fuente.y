%{
/* fichero instrucciones.y */ 
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}
%token IDENTIFICADOR OPAS CONSTENTERA NL MAS APAR CPAR 
%start instrucciones
%%
instrucciones: instrucciones instruccion | instruccion ;
instruccion: IDENTIFICADOR OPAS expresion NL ;
expresion: termino | expresion MAS termino ;
termino: IDENTIFICADOR | CONSTENTERA | APAR expresion CPAR ;
%%
void yyerror(char *s)
{
printf("%s\n",s);
}
int main(){
yyparse();
/*Acciones a ejecutar después del análisis*/
}