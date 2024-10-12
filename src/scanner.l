%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"

int contador = 0;
%}

%option noinput
%option nounput
%option noyywrap
%option outfile="scanner.c"
%option header-file="scanner.h"

/*comando para compilar*/
/*flex scanner.l*/

comentario "//".*\n
cierre " "|"="|\n
variable "var"|"const"
method "method"
override "override"
property "property"
objeto "object"
class "class"
inherits "inherits"
nombreMethod {letras}({letras}|{numeros}|" "|[\(,])*")"
nombreVar {letras}({letras}|{numeros})*

letras [a-zA-Z]
numeros [0-9]


%%

"{" {contador++;}
"}" {contador--; (contador == 0)? printf("}\n") : printf("\0");}
{objeto}  {return OBJECT;}
{class}  {return CLASS;}
{variable}" "{property}? {return (contador == 0) ? INVAL : VAR;}
"override method"  {return METHOD;}
{override}?" "?{method}  {return METHOD;}
{nombreVar} {return NOMBRE_VAR;}
{nombreMethod}  {return NOMBRE_METHOD;} 
({objeto}|{class})" "{nombreVar}" "{inherits} {return INHERITS;}
{comentario}|\n|.   {;}
