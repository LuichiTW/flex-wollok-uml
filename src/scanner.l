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
variable "var"|"const"
method  "override "?"method"
override "override"
property "property"
objeto "object"
class "class"
inherits "inherits"
nombreMethod {letras}({letras}|{numeros}|", "|[\(,])*")"
nombreVar {letras}({letras}|{numeros})*

letras [a-zA-Z]
numeros [0-9]


%%

{objeto}  {return OBJECT;}
{class}  {return CLASS;}
{method}  {return METHOD;}
{nombreMethod}  {return NOMBRE_METHOD;} 
{variable}" "{property}? {return (contador == 0) ? INVAL : VAR;}
{nombreVar} {return NOMBRE_VAR;}
({objeto}|{class})" "{nombreVar}" "{inherits} {return INHERITS;}
"{" {contador++;}
"}" {contador--; (contador == 0)? printf("}\n") : printf("\0");}
{comentario}|\n|\t|.   {;}
