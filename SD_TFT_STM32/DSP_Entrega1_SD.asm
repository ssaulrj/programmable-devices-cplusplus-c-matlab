_mensajesEst:
;DSP_Entrega1_SD.c,107 :: 		void mensajesEst(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP_Entrega1_SD.c,110 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;DSP_Entrega1_SD.c,111 :: 		if(estado_SD==0){
MOVW	R0, #lo_addr(_estado_SD+0)
MOVT	R0, #hi_addr(_estado_SD+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_mensajesEst0
;DSP_Entrega1_SD.c,112 :: 		TFT_Write_Text("MMC_FAT_INIT -> GOOD", 5, 20);
MOVW	R0, #lo_addr(?lstr1_DSP_Entrega1_SD+0)
MOVT	R0, #hi_addr(?lstr1_DSP_Entrega1_SD+0)
MOVS	R2, #20
MOVS	R1, #5
BL	_TFT_Write_Text+0
;DSP_Entrega1_SD.c,113 :: 		Delay_ms(delay_msg);
MOVW	R7, #29523
MOVT	R7, #203
NOP
NOP
L_mensajesEst1:
SUBS	R7, R7, #1
BNE	L_mensajesEst1
NOP
NOP
NOP
NOP
;DSP_Entrega1_SD.c,115 :: 		if(estado_File == 1){
MOVW	R0, #lo_addr(_estado_File+0)
MOVT	R0, #hi_addr(_estado_File+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_mensajesEst3
;DSP_Entrega1_SD.c,116 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;DSP_Entrega1_SD.c,117 :: 		TFT_Write_Text("Mmc_Fat_Assign -> GOOD", 5, 20);
MOVW	R0, #lo_addr(?lstr2_DSP_Entrega1_SD+0)
MOVT	R0, #hi_addr(?lstr2_DSP_Entrega1_SD+0)
MOVS	R2, #20
MOVS	R1, #5
BL	_TFT_Write_Text+0
;DSP_Entrega1_SD.c,118 :: 		Delay_ms(delay_msg);
MOVW	R7, #29523
MOVT	R7, #203
NOP
NOP
L_mensajesEst4:
SUBS	R7, R7, #1
BNE	L_mensajesEst4
NOP
NOP
NOP
NOP
;DSP_Entrega1_SD.c,119 :: 		}
IT	AL
BAL	L_mensajesEst6
L_mensajesEst3:
;DSP_Entrega1_SD.c,121 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;DSP_Entrega1_SD.c,122 :: 		TFT_Write_Text("PROBLEMAS CON EL ARCHIVO FUENTE", 5, 20);
MOVW	R0, #lo_addr(?lstr3_DSP_Entrega1_SD+0)
MOVT	R0, #hi_addr(?lstr3_DSP_Entrega1_SD+0)
MOVS	R2, #20
MOVS	R1, #5
BL	_TFT_Write_Text+0
;DSP_Entrega1_SD.c,123 :: 		Delay_ms(delay_msg);
MOVW	R7, #29523
MOVT	R7, #203
NOP
NOP
L_mensajesEst7:
SUBS	R7, R7, #1
BNE	L_mensajesEst7
NOP
NOP
NOP
NOP
;DSP_Entrega1_SD.c,124 :: 		}
L_mensajesEst6:
;DSP_Entrega1_SD.c,125 :: 		}
IT	AL
BAL	L_mensajesEst9
L_mensajesEst0:
;DSP_Entrega1_SD.c,126 :: 		else if(estado_SD==1)
MOVW	R0, #lo_addr(_estado_SD+0)
MOVT	R0, #hi_addr(_estado_SD+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_mensajesEst10
;DSP_Entrega1_SD.c,128 :: 		TFT_Write_Text("FAT16 BOOT NF", 5, 20);
MOVW	R0, #lo_addr(?lstr4_DSP_Entrega1_SD+0)
MOVT	R0, #hi_addr(?lstr4_DSP_Entrega1_SD+0)
MOVS	R2, #20
MOVS	R1, #5
BL	_TFT_Write_Text+0
;DSP_Entrega1_SD.c,129 :: 		Delay_ms(delay_msg);
MOVW	R7, #29523
MOVT	R7, #203
NOP
NOP
L_mensajesEst11:
SUBS	R7, R7, #1
BNE	L_mensajesEst11
NOP
NOP
NOP
NOP
;DSP_Entrega1_SD.c,130 :: 		}
IT	AL
BAL	L_mensajesEst13
L_mensajesEst10:
;DSP_Entrega1_SD.c,131 :: 		else if(estado_SD==255)
MOVW	R0, #lo_addr(_estado_SD+0)
MOVT	R0, #hi_addr(_estado_SD+0)
LDRB	R0, [R0, #0]
CMP	R0, #255
IT	NE
BNE	L_mensajesEst14
;DSP_Entrega1_SD.c,133 :: 		TFT_Write_Text("SD NOT DETECTED", 5, 20);
MOVW	R0, #lo_addr(?lstr5_DSP_Entrega1_SD+0)
MOVT	R0, #hi_addr(?lstr5_DSP_Entrega1_SD+0)
MOVS	R2, #20
MOVS	R1, #5
BL	_TFT_Write_Text+0
;DSP_Entrega1_SD.c,134 :: 		Delay_ms(delay_msg);
MOVW	R7, #29523
MOVT	R7, #203
NOP
NOP
L_mensajesEst15:
SUBS	R7, R7, #1
BNE	L_mensajesEst15
NOP
NOP
NOP
NOP
;DSP_Entrega1_SD.c,135 :: 		}
IT	AL
BAL	L_mensajesEst17
L_mensajesEst14:
;DSP_Entrega1_SD.c,138 :: 		TFT_Write_Text("DESCONOCIDO (??)", 5, 20);
MOVW	R0, #lo_addr(?lstr6_DSP_Entrega1_SD+0)
MOVT	R0, #hi_addr(?lstr6_DSP_Entrega1_SD+0)
MOVS	R2, #20
MOVS	R1, #5
BL	_TFT_Write_Text+0
;DSP_Entrega1_SD.c,139 :: 		Delay_ms(delay_msg);
MOVW	R7, #29523
MOVT	R7, #203
NOP
NOP
L_mensajesEst18:
SUBS	R7, R7, #1
BNE	L_mensajesEst18
NOP
NOP
NOP
NOP
;DSP_Entrega1_SD.c,140 :: 		}
L_mensajesEst17:
L_mensajesEst13:
L_mensajesEst9:
;DSP_Entrega1_SD.c,141 :: 		}
L_end_mensajesEst:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mensajesEst
_Proceso:
;DSP_Entrega1_SD.c,144 :: 		void Proceso(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP_Entrega1_SD.c,159 :: 		if(estado_File == 1){
MOVW	R0, #lo_addr(_estado_File+0)
MOVT	R0, #hi_addr(_estado_File+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Proceso20
;DSP_Entrega1_SD.c,160 :: 		display_width = Screen1.width;
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,161 :: 		display_height = Screen1.Height;
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,166 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;DSP_Entrega1_SD.c,167 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Proceso21:
SUBS	R7, R7, #1
BNE	L_Proceso21
NOP
NOP
NOP
NOP
;DSP_Entrega1_SD.c,172 :: 		DrawScreen(&Screen2);
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
BL	_DrawScreen+0
;DSP_Entrega1_SD.c,173 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Proceso23:
SUBS	R7, R7, #1
BNE	L_Proceso23
NOP
NOP
NOP
NOP
;DSP_Entrega1_SD.c,178 :: 		DrawScreen(&Screen3);
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
BL	_DrawScreen+0
;DSP_Entrega1_SD.c,179 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Proceso25:
SUBS	R7, R7, #1
BNE	L_Proceso25
NOP
NOP
NOP
NOP
;DSP_Entrega1_SD.c,184 :: 		DrawScreen(&Screen4);
MOVW	R0, #lo_addr(_Screen4+0)
MOVT	R0, #hi_addr(_Screen4+0)
BL	_DrawScreen+0
;DSP_Entrega1_SD.c,185 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Proceso27:
SUBS	R7, R7, #1
BNE	L_Proceso27
NOP
NOP
NOP
NOP
;DSP_Entrega1_SD.c,186 :: 		}
L_Proceso20:
;DSP_Entrega1_SD.c,187 :: 		}
L_end_Proceso:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Proceso
DSP_Entrega1_SD_InitializeObjects:
;DSP_Entrega1_SD.c,190 :: 		static void InitializeObjects() {
;DSP_Entrega1_SD.c,191 :: 		Screen1.Color                     = CL_WHITE;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,192 :: 		Screen1.Width                     = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,193 :: 		Screen1.Height                    = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,194 :: 		Screen1.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+8)
MOVT	R0, #hi_addr(_Screen1+8)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,195 :: 		Screen1.Images                    = Screen1_Images;
MOVW	R1, #lo_addr(_Screen1_Images+0)
MOVT	R1, #hi_addr(_Screen1_Images+0)
MOVW	R0, #lo_addr(_Screen1+12)
MOVT	R0, #hi_addr(_Screen1+12)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,196 :: 		Screen1.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,198 :: 		Screen2.Color                     = CL_WHITE;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,199 :: 		Screen2.Width                     = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen2+2)
MOVT	R0, #hi_addr(_Screen2+2)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,200 :: 		Screen2.Height                    = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen2+4)
MOVT	R0, #hi_addr(_Screen2+4)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,201 :: 		Screen2.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+8)
MOVT	R0, #hi_addr(_Screen2+8)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,202 :: 		Screen2.Images                    = Screen2_Images;
MOVW	R1, #lo_addr(_Screen2_Images+0)
MOVT	R1, #hi_addr(_Screen2_Images+0)
MOVW	R0, #lo_addr(_Screen2+12)
MOVT	R0, #hi_addr(_Screen2+12)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,203 :: 		Screen2.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+6)
MOVT	R0, #hi_addr(_Screen2+6)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,205 :: 		Screen3.Color                     = CL_WHITE;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,206 :: 		Screen3.Width                     = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen3+2)
MOVT	R0, #hi_addr(_Screen3+2)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,207 :: 		Screen3.Height                    = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen3+4)
MOVT	R0, #hi_addr(_Screen3+4)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,208 :: 		Screen3.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen3+8)
MOVT	R0, #hi_addr(_Screen3+8)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,209 :: 		Screen3.Images                    = Screen3_Images;
MOVW	R1, #lo_addr(_Screen3_Images+0)
MOVT	R1, #hi_addr(_Screen3_Images+0)
MOVW	R0, #lo_addr(_Screen3+12)
MOVT	R0, #hi_addr(_Screen3+12)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,210 :: 		Screen3.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen3+6)
MOVT	R0, #hi_addr(_Screen3+6)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,212 :: 		Screen4.Color                     = CL_WHITE;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen4+0)
MOVT	R0, #hi_addr(_Screen4+0)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,213 :: 		Screen4.Width                     = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen4+2)
MOVT	R0, #hi_addr(_Screen4+2)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,214 :: 		Screen4.Height                    = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen4+4)
MOVT	R0, #hi_addr(_Screen4+4)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,215 :: 		Screen4.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen4+8)
MOVT	R0, #hi_addr(_Screen4+8)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,216 :: 		Screen4.Images                    = Screen4_Images;
MOVW	R1, #lo_addr(_Screen4_Images+0)
MOVT	R1, #hi_addr(_Screen4_Images+0)
MOVW	R0, #lo_addr(_Screen4+12)
MOVT	R0, #hi_addr(_Screen4+12)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,217 :: 		Screen4.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen4+6)
MOVT	R0, #hi_addr(_Screen4+6)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,219 :: 		Screen5.Color                     = CL_WHITE;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen5+0)
MOVT	R0, #hi_addr(_Screen5+0)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,220 :: 		Screen5.Width                     = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen5+2)
MOVT	R0, #hi_addr(_Screen5+2)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,221 :: 		Screen5.Height                    = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen5+4)
MOVT	R0, #hi_addr(_Screen5+4)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,222 :: 		Screen5.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen5+8)
MOVT	R0, #hi_addr(_Screen5+8)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,223 :: 		Screen5.Images                    = Screen5_Images;
MOVW	R1, #lo_addr(_Screen5_Images+0)
MOVT	R1, #hi_addr(_Screen5_Images+0)
MOVW	R0, #lo_addr(_Screen5+12)
MOVT	R0, #hi_addr(_Screen5+12)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,224 :: 		Screen5.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen5+6)
MOVT	R0, #hi_addr(_Screen5+6)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,227 :: 		Image1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,228 :: 		Image1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,229 :: 		Image1.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,230 :: 		Image1.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,231 :: 		Image1.Width           = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,232 :: 		Image1.Height          = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,233 :: 		Image1.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,234 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,235 :: 		Image1.Picture_Name    = FATPANDA_bmp;
MOVS	R1, #97
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,236 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,237 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,238 :: 		Image1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+24)
MOVT	R0, #hi_addr(_Image1+24)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,239 :: 		Image1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+28)
MOVT	R0, #hi_addr(_Image1+28)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,240 :: 		Image1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+32)
MOVT	R0, #hi_addr(_Image1+32)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,241 :: 		Image1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+36)
MOVT	R0, #hi_addr(_Image1+36)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,243 :: 		Image2.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Image2+0)
MOVT	R0, #hi_addr(_Image2+0)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,244 :: 		Image2.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+4)
MOVT	R0, #hi_addr(_Image2+4)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,245 :: 		Image2.Left            = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Image2+6)
MOVT	R0, #hi_addr(_Image2+6)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,246 :: 		Image2.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Image2+8)
MOVT	R0, #hi_addr(_Image2+8)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,247 :: 		Image2.Width           = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Image2+10)
MOVT	R0, #hi_addr(_Image2+10)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,248 :: 		Image2.Height          = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image2+12)
MOVT	R0, #hi_addr(_Image2+12)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,249 :: 		Image2.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+22)
MOVT	R0, #hi_addr(_Image2+22)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,250 :: 		Image2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+23)
MOVT	R0, #hi_addr(_Image2+23)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,251 :: 		Image2.Picture_Name    = F1_bmp;
MOVW	R1, #38535
MOVW	R0, #lo_addr(_Image2+16)
MOVT	R0, #hi_addr(_Image2+16)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,252 :: 		Image2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+20)
MOVT	R0, #hi_addr(_Image2+20)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,253 :: 		Image2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+21)
MOVT	R0, #hi_addr(_Image2+21)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,254 :: 		Image2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+24)
MOVT	R0, #hi_addr(_Image2+24)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,255 :: 		Image2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+28)
MOVT	R0, #hi_addr(_Image2+28)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,256 :: 		Image2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+32)
MOVT	R0, #hi_addr(_Image2+32)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,257 :: 		Image2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+36)
MOVT	R0, #hi_addr(_Image2+36)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,259 :: 		Image3.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_Image3+0)
MOVT	R0, #hi_addr(_Image3+0)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,260 :: 		Image3.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+4)
MOVT	R0, #hi_addr(_Image3+4)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,261 :: 		Image3.Left            = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Image3+6)
MOVT	R0, #hi_addr(_Image3+6)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,262 :: 		Image3.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Image3+8)
MOVT	R0, #hi_addr(_Image3+8)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,263 :: 		Image3.Width           = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Image3+10)
MOVT	R0, #hi_addr(_Image3+10)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,264 :: 		Image3.Height          = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image3+12)
MOVT	R0, #hi_addr(_Image3+12)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,265 :: 		Image3.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+22)
MOVT	R0, #hi_addr(_Image3+22)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,266 :: 		Image3.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+23)
MOVT	R0, #hi_addr(_Image3+23)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,267 :: 		Image3.Picture_Name    = F2_bmp;
MOVW	R1, #48173
MOVW	R0, #lo_addr(_Image3+16)
MOVT	R0, #hi_addr(_Image3+16)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,268 :: 		Image3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+20)
MOVT	R0, #hi_addr(_Image3+20)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,269 :: 		Image3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+21)
MOVT	R0, #hi_addr(_Image3+21)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,270 :: 		Image3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+24)
MOVT	R0, #hi_addr(_Image3+24)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,271 :: 		Image3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+28)
MOVT	R0, #hi_addr(_Image3+28)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,272 :: 		Image3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+32)
MOVT	R0, #hi_addr(_Image3+32)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,273 :: 		Image3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+36)
MOVT	R0, #hi_addr(_Image3+36)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,275 :: 		Image4.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Image4+0)
MOVT	R0, #hi_addr(_Image4+0)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,276 :: 		Image4.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+4)
MOVT	R0, #hi_addr(_Image4+4)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,277 :: 		Image4.Left            = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Image4+6)
MOVT	R0, #hi_addr(_Image4+6)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,278 :: 		Image4.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Image4+8)
MOVT	R0, #hi_addr(_Image4+8)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,279 :: 		Image4.Width           = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Image4+10)
MOVT	R0, #hi_addr(_Image4+10)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,280 :: 		Image4.Height          = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image4+12)
MOVT	R0, #hi_addr(_Image4+12)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,281 :: 		Image4.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+22)
MOVT	R0, #hi_addr(_Image4+22)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,282 :: 		Image4.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+23)
MOVT	R0, #hi_addr(_Image4+23)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,283 :: 		Image4.Picture_Name    = F4_bmp;
MOVW	R1, #57811
MOVW	R0, #lo_addr(_Image4+16)
MOVT	R0, #hi_addr(_Image4+16)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,284 :: 		Image4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+20)
MOVT	R0, #hi_addr(_Image4+20)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,285 :: 		Image4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+21)
MOVT	R0, #hi_addr(_Image4+21)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,286 :: 		Image4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+24)
MOVT	R0, #hi_addr(_Image4+24)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,287 :: 		Image4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+28)
MOVT	R0, #hi_addr(_Image4+28)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,288 :: 		Image4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+32)
MOVT	R0, #hi_addr(_Image4+32)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,289 :: 		Image4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+36)
MOVT	R0, #hi_addr(_Image4+36)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,291 :: 		Image5.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_Image5+0)
MOVT	R0, #hi_addr(_Image5+0)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,292 :: 		Image5.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+4)
MOVT	R0, #hi_addr(_Image5+4)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,293 :: 		Image5.Left            = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Image5+6)
MOVT	R0, #hi_addr(_Image5+6)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,294 :: 		Image5.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Image5+8)
MOVT	R0, #hi_addr(_Image5+8)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,295 :: 		Image5.Width           = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Image5+10)
MOVT	R0, #hi_addr(_Image5+10)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,296 :: 		Image5.Height          = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image5+12)
MOVT	R0, #hi_addr(_Image5+12)
STRH	R1, [R0, #0]
;DSP_Entrega1_SD.c,297 :: 		Image5.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+22)
MOVT	R0, #hi_addr(_Image5+22)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,298 :: 		Image5.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+23)
MOVT	R0, #hi_addr(_Image5+23)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,299 :: 		Image5.Picture_Name    = F4_bmp;
MOVW	R1, #57811
MOVW	R0, #lo_addr(_Image5+16)
MOVT	R0, #hi_addr(_Image5+16)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,300 :: 		Image5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+20)
MOVT	R0, #hi_addr(_Image5+20)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,301 :: 		Image5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+21)
MOVT	R0, #hi_addr(_Image5+21)
STRB	R1, [R0, #0]
;DSP_Entrega1_SD.c,302 :: 		Image5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+24)
MOVT	R0, #hi_addr(_Image5+24)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,303 :: 		Image5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+28)
MOVT	R0, #hi_addr(_Image5+28)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,304 :: 		Image5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+32)
MOVT	R0, #hi_addr(_Image5+32)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,305 :: 		Image5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+36)
MOVT	R0, #hi_addr(_Image5+36)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,306 :: 		}
L_end_InitializeObjects:
BX	LR
; end of DSP_Entrega1_SD_InitializeObjects
_InitPantalla:
;DSP_Entrega1_SD.c,308 :: 		void InitPantalla(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP_Entrega1_SD.c,310 :: 		_GPIO_PINMASK_8,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
MOVW	R1, #1792
;DSP_Entrega1_SD.c,309 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_9| _GPIO_PINMASK_10|
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;DSP_Entrega1_SD.c,310 :: 		_GPIO_PINMASK_8,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
BL	_GPIO_Config+0
;DSP_Entrega1_SD.c,313 :: 		_GPIO_PINMASK_10 ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);    //CAMBIAR 3 POR 6
MOV	R2, #532
MOVW	R1, #1137
;DSP_Entrega1_SD.c,312 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 |_GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 |
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;DSP_Entrega1_SD.c,313 :: 		_GPIO_PINMASK_10 ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);    //CAMBIAR 3 POR 6
BL	_GPIO_Config+0
;DSP_Entrega1_SD.c,316 :: 		_GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
;DSP_Entrega1_SD.c,315 :: 		GPIO_Config(&GPIOC_BASE,_GPIO_PINMASK_1 | _GPIO_PINMASK_7 ,_GPIO_CFG_MODE_OUTPUT |
MOVW	R1, #130
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;DSP_Entrega1_SD.c,316 :: 		_GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
BL	_GPIO_Config+0
;DSP_Entrega1_SD.c,319 :: 		_GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_8 );
MOVW	R1, #1811
;DSP_Entrega1_SD.c,318 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_0 |_GPIO_PINMASK_1 |_GPIO_PINMASK_4 |
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;DSP_Entrega1_SD.c,319 :: 		_GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_8 );
BL	_GPIO_Digital_Output+0
;DSP_Entrega1_SD.c,322 :: 		_GPIO_PINMASK_10);
MOVW	R1, #1080
;DSP_Entrega1_SD.c,321 :: 		GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 |
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;DSP_Entrega1_SD.c,322 :: 		_GPIO_PINMASK_10);
BL	_GPIO_Digital_Output+0
;DSP_Entrega1_SD.c,324 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;DSP_Entrega1_SD.c,326 :: 		TFT_Set_Active(&TFT_Set_Index_Custom, &TFT_Write_Command_Custom, &TFT_Write_Data_Custom);
MOVW	R2, #lo_addr(_TFT_Write_Data_Custom+0)
MOVT	R2, #hi_addr(_TFT_Write_Data_Custom+0)
MOVW	R1, #lo_addr(_TFT_Write_Command_Custom+0)
MOVT	R1, #hi_addr(_TFT_Write_Command_Custom+0)
MOVW	R0, #lo_addr(_TFT_Set_Index_Custom+0)
MOVT	R0, #hi_addr(_TFT_Set_Index_Custom+0)
BL	_TFT_Set_Active+0
;DSP_Entrega1_SD.c,327 :: 		TFT_Init_ILI9341_8bit_Custom(320, 240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit_Custom+0
;DSP_Entrega1_SD.c,328 :: 		}
L_end_InitPantalla:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitPantalla
_TFT_Set_Index_Custom:
;DSP_Entrega1_SD.c,331 :: 		void TFT_Set_Index_Custom(unsigned short index) {
; index start address is: 0 (R0)
UXTB	R2, R0
; index end address is: 0 (R0)
; index start address is: 8 (R2)
;DSP_Entrega1_SD.c,333 :: 		TFT_RS = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,338 :: 		temp = index;
; temp start address is: 0 (R0)
UXTB	R0, R2
; index end address is: 8 (R2)
;DSP_Entrega1_SD.c,339 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,340 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;DSP_Entrega1_SD.c,341 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,342 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,343 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,344 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,345 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,346 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,348 :: 		TFT_WR = 0;
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,349 :: 		asm nop;
NOP
;DSP_Entrega1_SD.c,350 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,351 :: 		}
L_end_TFT_Set_Index_Custom:
BX	LR
; end of _TFT_Set_Index_Custom
_TFT_Write_Command_Custom:
;DSP_Entrega1_SD.c,352 :: 		void TFT_Write_Command_Custom(unsigned short cmd) {
; cmd start address is: 0 (R0)
UXTB	R3, R0
; cmd end address is: 0 (R0)
; cmd start address is: 12 (R3)
;DSP_Entrega1_SD.c,354 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,359 :: 		temp = cmd;
; temp start address is: 0 (R0)
UXTB	R0, R3
; cmd end address is: 12 (R3)
;DSP_Entrega1_SD.c,360 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,361 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;DSP_Entrega1_SD.c,362 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,363 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,364 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,365 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,366 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,367 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,369 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,370 :: 		asm nop;
NOP
;DSP_Entrega1_SD.c,371 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,372 :: 		}
L_end_TFT_Write_Command_Custom:
BX	LR
; end of _TFT_Write_Command_Custom
_TFT_Write_Data_Custom:
;DSP_Entrega1_SD.c,373 :: 		void TFT_Write_Data_Custom(unsigned int _data) {
SUB	SP, SP, #4
STRH	R0, [SP, #0]
;DSP_Entrega1_SD.c,375 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,380 :: 		temp = Hi(_data);
ADD	R1, SP, #0
ADDS	R1, R1, #1
LDRB	R0, [R1, #0]
; temp start address is: 0 (R0)
UXTB	R0, R0
;DSP_Entrega1_SD.c,381 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,382 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;DSP_Entrega1_SD.c,383 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,384 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,385 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,386 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,387 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,388 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,390 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,391 :: 		asm nop;
NOP
;DSP_Entrega1_SD.c,392 :: 		TFT_WR = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R3, #lo_addr(GPIOA_ODR+0)
MOVT	R3, #hi_addr(GPIOA_ODR+0)
_SX	[R3, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,397 :: 		temp = Lo(_data);
ADD	R1, SP, #0
LDRB	R1, [R1, #0]
; temp start address is: 0 (R0)
UXTB	R0, R1
;DSP_Entrega1_SD.c,398 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,399 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;DSP_Entrega1_SD.c,400 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,401 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,402 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,403 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,404 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;DSP_Entrega1_SD.c,405 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,407 :: 		TFT_WR = 0;
MOVS	R1, #0
SXTB	R1, R1
_SX	[R3, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,408 :: 		asm nop;
NOP
;DSP_Entrega1_SD.c,409 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
;DSP_Entrega1_SD.c,410 :: 		}
L_end_TFT_Write_Data_Custom:
ADD	SP, SP, #4
BX	LR
; end of _TFT_Write_Data_Custom
_Init_MCU:
;DSP_Entrega1_SD.c,412 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP_Entrega1_SD.c,413 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_3);  //CAMBIAR E9 A D3
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;DSP_Entrega1_SD.c,415 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;DSP_Entrega1_SD.c,417 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_Init_Ext_Mem:
;DSP_Entrega1_SD.c,419 :: 		void Init_Ext_Mem() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP_Entrega1_SD.c,424 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;DSP_Entrega1_SD.c,423 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;DSP_Entrega1_SD.c,421 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #5
;DSP_Entrega1_SD.c,424 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;DSP_Entrega1_SD.c,426 :: 		Delay_ms(10);
MOVW	R7, #53331
MOVT	R7, #0
NOP
NOP
L_Init_Ext_Mem29:
SUBS	R7, R7, #1
BNE	L_Init_Ext_Mem29
NOP
NOP
NOP
NOP
;DSP_Entrega1_SD.c,445 :: 		estado_SD = Mmc_Fat_Init();
BL	_Mmc_Fat_Init+0
MOVW	R1, #lo_addr(_estado_SD+0)
MOVT	R1, #hi_addr(_estado_SD+0)
STRB	R0, [R1, #0]
;DSP_Entrega1_SD.c,447 :: 		if (!estado_SD) {
CMP	R0, #0
IT	NE
BNE	L_Init_Ext_Mem31
;DSP_Entrega1_SD.c,449 :: 		SPI3_CR1 = 0;    //  ??????
MOVS	R1, #0
MOVW	R0, #lo_addr(SPI3_CR1+0)
MOVT	R0, #hi_addr(SPI3_CR1+0)
STR	R1, [R0, #0]
;DSP_Entrega1_SD.c,455 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;DSP_Entrega1_SD.c,454 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;DSP_Entrega1_SD.c,452 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #0
;DSP_Entrega1_SD.c,455 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;DSP_Entrega1_SD.c,472 :: 		estado_File = Mmc_Fat_Assign("entregaa.RES", 0);
MOVW	R0, #lo_addr(?lstr7_DSP_Entrega1_SD+0)
MOVT	R0, #hi_addr(?lstr7_DSP_Entrega1_SD+0)
MOVS	R1, #0
BL	_Mmc_Fat_Assign+0
MOVW	R1, #lo_addr(_estado_File+0)
MOVT	R1, #hi_addr(_estado_File+0)
STRH	R0, [R1, #0]
;DSP_Entrega1_SD.c,473 :: 		if(estado_File == 1) Mmc_Fat_Reset(&res_file_size);
MOV	R0, R1
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Init_Ext_Mem32
MOVW	R0, #lo_addr(_res_file_size+0)
MOVT	R0, #hi_addr(_res_file_size+0)
BL	_Mmc_Fat_Reset+0
L_Init_Ext_Mem32:
;DSP_Entrega1_SD.c,474 :: 		}
L_Init_Ext_Mem31:
;DSP_Entrega1_SD.c,475 :: 		}
L_end_Init_Ext_Mem:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_Ext_Mem
_TFT_Get_Data:
;DSP_Entrega1_SD.c,478 :: 		char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
; offset start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R2, [SP, #16]
MOV	R2, R0
STR	R1, [SP, #12]
; offset end address is: 0 (R0)
; offset start address is: 8 (R2)
;DSP_Entrega1_SD.c,482 :: 		start_sector = Mmc_Get_File_Write_Sector() + offset/512;
BL	_Mmc_Get_File_Write_Sector+0
LSRS	R3, R2, #9
ADDS	R4, R0, R3
STR	R4, [SP, #4]
;DSP_Entrega1_SD.c,483 :: 		fpos = (unsigned long)offset%512;
MOVW	R3, #511
AND	R3, R2, R3, LSL #0
; offset end address is: 8 (R2)
STRH	R3, [SP, #8]
;DSP_Entrega1_SD.c,485 :: 		if(start_sector == currentSector+1) {
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
ADDS	R3, R3, #1
CMP	R4, R3
IT	NE
BNE	L_TFT_Get_Data33
;DSP_Entrega1_SD.c,486 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;DSP_Entrega1_SD.c,487 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;DSP_Entrega1_SD.c,488 :: 		} else if (start_sector != currentSector) {
IT	AL
BAL	L_TFT_Get_Data34
L_TFT_Get_Data33:
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R4, [R3, #0]
LDR	R3, [SP, #4]
CMP	R3, R4
IT	EQ
BEQ	L_TFT_Get_Data35
;DSP_Entrega1_SD.c,489 :: 		if(currentSector != -1)
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
CMP	R3, #-1
IT	EQ
BEQ	L_TFT_Get_Data36
;DSP_Entrega1_SD.c,490 :: 		Mmc_Multi_Read_Stop();
BL	_Mmc_Multi_Read_Stop+0
L_TFT_Get_Data36:
;DSP_Entrega1_SD.c,491 :: 		Mmc_Multi_Read_Start(start_sector);
LDR	R0, [SP, #4]
BL	_Mmc_Multi_Read_Start+0
;DSP_Entrega1_SD.c,492 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;DSP_Entrega1_SD.c,493 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;DSP_Entrega1_SD.c,494 :: 		}
L_TFT_Get_Data35:
L_TFT_Get_Data34:
;DSP_Entrega1_SD.c,496 :: 		if(count>512-fpos)
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #12]
CMP	R3, R4
IT	LS
BLS	L_TFT_Get_Data37
;DSP_Entrega1_SD.c,497 :: 		*num = 512-fpos;
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
IT	AL
BAL	L_TFT_Get_Data38
L_TFT_Get_Data37:
;DSP_Entrega1_SD.c,499 :: 		*num = count;
LDR	R4, [SP, #12]
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
L_TFT_Get_Data38:
;DSP_Entrega1_SD.c,501 :: 		return Ext_Data_Buffer+fpos;
LDRH	R4, [SP, #8]
MOVW	R3, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R3, #hi_addr(_Ext_Data_Buffer+0)
ADDS	R3, R3, R4
MOV	R0, R3
;DSP_Entrega1_SD.c,502 :: 		}
L_end_TFT_Get_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _TFT_Get_Data
_DrawImage:
;DSP_Entrega1_SD.c,507 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;DSP_Entrega1_SD.c,508 :: 		if (AImage->Visible != 0) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage39
;DSP_Entrega1_SD.c,509 :: 		TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
ADDW	R1, R0, #23
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
UXTB	R3, R4
BL	_TFT_Ext_Image+0
;DSP_Entrega1_SD.c,510 :: 		}
L_DrawImage39:
;DSP_Entrega1_SD.c,511 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawScreen:
;DSP_Entrega1_SD.c,513 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;DSP_Entrega1_SD.c,518 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;DSP_Entrega1_SD.c,519 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;DSP_Entrega1_SD.c,520 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;DSP_Entrega1_SD.c,522 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen52
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen51
IT	AL
BAL	L_DrawScreen42
L__DrawScreen52:
L__DrawScreen51:
;DSP_Entrega1_SD.c,523 :: 		TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init+0
;DSP_Entrega1_SD.c,524 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R1, #lo_addr(_TFT_Get_Data+0)
MOVT	R1, #hi_addr(_TFT_Get_Data+0)
MOV	R0, R1
BL	_TFT_Set_Ext_Buffer+0
;DSP_Entrega1_SD.c,525 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;DSP_Entrega1_SD.c,526 :: 		display_width = CurrentScreen->Width;
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;DSP_Entrega1_SD.c,527 :: 		display_height = CurrentScreen->Height;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;DSP_Entrega1_SD.c,528 :: 		}
IT	AL
BAL	L_DrawScreen43
L_DrawScreen42:
;DSP_Entrega1_SD.c,530 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen43:
;DSP_Entrega1_SD.c,533 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen44:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen45
;DSP_Entrega1_SD.c,534 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen46
;DSP_Entrega1_SD.c,535 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #6]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #8]
;DSP_Entrega1_SD.c,536 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen47
;DSP_Entrega1_SD.c,537 :: 		image_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;DSP_Entrega1_SD.c,538 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;DSP_Entrega1_SD.c,539 :: 		DrawImage(local_image);
LDR	R0, [SP, #8]
BL	_DrawImage+0
;DSP_Entrega1_SD.c,540 :: 		}
L_DrawScreen47:
;DSP_Entrega1_SD.c,541 :: 		}
L_DrawScreen46:
;DSP_Entrega1_SD.c,543 :: 		}
IT	AL
BAL	L_DrawScreen44
L_DrawScreen45:
;DSP_Entrega1_SD.c,544 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawScreen
_main:
;DSP_Entrega1_SD.c,547 :: 		void main()
;DSP_Entrega1_SD.c,549 :: 		GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_0);                                           //   ??????
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Analog_Input+0
;DSP_Entrega1_SD.c,550 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, _GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO);      //   ??????
MOV	R2, #65
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;DSP_Entrega1_SD.c,553 :: 		InitPantalla();
BL	_InitPantalla+0
;DSP_Entrega1_SD.c,554 :: 		InitializeObjects();
BL	DSP_Entrega1_SD_InitializeObjects+0
;DSP_Entrega1_SD.c,555 :: 		Init_MCU();
BL	_Init_MCU+0
;DSP_Entrega1_SD.c,556 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;DSP_Entrega1_SD.c,559 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R0, #lo_addr(_TFT_Get_Data+0)
MOVT	R0, #hi_addr(_TFT_Get_Data+0)
BL	_TFT_Set_Ext_Buffer+0
;DSP_Entrega1_SD.c,562 :: 		mensajesEst();
BL	_mensajesEst+0
;DSP_Entrega1_SD.c,565 :: 		while(1){
L_main48:
;DSP_Entrega1_SD.c,566 :: 		Proceso();
BL	_Proceso+0
;DSP_Entrega1_SD.c,567 :: 		}
IT	AL
BAL	L_main48
;DSP_Entrega1_SD.c,568 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
