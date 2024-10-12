#include <stdio.h>
#include <stdlib.h>
#include <string.h>    
#include <dirent.h>    

#include "tokens.h"
#include "scanner.h"
// scanner.l

// ! bug en el override method no lo toma

int main()
{
  enum token t;
  while ((t = yylex()) != FDT)
  {
    switch (t)
    {
    case INHERITS:
      char *token = strtok(yytext, " ");
      token = strtok(NULL, " ");
      printf("%s ", token);

      printf("--|> ");
      if ((t = yylex()) == NOMBRE_VAR)
      {
        printf("%s\n", yytext);
        printf("class %s{\n", token);
      }
      break;
    case CLASS:
      if ((t = yylex()) == NOMBRE_VAR)
      {
        printf("class %s{\n", yytext);
      }
      break;
    case OBJECT:
      if ((t = yylex()) == NOMBRE_VAR)
      {
        printf("object %s{\n", yytext);
      }
      break;
    case VAR:
      if ((t = yylex()) == NOMBRE_VAR)
      {
        char *token = strtok(yytext, "=");
        printf("-%s\n", token);
      }
      break;
    case METHOD:
      if ((t = yylex()) == NOMBRE_METHOD)
      {
        char *token = strtok(yytext, "=");
        token = strtok(token, "{");
        printf("+%s\n", token);
      }
      break;
    default:
      break;
    }
  }
  return 0;
}
