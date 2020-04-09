_main:
;DSP_Entrega2_Bluetooh.c,6 :: 		void main(){
;DSP_Entrega2_Bluetooh.c,11 :: 		UART5_Init_Advanced(9600,_UART_8_BIT_DATA,_UART_EVENPARITY,_UART_ONE_STOPBIT,&_GPIO_MODULE_UART5_PC12_PD2);
MOVW	R0, #lo_addr(__GPIO_MODULE_UART5_PC12_PD2+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_UART5_PC12_PD2+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #9600
BL	_UART5_Init_Advanced+0
ADD	SP, SP, #4
;DSP_Entrega2_Bluetooh.c,12 :: 		while(1)
L_main0:
;DSP_Entrega2_Bluetooh.c,13 :: 		Proceso();
BL	_Proceso+0
IT	AL
BAL	L_main0
;DSP_Entrega2_Bluetooh.c,14 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Proceso:
;DSP_Entrega2_Bluetooh.c,16 :: 		void Proceso(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP_Entrega2_Bluetooh.c,17 :: 		for(dato = 0 ; dato < 11 ; dato++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_dato+0)
MOVT	R0, #hi_addr(_dato+0)
STRH	R1, [R0, #0]
L_Proceso2:
MOVW	R0, #lo_addr(_dato+0)
MOVT	R0, #hi_addr(_dato+0)
LDRSH	R0, [R0, #0]
CMP	R0, #11
IT	GE
BGE	L_Proceso3
;DSP_Entrega2_Bluetooh.c,18 :: 		if(UART5_Tx_Idle()==1){
BL	_UART5_Tx_Idle+0
CMP	R0, #1
IT	NE
BNE	L_Proceso5
;DSP_Entrega2_Bluetooh.c,19 :: 		IntToStr(dato,txts);
MOVW	R0, #lo_addr(_dato+0)
MOVT	R0, #hi_addr(_dato+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txts+0)
MOVT	R1, #hi_addr(_txts+0)
BL	_IntToStr+0
;DSP_Entrega2_Bluetooh.c,20 :: 		UART5_Write_Text(txts); Delay_ms(1000);
MOVW	R0, #lo_addr(_txts+0)
MOVT	R0, #hi_addr(_txts+0)
BL	_UART5_Write_Text+0
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
;DSP_Entrega2_Bluetooh.c,21 :: 		}
L_Proceso5:
;DSP_Entrega2_Bluetooh.c,17 :: 		for(dato = 0 ; dato < 11 ; dato++){
MOVW	R1, #lo_addr(_dato+0)
MOVT	R1, #hi_addr(_dato+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;DSP_Entrega2_Bluetooh.c,22 :: 		}
IT	AL
BAL	L_Proceso2
L_Proceso3:
;DSP_Entrega2_Bluetooh.c,23 :: 		}
L_end_Proceso:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Proceso
