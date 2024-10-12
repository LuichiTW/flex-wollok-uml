cd src/
flex scanner.l
gcc main.c scanner.c -lfl -o program
cd ..
./src/program > salida.plantuml
