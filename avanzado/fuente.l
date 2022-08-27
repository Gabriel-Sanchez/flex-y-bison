/* fichero instrucciones.l */
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"/* GENERADO AUTOMÁTICAMENTE POR BISON */ 
extern int yylval;
static int next_column = 0;
int column = 0;
#define HANDLE_COLUMN column = next_column; next_column += strlen(yytext)
%}
%option noyywrap noinput nounput yylineno
separador ([ \t"""])+
letra [a-zA-Z]
digito [0-9]
identificador {letra}({letra}|{digito})*
constEntera {digito}({digito})*
decimal [0-9]+"."[0-9]+
%%
"\""            {HANDLE_COLUMN; yylval = atoi(yytext); return (COMILLA);}
"\/*"           {HANDLE_COLUMN; yylval = atoi(yytext); return (START_COM);}
"\*/"           {HANDLE_COLUMN; yylval = atoi(yytext);return (END_COM);}
{separador}     {HANDLE_COLUMN; yylval = atoi(yytext);/* omitir */}
{constEntera}   {HANDLE_COLUMN; yylval = atoi(yytext); return (CONSTENTERA);}
{decimal}       {HANDLE_COLUMN; yylval = atoi(yytext);return (DECIMAL);}
":="            {HANDLE_COLUMN; yylval = atoi(yytext);return (OPAS);}
"+"             {HANDLE_COLUMN; yylval = atoi(yytext);return (MAS);}
"printf"        {HANDLE_COLUMN; yylval = atoi(yytext);return (P_PRINTF);}
"scanf"         {HANDLE_COLUMN; yylval = atoi(yytext);return (S_SCANF);}
{identificador} {HANDLE_COLUMN; yylval = atoi(yytext);return (IDENTIFICADOR);}
"("             {HANDLE_COLUMN; yylval = atoi(yytext);return (APAR);}
")"             {HANDLE_COLUMN; yylval = atoi(yytext);return (CPAR);}
\n              {HANDLE_COLUMN; next_column = 1; return (NL);}
.               {HANDLE_COLUMN; return yytext[0]; }
%%