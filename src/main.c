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

      case METHOD:
        break;
      case VAR:
        break;
      case INHERITS:
        break;
      case CLASS:
        break;
      case OBJECT:
        break;
      default:
        break;
    }
  }
  return 0;
}
