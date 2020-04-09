_main:
;DSP_Entrega3_Imagenesbluetooh.c,37 :: 		main()
;DSP_Entrega3_Imagenesbluetooh.c,40 :: 		txts1[0]='1';
MOVS	R1, #49
MOVW	R0, #lo_addr(_txts1+0)
MOVT	R0, #hi_addr(_txts1+0)
STRB	R1, [R0, #0]
;DSP_Entrega3_Imagenesbluetooh.c,43 :: 		UART5_Init_Advanced(9600,_UART_8_BIT_DATA,_UART_EVENPARITY,_UART_ONE_STOPBIT,&_GPIO_MODULE_UART5_PC12_PD2);
MOVW	R0, #lo_addr(__GPIO_MODULE_UART5_PC12_PD2+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_UART5_PC12_PD2+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #9600
BL	_UART5_Init_Advanced+0
ADD	SP, SP, #4
;DSP_Entrega3_Imagenesbluetooh.c,45 :: 		GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Analog_Input+0
;DSP_Entrega3_Imagenesbluetooh.c,46 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, _GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO);
MOV	R2, #65
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;DSP_Entrega3_Imagenesbluetooh.c,47 :: 		InitPantalla();
BL	_InitPantalla+0
;DSP_Entrega3_Imagenesbluetooh.c,48 :: 		TFT_Init_ILI9341_8bit(320, 240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;DSP_Entrega3_Imagenesbluetooh.c,49 :: 		Delay_ms(3000);    //Para empezar el programa e inicie bluetooh
MOVW	R7, #9214
MOVT	R7, #244
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,52 :: 		while(1){
L_main2:
;DSP_Entrega3_Imagenesbluetooh.c,53 :: 		Proceso();
BL	_Proceso+0
;DSP_Entrega3_Imagenesbluetooh.c,54 :: 		}
IT	AL
BAL	L_main2
;DSP_Entrega3_Imagenesbluetooh.c,55 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Proceso:
;DSP_Entrega3_Imagenesbluetooh.c,57 :: 		void Proceso(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP_Entrega3_Imagenesbluetooh.c,58 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;DSP_Entrega3_Imagenesbluetooh.c,59 :: 		TFT_Image(50, 40, img6x_bmp, 1);
MOVS	R3, #1
MOVW	R2, #lo_addr(_img6x_bmp+0)
MOVT	R2, #hi_addr(_img6x_bmp+0)
MOVS	R1, #40
MOVS	R0, #50
BL	_TFT_Image+0
;DSP_Entrega3_Imagenesbluetooh.c,60 :: 		TFT_Write_Text("Enviando imagen 1...",5,5);
MOVW	R0, #lo_addr(?lstr1_DSP_Entrega3_Imagenesbluetooh+0)
MOVT	R0, #hi_addr(?lstr1_DSP_Entrega3_Imagenesbluetooh+0)
MOVS	R2, #5
MOVS	R1, #5
BL	_TFT_Write_Text+0
;DSP_Entrega3_Imagenesbluetooh.c,61 :: 		ProcesoImagen(1);
MOVS	R0, #1
SXTH	R0, R0
BL	_ProcesoImagen+0
;DSP_Entrega3_Imagenesbluetooh.c,62 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Proceso4:
SUBS	R7, R7, #1
BNE	L_Proceso4
NOP
NOP
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,64 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;DSP_Entrega3_Imagenesbluetooh.c,65 :: 		TFT_Image(100, 40, F1_bmp, 1);
MOVS	R3, #1
MOVW	R2, #lo_addr(_F1_bmp+0)
MOVT	R2, #hi_addr(_F1_bmp+0)
MOVS	R1, #40
MOVS	R0, #100
BL	_TFT_Image+0
;DSP_Entrega3_Imagenesbluetooh.c,66 :: 		TFT_Write_Text("Enviando imagen 2...",5,5);
MOVW	R0, #lo_addr(?lstr2_DSP_Entrega3_Imagenesbluetooh+0)
MOVT	R0, #hi_addr(?lstr2_DSP_Entrega3_Imagenesbluetooh+0)
MOVS	R2, #5
MOVS	R1, #5
BL	_TFT_Write_Text+0
;DSP_Entrega3_Imagenesbluetooh.c,67 :: 		ProcesoImagen(2);
MOVS	R0, #2
SXTH	R0, R0
BL	_ProcesoImagen+0
;DSP_Entrega3_Imagenesbluetooh.c,68 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Proceso6:
SUBS	R7, R7, #1
BNE	L_Proceso6
NOP
NOP
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,70 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;DSP_Entrega3_Imagenesbluetooh.c,71 :: 		TFT_Image(100, 40, F2_bmp, 1);
MOVS	R3, #1
MOVW	R2, #lo_addr(_F2_bmp+0)
MOVT	R2, #hi_addr(_F2_bmp+0)
MOVS	R1, #40
MOVS	R0, #100
BL	_TFT_Image+0
;DSP_Entrega3_Imagenesbluetooh.c,72 :: 		TFT_Write_Text("Enviando imagen 3...",5,5);
MOVW	R0, #lo_addr(?lstr3_DSP_Entrega3_Imagenesbluetooh+0)
MOVT	R0, #hi_addr(?lstr3_DSP_Entrega3_Imagenesbluetooh+0)
MOVS	R2, #5
MOVS	R1, #5
BL	_TFT_Write_Text+0
;DSP_Entrega3_Imagenesbluetooh.c,73 :: 		ProcesoImagen(3);
MOVS	R0, #3
SXTH	R0, R0
BL	_ProcesoImagen+0
;DSP_Entrega3_Imagenesbluetooh.c,74 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Proceso8:
SUBS	R7, R7, #1
BNE	L_Proceso8
NOP
NOP
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,76 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;DSP_Entrega3_Imagenesbluetooh.c,77 :: 		TFT_Image(100, 40, F3_bmp, 1);
MOVS	R3, #1
MOVW	R2, #lo_addr(_F3_bmp+0)
MOVT	R2, #hi_addr(_F3_bmp+0)
MOVS	R1, #40
MOVS	R0, #100
BL	_TFT_Image+0
;DSP_Entrega3_Imagenesbluetooh.c,78 :: 		TFT_Write_Text("Enviando imagen 4...",5,5);
MOVW	R0, #lo_addr(?lstr4_DSP_Entrega3_Imagenesbluetooh+0)
MOVT	R0, #hi_addr(?lstr4_DSP_Entrega3_Imagenesbluetooh+0)
MOVS	R2, #5
MOVS	R1, #5
BL	_TFT_Write_Text+0
;DSP_Entrega3_Imagenesbluetooh.c,79 :: 		ProcesoImagen(4);
MOVS	R0, #4
SXTH	R0, R0
BL	_ProcesoImagen+0
;DSP_Entrega3_Imagenesbluetooh.c,80 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Proceso10:
SUBS	R7, R7, #1
BNE	L_Proceso10
NOP
NOP
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,82 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;DSP_Entrega3_Imagenesbluetooh.c,83 :: 		TFT_Image(100, 40, F4_bmp, 1);
MOVS	R3, #1
MOVW	R2, #lo_addr(_F4_bmp+0)
MOVT	R2, #hi_addr(_F4_bmp+0)
MOVS	R1, #40
MOVS	R0, #100
BL	_TFT_Image+0
;DSP_Entrega3_Imagenesbluetooh.c,84 :: 		TFT_Write_Text("Enviando imagen 5...",5,5);
MOVW	R0, #lo_addr(?lstr5_DSP_Entrega3_Imagenesbluetooh+0)
MOVT	R0, #hi_addr(?lstr5_DSP_Entrega3_Imagenesbluetooh+0)
MOVS	R2, #5
MOVS	R1, #5
BL	_TFT_Write_Text+0
;DSP_Entrega3_Imagenesbluetooh.c,85 :: 		ProcesoImagen(5);
MOVS	R0, #5
SXTH	R0, R0
BL	_ProcesoImagen+0
;DSP_Entrega3_Imagenesbluetooh.c,86 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Proceso12:
SUBS	R7, R7, #1
BNE	L_Proceso12
NOP
NOP
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,87 :: 		}
L_end_Proceso:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Proceso
_TFT_Set_Index_Custom:
;DSP_Entrega3_Imagenesbluetooh.c,89 :: 		void TFT_Set_Index_Custom(unsigned short index) {
; index start address is: 0 (R0)
UXTB	R2, R0
; index end address is: 0 (R0)
; index start address is: 8 (R2)
;DSP_Entrega3_Imagenesbluetooh.c,91 :: 		TFT_RS = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,96 :: 		temp = index;
; temp start address is: 0 (R0)
UXTB	R0, R2
; index end address is: 8 (R2)
;DSP_Entrega3_Imagenesbluetooh.c,97 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,98 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,99 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,100 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,101 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,102 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,103 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,104 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,106 :: 		TFT_WR = 0;
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,107 :: 		asm nop;
NOP
;DSP_Entrega3_Imagenesbluetooh.c,108 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,109 :: 		}
L_end_TFT_Set_Index_Custom:
BX	LR
; end of _TFT_Set_Index_Custom
_TFT_Write_Command_Custom:
;DSP_Entrega3_Imagenesbluetooh.c,111 :: 		void TFT_Write_Command_Custom(unsigned short cmd) {
; cmd start address is: 0 (R0)
UXTB	R3, R0
; cmd end address is: 0 (R0)
; cmd start address is: 12 (R3)
;DSP_Entrega3_Imagenesbluetooh.c,113 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,118 :: 		temp = cmd;
; temp start address is: 0 (R0)
UXTB	R0, R3
; cmd end address is: 12 (R3)
;DSP_Entrega3_Imagenesbluetooh.c,119 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,120 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,121 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,122 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,123 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,124 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,125 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,126 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,128 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,129 :: 		asm nop;
NOP
;DSP_Entrega3_Imagenesbluetooh.c,130 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,131 :: 		}
L_end_TFT_Write_Command_Custom:
BX	LR
; end of _TFT_Write_Command_Custom
_TFT_Write_Data_Custom:
;DSP_Entrega3_Imagenesbluetooh.c,133 :: 		void TFT_Write_Data_Custom(unsigned int _data) {
SUB	SP, SP, #4
STRH	R0, [SP, #0]
;DSP_Entrega3_Imagenesbluetooh.c,135 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,140 :: 		temp = Hi(_data);
ADD	R1, SP, #0
ADDS	R1, R1, #1
LDRB	R0, [R1, #0]
; temp start address is: 0 (R0)
UXTB	R0, R0
;DSP_Entrega3_Imagenesbluetooh.c,141 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,142 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,143 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,144 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,145 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,146 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,147 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,148 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,150 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,151 :: 		asm nop;
NOP
;DSP_Entrega3_Imagenesbluetooh.c,152 :: 		TFT_WR = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R3, #lo_addr(GPIOA_ODR+0)
MOVT	R3, #hi_addr(GPIOA_ODR+0)
_SX	[R3, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,157 :: 		temp = Lo(_data);
ADD	R1, SP, #0
LDRB	R1, [R1, #0]
; temp start address is: 0 (R0)
UXTB	R0, R1
;DSP_Entrega3_Imagenesbluetooh.c,158 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,159 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,160 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,161 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,162 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,163 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,164 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,165 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,167 :: 		TFT_WR = 0;
MOVS	R1, #0
SXTB	R1, R1
_SX	[R3, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,168 :: 		asm nop;
NOP
;DSP_Entrega3_Imagenesbluetooh.c,169 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega3_Imagenesbluetooh.c,170 :: 		}
L_end_TFT_Write_Data_Custom:
ADD	SP, SP, #4
BX	LR
; end of _TFT_Write_Data_Custom
_InitPantalla:
;DSP_Entrega3_Imagenesbluetooh.c,172 :: 		void InitPantalla(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP_Entrega3_Imagenesbluetooh.c,174 :: 		_GPIO_PINMASK_8,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
MOVW	R1, #1792
;DSP_Entrega3_Imagenesbluetooh.c,173 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_9| _GPIO_PINMASK_10|
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;DSP_Entrega3_Imagenesbluetooh.c,174 :: 		_GPIO_PINMASK_8,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
BL	_GPIO_Config+0
;DSP_Entrega3_Imagenesbluetooh.c,176 :: 		_GPIO_PINMASK_10 ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
MOVW	R1, #1081
;DSP_Entrega3_Imagenesbluetooh.c,175 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 |_GPIO_PINMASK_3 | _GPIO_PINMASK_5 | _GPIO_PINMASK_4 |
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;DSP_Entrega3_Imagenesbluetooh.c,176 :: 		_GPIO_PINMASK_10 ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
BL	_GPIO_Config+0
;DSP_Entrega3_Imagenesbluetooh.c,178 :: 		_GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
;DSP_Entrega3_Imagenesbluetooh.c,177 :: 		GPIO_Config(&GPIOC_BASE,_GPIO_PINMASK_1 | _GPIO_PINMASK_7 ,_GPIO_CFG_MODE_OUTPUT |
MOVW	R1, #130
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;DSP_Entrega3_Imagenesbluetooh.c,178 :: 		_GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
BL	_GPIO_Config+0
;DSP_Entrega3_Imagenesbluetooh.c,180 :: 		_GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_8 );
MOVW	R1, #1811
;DSP_Entrega3_Imagenesbluetooh.c,179 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_0 |_GPIO_PINMASK_1 |_GPIO_PINMASK_4 |
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;DSP_Entrega3_Imagenesbluetooh.c,180 :: 		_GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_8 );
BL	_GPIO_Digital_Output+0
;DSP_Entrega3_Imagenesbluetooh.c,182 :: 		_GPIO_PINMASK_10);
MOVW	R1, #1080
;DSP_Entrega3_Imagenesbluetooh.c,181 :: 		GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 |
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;DSP_Entrega3_Imagenesbluetooh.c,182 :: 		_GPIO_PINMASK_10);
BL	_GPIO_Digital_Output+0
;DSP_Entrega3_Imagenesbluetooh.c,183 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;DSP_Entrega3_Imagenesbluetooh.c,184 :: 		TFT_Set_Active(&TFT_Set_Index_Custom, &TFT_Write_Command_Custom, &TFT_Write_Data_Custom);
MOVW	R2, #lo_addr(_TFT_Write_Data_Custom+0)
MOVT	R2, #hi_addr(_TFT_Write_Data_Custom+0)
MOVW	R1, #lo_addr(_TFT_Write_Command_Custom+0)
MOVT	R1, #hi_addr(_TFT_Write_Command_Custom+0)
MOVW	R0, #lo_addr(_TFT_Set_Index_Custom+0)
MOVT	R0, #hi_addr(_TFT_Set_Index_Custom+0)
BL	_TFT_Set_Active+0
;DSP_Entrega3_Imagenesbluetooh.c,185 :: 		TFT_Init_ILI9341_8bit_Custom(240, 320);
MOVW	R1, #320
MOVS	R0, #240
BL	_TFT_Init_ILI9341_8bit_Custom+0
;DSP_Entrega3_Imagenesbluetooh.c,186 :: 		}
L_end_InitPantalla:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitPantalla
_ProcesoImagen:
;DSP_Entrega3_Imagenesbluetooh.c,188 :: 		void ProcesoImagen(int num){
; num start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; num end address is: 0 (R0)
; num start address is: 0 (R0)
;DSP_Entrega3_Imagenesbluetooh.c,189 :: 		switch(num){
IT	AL
BAL	L_ProcesoImagen14
; num end address is: 0 (R0)
;DSP_Entrega3_Imagenesbluetooh.c,190 :: 		case 1:
L_ProcesoImagen16:
;DSP_Entrega3_Imagenesbluetooh.c,191 :: 		UART5_Write(1);
MOVS	R0, #1
BL	_UART5_Write+0
;DSP_Entrega3_Imagenesbluetooh.c,192 :: 		Delay_ms(50);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_ProcesoImagen17:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen17
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,193 :: 		for(dato = 0 ; dato < 3622 ; dato++){
MOVS	R2, #0
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
STR	R2, [R1, #0]
L_ProcesoImagen19:
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
LDR	R2, [R1, #0]
MOVW	R1, #3622
CMP	R2, R1
IT	GE
BGE	L_ProcesoImagen20
;DSP_Entrega3_Imagenesbluetooh.c,194 :: 		if(UART5_Tx_Idle()==1){
BL	_UART5_Tx_Idle+0
CMP	R0, #1
IT	NE
BNE	L_ProcesoImagen22
;DSP_Entrega3_Imagenesbluetooh.c,195 :: 		UART5_Write(foto1[dato]);
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_foto1+0)
MOVT	R1, #hi_addr(_foto1+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
UXTH	R0, R1
BL	_UART5_Write+0
;DSP_Entrega3_Imagenesbluetooh.c,196 :: 		Delay_ms(2);
MOVW	R7, #10665
MOVT	R7, #0
NOP
NOP
L_ProcesoImagen23:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen23
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,197 :: 		}
L_ProcesoImagen22:
;DSP_Entrega3_Imagenesbluetooh.c,193 :: 		for(dato = 0 ; dato < 3622 ; dato++){
MOVW	R2, #lo_addr(_dato+0)
MOVT	R2, #hi_addr(_dato+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, #1
STR	R1, [R2, #0]
;DSP_Entrega3_Imagenesbluetooh.c,198 :: 		}
IT	AL
BAL	L_ProcesoImagen19
L_ProcesoImagen20:
;DSP_Entrega3_Imagenesbluetooh.c,199 :: 		TFT_Write_Text("Listo!",280,5);
MOVW	R1, #lo_addr(?lstr6_DSP_Entrega3_Imagenesbluetooh+0)
MOVT	R1, #hi_addr(?lstr6_DSP_Entrega3_Imagenesbluetooh+0)
MOVS	R2, #5
MOV	R0, R1
MOVW	R1, #280
BL	_TFT_Write_Text+0
;DSP_Entrega3_Imagenesbluetooh.c,200 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_ProcesoImagen25:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen25
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,201 :: 		break;
IT	AL
BAL	L_ProcesoImagen15
;DSP_Entrega3_Imagenesbluetooh.c,202 :: 		case 2:
L_ProcesoImagen27:
;DSP_Entrega3_Imagenesbluetooh.c,203 :: 		UART5_Write(1);
MOVS	R0, #1
BL	_UART5_Write+0
;DSP_Entrega3_Imagenesbluetooh.c,204 :: 		Delay_ms(50);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_ProcesoImagen28:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen28
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,205 :: 		for(dato = 0 ; dato < 5997 ; dato++){
MOVS	R2, #0
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
STR	R2, [R1, #0]
L_ProcesoImagen30:
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
LDR	R2, [R1, #0]
MOVW	R1, #5997
CMP	R2, R1
IT	GE
BGE	L_ProcesoImagen31
;DSP_Entrega3_Imagenesbluetooh.c,206 :: 		if(UART5_Tx_Idle()==1){
BL	_UART5_Tx_Idle+0
CMP	R0, #1
IT	NE
BNE	L_ProcesoImagen33
;DSP_Entrega3_Imagenesbluetooh.c,207 :: 		UART5_Write(foto2[dato]);
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_foto2+0)
MOVT	R1, #hi_addr(_foto2+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
UXTH	R0, R1
BL	_UART5_Write+0
;DSP_Entrega3_Imagenesbluetooh.c,208 :: 		Delay_ms(2);
MOVW	R7, #10665
MOVT	R7, #0
NOP
NOP
L_ProcesoImagen34:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen34
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,209 :: 		}
L_ProcesoImagen33:
;DSP_Entrega3_Imagenesbluetooh.c,205 :: 		for(dato = 0 ; dato < 5997 ; dato++){
MOVW	R2, #lo_addr(_dato+0)
MOVT	R2, #hi_addr(_dato+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, #1
STR	R1, [R2, #0]
;DSP_Entrega3_Imagenesbluetooh.c,210 :: 		}
IT	AL
BAL	L_ProcesoImagen30
L_ProcesoImagen31:
;DSP_Entrega3_Imagenesbluetooh.c,211 :: 		TFT_Write_Text("Listo!",280,5);
MOVW	R1, #lo_addr(?lstr7_DSP_Entrega3_Imagenesbluetooh+0)
MOVT	R1, #hi_addr(?lstr7_DSP_Entrega3_Imagenesbluetooh+0)
MOVS	R2, #5
MOV	R0, R1
MOVW	R1, #280
BL	_TFT_Write_Text+0
;DSP_Entrega3_Imagenesbluetooh.c,212 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_ProcesoImagen36:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen36
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,213 :: 		break;
IT	AL
BAL	L_ProcesoImagen15
;DSP_Entrega3_Imagenesbluetooh.c,214 :: 		case 3:
L_ProcesoImagen38:
;DSP_Entrega3_Imagenesbluetooh.c,215 :: 		UART5_Write(1);
MOVS	R0, #1
BL	_UART5_Write+0
;DSP_Entrega3_Imagenesbluetooh.c,216 :: 		Delay_ms(50);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_ProcesoImagen39:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen39
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,217 :: 		for(dato = 0 ; dato < 2785 ; dato++){
MOVS	R2, #0
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
STR	R2, [R1, #0]
L_ProcesoImagen41:
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
LDR	R2, [R1, #0]
MOVW	R1, #2785
CMP	R2, R1
IT	GE
BGE	L_ProcesoImagen42
;DSP_Entrega3_Imagenesbluetooh.c,218 :: 		if(UART5_Tx_Idle()==1){
BL	_UART5_Tx_Idle+0
CMP	R0, #1
IT	NE
BNE	L_ProcesoImagen44
;DSP_Entrega3_Imagenesbluetooh.c,219 :: 		UART5_Write(foto3[dato]);
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_foto3+0)
MOVT	R1, #hi_addr(_foto3+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
UXTH	R0, R1
BL	_UART5_Write+0
;DSP_Entrega3_Imagenesbluetooh.c,220 :: 		Delay_ms(2);
MOVW	R7, #10665
MOVT	R7, #0
NOP
NOP
L_ProcesoImagen45:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen45
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,221 :: 		}
L_ProcesoImagen44:
;DSP_Entrega3_Imagenesbluetooh.c,217 :: 		for(dato = 0 ; dato < 2785 ; dato++){
MOVW	R2, #lo_addr(_dato+0)
MOVT	R2, #hi_addr(_dato+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, #1
STR	R1, [R2, #0]
;DSP_Entrega3_Imagenesbluetooh.c,222 :: 		}
IT	AL
BAL	L_ProcesoImagen41
L_ProcesoImagen42:
;DSP_Entrega3_Imagenesbluetooh.c,223 :: 		TFT_Write_Text("Listo!",280,5);
MOVW	R1, #lo_addr(?lstr8_DSP_Entrega3_Imagenesbluetooh+0)
MOVT	R1, #hi_addr(?lstr8_DSP_Entrega3_Imagenesbluetooh+0)
MOVS	R2, #5
MOV	R0, R1
MOVW	R1, #280
BL	_TFT_Write_Text+0
;DSP_Entrega3_Imagenesbluetooh.c,224 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_ProcesoImagen47:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen47
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,225 :: 		break;
IT	AL
BAL	L_ProcesoImagen15
;DSP_Entrega3_Imagenesbluetooh.c,226 :: 		case 4:
L_ProcesoImagen49:
;DSP_Entrega3_Imagenesbluetooh.c,227 :: 		UART5_Write(1);
MOVS	R0, #1
BL	_UART5_Write+0
;DSP_Entrega3_Imagenesbluetooh.c,228 :: 		Delay_ms(50);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_ProcesoImagen50:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen50
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,229 :: 		for(dato = 0 ; dato < 5849 ; dato++){
MOVS	R2, #0
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
STR	R2, [R1, #0]
L_ProcesoImagen52:
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
LDR	R2, [R1, #0]
MOVW	R1, #5849
CMP	R2, R1
IT	GE
BGE	L_ProcesoImagen53
;DSP_Entrega3_Imagenesbluetooh.c,230 :: 		if(UART5_Tx_Idle()==1){
BL	_UART5_Tx_Idle+0
CMP	R0, #1
IT	NE
BNE	L_ProcesoImagen55
;DSP_Entrega3_Imagenesbluetooh.c,231 :: 		UART5_Write(foto4[dato]);
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_foto4+0)
MOVT	R1, #hi_addr(_foto4+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
UXTH	R0, R1
BL	_UART5_Write+0
;DSP_Entrega3_Imagenesbluetooh.c,232 :: 		Delay_ms(2);
MOVW	R7, #10665
MOVT	R7, #0
NOP
NOP
L_ProcesoImagen56:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen56
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,233 :: 		}
L_ProcesoImagen55:
;DSP_Entrega3_Imagenesbluetooh.c,229 :: 		for(dato = 0 ; dato < 5849 ; dato++){
MOVW	R2, #lo_addr(_dato+0)
MOVT	R2, #hi_addr(_dato+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, #1
STR	R1, [R2, #0]
;DSP_Entrega3_Imagenesbluetooh.c,234 :: 		}
IT	AL
BAL	L_ProcesoImagen52
L_ProcesoImagen53:
;DSP_Entrega3_Imagenesbluetooh.c,235 :: 		TFT_Write_Text("Listo!",280,5);
MOVW	R1, #lo_addr(?lstr9_DSP_Entrega3_Imagenesbluetooh+0)
MOVT	R1, #hi_addr(?lstr9_DSP_Entrega3_Imagenesbluetooh+0)
MOVS	R2, #5
MOV	R0, R1
MOVW	R1, #280
BL	_TFT_Write_Text+0
;DSP_Entrega3_Imagenesbluetooh.c,236 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_ProcesoImagen58:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen58
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,237 :: 		break;
IT	AL
BAL	L_ProcesoImagen15
;DSP_Entrega3_Imagenesbluetooh.c,238 :: 		case 5:
L_ProcesoImagen60:
;DSP_Entrega3_Imagenesbluetooh.c,239 :: 		UART5_Write(1);
MOVS	R0, #1
BL	_UART5_Write+0
;DSP_Entrega3_Imagenesbluetooh.c,240 :: 		Delay_ms(50);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_ProcesoImagen61:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen61
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,241 :: 		for(dato = 0 ; dato < 3075 ; dato++){
MOVS	R2, #0
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
STR	R2, [R1, #0]
L_ProcesoImagen63:
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
LDR	R2, [R1, #0]
MOVW	R1, #3075
CMP	R2, R1
IT	GE
BGE	L_ProcesoImagen64
;DSP_Entrega3_Imagenesbluetooh.c,242 :: 		if(UART5_Tx_Idle()==1){
BL	_UART5_Tx_Idle+0
CMP	R0, #1
IT	NE
BNE	L_ProcesoImagen66
;DSP_Entrega3_Imagenesbluetooh.c,243 :: 		UART5_Write(foto5[dato]);
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_foto5+0)
MOVT	R1, #hi_addr(_foto5+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
UXTH	R0, R1
BL	_UART5_Write+0
;DSP_Entrega3_Imagenesbluetooh.c,244 :: 		Delay_ms(2);
MOVW	R7, #10665
MOVT	R7, #0
NOP
NOP
L_ProcesoImagen67:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen67
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,245 :: 		}
L_ProcesoImagen66:
;DSP_Entrega3_Imagenesbluetooh.c,241 :: 		for(dato = 0 ; dato < 3075 ; dato++){
MOVW	R2, #lo_addr(_dato+0)
MOVT	R2, #hi_addr(_dato+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, #1
STR	R1, [R2, #0]
;DSP_Entrega3_Imagenesbluetooh.c,246 :: 		}
IT	AL
BAL	L_ProcesoImagen63
L_ProcesoImagen64:
;DSP_Entrega3_Imagenesbluetooh.c,247 :: 		TFT_Write_Text("Listo!",280,5);
MOVW	R1, #lo_addr(?lstr10_DSP_Entrega3_Imagenesbluetooh+0)
MOVT	R1, #hi_addr(?lstr10_DSP_Entrega3_Imagenesbluetooh+0)
MOVS	R2, #5
MOV	R0, R1
MOVW	R1, #280
BL	_TFT_Write_Text+0
;DSP_Entrega3_Imagenesbluetooh.c,248 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_ProcesoImagen69:
SUBS	R7, R7, #1
BNE	L_ProcesoImagen69
NOP
NOP
;DSP_Entrega3_Imagenesbluetooh.c,249 :: 		break;
IT	AL
BAL	L_ProcesoImagen15
;DSP_Entrega3_Imagenesbluetooh.c,250 :: 		default: break;
L_ProcesoImagen71:
IT	AL
BAL	L_ProcesoImagen15
;DSP_Entrega3_Imagenesbluetooh.c,251 :: 		}
L_ProcesoImagen14:
; num start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_ProcesoImagen16
CMP	R0, #2
IT	EQ
BEQ	L_ProcesoImagen27
CMP	R0, #3
IT	EQ
BEQ	L_ProcesoImagen38
CMP	R0, #4
IT	EQ
BEQ	L_ProcesoImagen49
CMP	R0, #5
IT	EQ
BEQ	L_ProcesoImagen60
; num end address is: 0 (R0)
IT	AL
BAL	L_ProcesoImagen71
L_ProcesoImagen15:
;DSP_Entrega3_Imagenesbluetooh.c,253 :: 		}
L_end_ProcesoImagen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ProcesoImagen
