#define DISPLAY GPIOB_ODR
#define CERO     0XC0
#define UNO      0XF9
#define DOS      0XA4
#define TRES     0XB0

//Declara variables globales
unsigned int adc_value;
float volt;
int int_volt;
const unsigned short int segmentos[]={CERO,UNO,DOS,TRES};

void Conf_maq();
void Procesamiento();

void main() {

     Conf_maq();
     ADC_Set_Input_Channel(_ADC_CHANNEL_0);
     ADC1_Init();
     while(1) //Bucle principal
        Procesamiento();
        
}

void Conf_maq()
{
  GPIO_Config(&GPIOA_BASE,
            _GPIO_PINMASK_0,
            _GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO);
            
  GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3
                        | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6,
                          _GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ |_GPIO_CFG_OTYPE_PP);
                          
}
void Procesamiento()
{
  adc_value = ADC1_Get_Sample(0);
  volt=adc_value*3.3/4096;
  int_volt=floor(volt);
  
  DISPLAY = segmentos[int_volt];
}
