#define DIPSW GPIOC_IDR

void Conf_maq();
void Ini_var();
void Procesamiento();

unsigned int value=0;
float DACoutput=0;

void main() {
     Conf_maq();
     Ini_var();
     DAC1_Init(_DAC_CH1_ENABLE);  // Initialize DAC1 module for STM32 device, channel 1
     while(1) //Bucle principal
        Procesamiento();
}
void Conf_maq()
{
     GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3
                        | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7
     );

     GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3
                        | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7,
                          _GPIO_CFG_MODE_INPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_PULL_DOWN
     );
}
void Ini_var()
{

}
void Procesamiento()
{
      value=DIPSW&0xff;
      //DAC1_Ch1_Output(value); //Por default el DAC es de 12 bits
      //DACoutput = 3.3 * value/256;  //2^8=256 2^12=4096
      DAC1_Ch1_Output(value);
      DAC1_Advanced_Ch1_Output(value, _DAC_8_BIT | _DAC_WAVE_DISABLED | _DAC_TRIGGER_SW);
}
