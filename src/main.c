#include <stdio.h>
#include <stdlib.h>
#include <string.h>    
#include <dirent.h>    

#include "tokens.h"
// scanner.l

int main(){
  enum token t;
  while ( (t = yylex()) != FDT)
  {
    switch (t)
    {
      case INHERITS:
        if ((t = yylex()) == NOMBRE) {
        }
        break;
      case CLASS:
        if ((t = yylex()) == NOMBRE) {
        }
        break;
      case OBJECT:
        if ((t = yylex()) == NOMBRE) {
        }
        break;
      case VAR:
        if ((t = yylex()) == NOMBRE) {
        }
        break;
      case METHOD:
        if ((t = yylex()) == NOMBRE) {
        }
        break;
      default:
        break;
    }
  }
  return 0;
}
