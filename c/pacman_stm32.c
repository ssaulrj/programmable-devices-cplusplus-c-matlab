#define LED   GPIOA_ODR.B5

// LCD module connections
sbit LCD_RS at GPIOC_ODR.B0;
sbit LCD_EN at GPIOC_ODR.B1;
sbit LCD_D4 at GPIOC_ODR.B2;
sbit LCD_D5 at GPIOC_ODR.B3;
sbit LCD_D6 at GPIOC_ODR.B4;
sbit LCD_D7 at GPIOC_ODR.B5;


void print_pacman(int);
void CustomChar1(char, char);
void CustomChar2(char, char);
void CustomChar3(char, char);

//Arreglos para generar los caracteres personalizados
const char character1[] = {14,29,31,28,24,28,31,14}; //pac man, boca abierta
const char character2[] = {14,29,31,31,24,31,31,14}; //pac man, boca cerrada
const char character3[] = {14,31,21,31,17,17,31,21}; //fantasma

// Variables globales
char equipo_txt[] = "R3 INC.";
char limpiar[] = "        ";
char buffer[88];

unsigned int cent;
unsigned int seg;
unsigned int min;
unsigned int hora;

unsigned short int contador;  //animation trigger
unsigned short int state;

/*void Periodo2() iv IVT_INT_TIM4 ics ICS_AUTO {
       TIM4_SR.UIF = 0;             //UIF: Update interrupt flag

       state += 1;
       if(state == 9) state = 0; //la cuenta llega hasta 7

       Lcd_Out(1,9,limpiar);

       //imprime pac man
       if(state >= 2){
          if(state == 2 || state == 4 || state == 6 || state == 8){
            CustomChar1(1,10+(state - 2)); //boca abierta
          }else{
            CustomChar2(1,10+(state - 2)); //boca cerrada
          }
       }

       //imprime fantasma
       if(state < 7){
          CustomChar3(1,10+state);
          CustomChar3(1,10+state+2);
          CustomChar3(1,10+state+4);
          CustomChar3(1,10+state+6);
       }     
}*/

void Periodo() iv IVT_INT_TIM3 ics ICS_AUTO {
       TIM3_SR.UIF = 0;             //UIF: Update interrupt flag

       cent += 1;

       if(cent == 100){
        cent = 0;
        seg += 1;
       }
       if(seg == 60){
        seg = 0;
        min += 1;
       }

       if(min == 60){
        min = 0;
        hora += 1;
       }
      
      //Formamos la cadena correspondiente
      sprintf(buffer, "%02d:%02d:%02d:%02d", hora, min, seg, cent); 

      //Mostramos por la LCD
      Lcd_Out(2,1,buffer);

      contador += 1;
      
      if(contador == 220){

           state += 1;
           if(state == 9) state = 0; //la cuenta llega hasta 7

           Lcd_Out(1,9,limpiar);

           //imprime pac man
           if(state >= 2){
              if(state == 2 || state == 4 || state == 6 || state == 8){
                CustomChar1(1,10+(state - 2)); //boca abierta
              }else{
                CustomChar2(1,10+(state - 2)); //boca cerrada
              }
           }

           //imprime fantasma
           if(state < 7){
              CustomChar3(1,10+state);
              CustomChar3(1,10+state+2);
              CustomChar3(1,10+state+4);
              CustomChar3(1,10+state+6);
           }

           contador = 0;

      }
}

void main() {

  //Inicializamos las variables
  cent = 0;
  seg = 40;
  min = 58;
  hora = 0;

  //Inicializamos el display LCD
  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

  Lcd_Out(1,1,equipo_txt);


  //Timer 3  (1 seg/ 100 interr)
  RCC_APB1ENR.TIM3EN = 1;       // Enciende el módulo del timer 3
  TIM3_CR1.CEN = 0;             // Deshabilita el contador del timer 3
  TIM3_PSC = 7999;              // Establece el prescalador APB1/(PSC+1) =2000Hz
  TIM3_ARR = 19;                // Establece valor de autorecarga    0.01 seg.
  NVIC_IntEnable(IVT_INT_TIM3); // Establece la interrupcion del timer 3
  TIM3_DIER.UIE = 1;            // Habilita la generación de interrupción
  TIM3_CR1.CEN = 1;             // Habilita el contador del timer 3

  /*
  //Timer 4 
  RCC_APB1ENR.TIM4EN = 1;       // Enciende el módulo del timer 3
  TIM4_CR1.CEN = 0;             // Deshabilita el contador del timer 3
  TIM4_PSC = 7999;              // Establece el prescalador APB1/(PSC+1) =2000Hz
  TIM4_ARR = 400;                // Establece valor de autorecarga    0.2 seg
  NVIC_IntEnable(IVT_INT_TIM4); // Establece la interrupcion del timer 3
  TIM4_DIER.UIE = 1;            // Habilita la generación de interrupción
  TIM4_CR1.CEN = 1;             // Habilita el contador del timer 3
  */

  //Control global de interrupciones                        */
  EnableInterrupts();             // Habilita las interrupciones
}


/*Lcd_cmd(int)  -   indica el registro de memoria en el que se carga el nuevo caracter.
                    cada caracter ocupa un total de 8 bits.*/

void CustomChar1(char pos_row, char pos_char) {
    char i;
    Lcd_Cmd(64); 
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0); // Para qué sirve el último parametro??
}

void CustomChar2(char pos_row, char pos_char) {
    char i;
    Lcd_Cmd(72);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 1);
}

void CustomChar3(char pos_row, char pos_char) {
    char i;
    Lcd_Cmd(80);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character3[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 2);
}
