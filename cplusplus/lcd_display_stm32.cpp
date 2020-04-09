/*
LCD LIBRARY
    https://download.mikroe.com/documents/compilers/mikroc/pic/help/lcd_library.htm#lcd_out

Displaying Custom Characters
    https://www.instructables.com/id/Displaying-custom-character-in-lcd-using-MikroC-1/

    https://circuitdigest.com/microcontroller-projects/custom-characters-on-lcd-using-pic16f877a

Multiple Custom Characters
    https://forum.mikroe.com/viewtopic.php?f=13&t=27000&p=134172#p134172

Custome character generator
    https://omerk.github.io/lcdchargen/
    https://maxpromer.github.io/LCD-Character-Creator/
*/

// LCD module connections
sbit LCD_RS at GPIOC_ODR.B0;
sbit LCD_EN at GPIOC_ODR.B1;
sbit LCD_D4 at GPIOC_ODR.B2;
sbit LCD_D5 at GPIOC_ODR.B3;
sbit LCD_D6 at GPIOC_ODR.B4;
sbit LCD_D7 at GPIOC_ODR.B5;

// Variables globales
char equipo_txt[] = "EQUIPO 8";
char limpiar[] = "        ";
char buffer[64];
unsigned short int adc_value;
float volt;
unsigned short int state;

void Conf_maq();
void Procesamiento();
void print_pacman(int);
void CustomChar1(char, char);
void CustomChar2(char, char);
void CustomChar3(char, char);

//Arreglos para generar los caracteres personalizados
const char character1[] = {14,29,31,28,24,28,31,14};1,27,31,28,31,31,14}; //pac man, boca abierta
const char character2[] = {14,29,31,31,24,31,31,14}; //pac man, boca cerrada
const char character3[] = {14,31,21,31,17,17,31,21}; //fantasma

void main() {

   Conf_maq();

   //Inicializa la entrada analógica
   ADC_Set_Input_Channel(_ADC_CHANNEL_5);
   ADC1_Init();

   //Inicializamos el display LCD
   Lcd_Init();                        // Initialize LCD
   Lcd_Cmd(_LCD_CLEAR);               // Clear display
   Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

   Lcd_Out(1,1,equipo_txt);
   
   while(1) //Bucle principal
   state = 0;
   Procesamiento();

}

void Conf_maq()
{
      //Configura la entrada analógica por el pin A5
      GPIO_Config(&GPIOA_BASE,
            _GPIO_PINMASK_5,
            _GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO);

}

void Procesamiento()
{
          //Obtenemos el valor de entrada
          adc_value = ADC1_Get_Sample(5);
          volt=adc_value*3.3/4096;

          //Formateamos la cadena de salida
          sprintf(buffer, "    %.6f", volt);

          //Mostramos por la LCD
          Lcd_Out(2,1,buffer);

          state += 1;
          if(state == 8) state = 0; //la cuenta llega hasta 7

          print_pacman(state);

          //Tomamos una nueva lectura cada 200 ms
          Delay_ms(300);
}


void print_pacman(int state)
{ 
    Lcd_Out(1,9,limpiar);

    //imprime pac man
    if(state >= 2){
      if(state == 2 || state == 4 || state == 6){
        CustomChar1(1,11+(state - 2)); //boca abierta
      }else{
        CustomChar2(1,11+(state - 2)); //boca cerrada
      }
    }

    //imprime fantasma
    if(state < 6){
      CustomChar3(1,11+state);
    }

    /*

    if(state >= 2){
        CustomChar1(1,11+(state - 2)); //boca abierta
    }

    //imprime fantasma
    if(state < 6){
      CustomChar2(1,11+state,1);
    }

    */     
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
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 2);
}
