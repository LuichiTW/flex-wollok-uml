%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"

int contador = 0;
%}

%option noinput
%option nounput
%option outfile="scanner.c"
%option header-file="scanner.h"

/*comando para compilar*/
/*flex scanner.l*/

comentario "//".*\n
cierre " "|"="|"{"
variable "var"|"const"
method "method"
property "property"
objeto "object"
class "class"
inherits "inherits"
nombre {letras}({letras}|{numeros})*

letras [a-zA-Z]
numeros [0-9]

%%

{comentario}|\n|.   {;}
"{" {contador++;}
"}" {contador--;}
{{objeto}|{class}}" "{nombre}" "{inherits} {return INHERITS;}
{objeto}  {return OBJECT;}
{class} {return CLASS;}
{variable}" "{property}? {return if(contador == 0) ? INVAL : VAR;}
{method}  {return METHOD;}
{nombre}{cierre}  {contador++, return NOMBRE;}



