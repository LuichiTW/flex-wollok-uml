%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"
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
nombre {.}*

%%

{comentario}|\n|.   {;}
{objeto}  {return OBJECT;}
{class} {return CLASS;}
{variable}" "{property}? {return VAR;}
{method}  {return METHOD;}
{nombre}{cierre}  {return NOMBRE;}



