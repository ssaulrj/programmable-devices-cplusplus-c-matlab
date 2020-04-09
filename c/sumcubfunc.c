//El programa llama la funci¢n ASM sumcubfunc, suma c£bica de los primeros 5 n£meros
#include <stdio.h>
void main()
{
short n = 5;                                  //Ajustar el valor n
short result;                                 //resultado de la funci¢n asm
result = sumcubfunc(n);                         //llamado a la funci¢n asm
printf("Suma subica = %d", result);    //Impresi¢n del resultado de la funci¢n asm
}
