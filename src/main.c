#include <stdio.h>
#include <stdlib.h>
#include <string.h>    
#include <dirent.h>    

#include "tokens.h"
#include "scanner.h"
// scanner.l

int main()
{
  DIR *dir;
  struct dirent *ent;


  dir = opendir(".");
  if(dir == NULL){
    perror("error al abrir carpeta");
    return 1;
  }

  enum token t;

  printf("@startuml salida\n");

  while ((ent = readdir(dir)) != NULL) {
    //verificar si es un archivo .wlk
    if (ent->d_type == DT_REG){
      int longitud = strlen(ent->d_name);
      if (longitud >= 4 && strcmp(&ent->d_name[longitud - 4], ".wlk") == 0) {
        char *nombre = ent->d_name;

        //abre el archivo en lectura
        if(freopen(nombre, "r", stdin) == NULL){
          printf("error al abrir archivo");
          return 1;
        }

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

      }
    }
  }
  printf("@enduml \n");
  return 0;
}
