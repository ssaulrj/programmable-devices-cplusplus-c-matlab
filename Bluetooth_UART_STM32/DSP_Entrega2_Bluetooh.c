//Declaración de los pines TX y RX
int dato;
char txts[2];
void Proceso();

        void main(){
                //Pa9 ---Tx
                //Pa10---Rx
                //pc12  tx
                //pd2 rx
                UART5_Init_Advanced(9600,_UART_8_BIT_DATA,_UART_EVENPARITY,_UART_ONE_STOPBIT,&_GPIO_MODULE_UART5_PC12_PD2);
                while(1)
                        Proceso();
        }

        void Proceso(){
             for(dato = 0 ; dato < 11 ; dato++){
               if(UART5_Tx_Idle()==1){
               IntToStr(dato,txts);
               UART5_Write_Text(txts); Delay_ms(1000);
               }
             }
        }