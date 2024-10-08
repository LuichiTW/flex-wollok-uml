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

nocero  [1-9]
digdec  [0-9]
letra   [a-zA-Z]
operador [*\/%+-]
caracterPuntuacion [()\.;,]
inval   [:!\x22#$&\x27#<=>?@^_`~]
/*         \x22 son comillas dobles y \x27 son comillas simples */

%%
"programa"|"fin"|"leer"|"escribir"  {return PALABRA_RES;}
{nocero}{digdec}+   {return CONSTANTE;}
{letra}({letra}|{digdec})*  {return IDENTIFICADOR;}
{caracterPuntuacion} {return CARACTER_PUNT;} 
{comentario}|\n|\t|\0|\r|\s|" "    {;}
{operador}  {return OPERADOR;}
":="    {return ASIGNACION;}
{nocero}({digdec}|{letra})*   {return CONSTANTE_INV;}
{letra}{inval}*({inval}|{digdec}|{letra})+   {return IDENTIFICADOR_INV;}
{inval}+    {return CADENA_DESC;}

