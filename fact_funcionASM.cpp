
//factorial.c Encuentra n(n-1)(n-2)...1. 
//El programa llama a la function factfunc.asm
 #include <stdio.h> 

void main()
{
	short j = 0;   
	short i = 0;                                     //Ajustar el valor n
	short result; 

	printf("Corriendo rutina en ensamblador");
	for(i = 8; i <= 12; i++){
		result = factfunc(i);                           //llamado a la función asm
		printf("(SMB) factorial = %d", result);
	} 

	printf("Corriendo rutina en C");	
	for(i = 8; i <= n; i++){
		result = 0;
    	for(j = 1; j <= i; j++){
    		result = result * j;
    	}     
    	printf("(C) factorial = %d", result);
    }                                     //resultado de la función asm
           //Impresión del resultado de la función asm
}
