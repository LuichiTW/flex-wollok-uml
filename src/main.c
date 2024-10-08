#include <stdio.h>
#include <stdlib.h>
#include <string.h>    
#include <dirent.h>    

#include "tokens.h"

int main(){
  enum token t;
  while ( (t = yylex()) != FDT)
  {
    switch (t)
    {
      case METHOD:
        break;
      default:
        break;
    }
  }
  return 0;
}
