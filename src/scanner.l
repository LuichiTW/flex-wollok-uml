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

nocero  [1-9]
digdec  [0-9]
letra   [a-zA-Z]
operador [*\/%+-]
caracterPuntuacion [()\.;,]
inval   [:!\x22#$&\x27#<=>?@^_`~]
/*         \x22 son comillas dobles y \x27 son comillas simples */

%%

{comentario}|\n|.   {;}



