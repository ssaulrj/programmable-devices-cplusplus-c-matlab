#line 1 "C:/Users/Saulp/Downloads/stm_DP/DSPEntrega1/DSP_Entrega1_SD.c"
#line 1 "c:/users/saulp/downloads/stm_dp/dspentrega1/pantalla.h"


void TFT_Set_Index_Custom(unsigned short );
void TFT_Write_Command_Custom(unsigned short );
void TFT_Write_Data_Custom(unsigned int );
void InitPantalla();
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdio.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdlib.h"







 typedef struct divstruct {
 int quot;
 int rem;
 } div_t;

 typedef struct ldivstruct {
 long quot;
 long rem;
 } ldiv_t;

 typedef struct uldivstruct {
 unsigned long quot;
 unsigned long rem;
 } uldiv_t;

int abs(int a);
float atof(char * s);
int atoi(char * s);
long atol(char * s);
div_t div(int number, int denom);
ldiv_t ldiv(long number, long denom);
uldiv_t uldiv(unsigned long number, unsigned long denom);
long labs(long x);
long int max(long int a, long int b);
long int min(long int a, long int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/math.h"





double fabs(double d);
double floor(double x);
double ceil(double x);
double frexp(double value, int * eptr);
double ldexp(double value, int newexp);
double modf(double val, double * iptr);
double sqrt(double x);
double atan(double f);
double asin(double x);
double acos(double x);
double atan2(double y,double x);
double sin(double f);
double cos(double f);
double tan(double x);
double exp(double x);
double log(double x);
double log10(double x);
double pow(double x, double y);
double sinh(double x);
double cosh(double x);
double tanh(double x);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/time.h"



struct tm {
 unsigned long tm_sec;
 unsigned long tm_min;
 unsigned long tm_hour;
 unsigned long tm_mday;
 unsigned long tm_mon;
 unsigned long tm_year;
 unsigned long tm_wday;
 unsigned long tm_yday;
 unsigned long tm_isdst;
};









 typedef unsigned long size_t;


typedef unsigned long clock_t;
typedef unsigned long time_t;
#line 1 "c:/users/saulp/downloads/stm_dp/dspentrega1/entregaa1_objects.h"
typedef struct Screen TScreen;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int ImagesCount;
 TImage * const code *Images;
};

extern TScreen Screen1;
extern TImage Image1;
extern TImage * const code Screen1_Images[1];

extern TScreen Screen2;
extern TImage Image2;
extern TImage * const code Screen2_Images[1];

extern TScreen Screen3;
extern TImage Image3;
extern TImage * const code Screen3_Images[1];

extern TScreen Screen4;
extern TImage Image4;
extern TImage * const code Screen4_Images[1];

extern TScreen Screen5;
extern TImage Image5;
extern TImage * const code Screen5_Images[1];








extern char Image1_Caption[];
extern char Image2_Caption[];
extern char Image3_Caption[];
extern char Image4_Caption[];
extern char Image5_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawImage(TImage *AImage);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 29 "C:/Users/Saulp/Downloads/stm_DP/DSPEntrega1/DSP_Entrega1_SD.c"
 void Proceso();
 void InitPantalla();
 void Init_Ext_Mem();
 void Init_MCU();
 static void InitializeObjects();
 void TFT_Set_Index_Custom(unsigned short);
 void TFT_Write_Command_Custom(unsigned short);
 void TFT_Write_Data_Custom(unsigned int);
 void DrawImage(TImage *);
 void DrawScreen(TScreen *);
 char* TFT_Get_Data(unsigned long, unsigned long, unsigned long);



 sbit Mmc_Chip_Select at GPIOD_ODR.B15;



 unsigned int TFT_DataPort at GPIOE_ODR;
 sbit TFT_DataPort_B0 at GPIOA_ODR.B9;
 sbit TFT_DataPort_B1 at GPIOC_ODR.B7;
 sbit TFT_DataPort_B2 at GPIOA_ODR.B10;
 sbit TFT_DataPort_B3 at GPIOB_ODR.B6;
 sbit TFT_DataPort_B4 at GPIOB_ODR.B5;
 sbit TFT_DataPort_B5 at GPIOB_ODR.B4;
 sbit TFT_DataPort_B6 at GPIOB_ODR.B10;
 sbit TFT_DataPort_B7 at GPIOA_ODR.B8;
 sbit TFT_RST at GPIOC_ODR.B1;
 sbit TFT_CS at GPIOB_ODR.B0;
 sbit TFT_RS at GPIOA_ODR.B4;
 sbit TFT_WR at GPIOA_ODR.B1;
 sbit TFT_RD at GPIOA_ODR.B0;


 unsigned int Xcoord, Ycoord;
 unsigned int display_width, display_height;

 int _object_count;
 TImage *local_image;
 TImage *exec_image;
 int image_order;


 unsigned short estado_SD;
 unsigned int estado_File;


 char Ext_Data_Buffer[512];
 unsigned long currentSector = -1, res_file_size;





 TScreen * CurrentScreen;

 TScreen Screen1;
 TImage Image1;
 TImage * const code Screen1_Images[1]={&Image1};

 TScreen Screen2;
 TImage Image2;
 TImage * const code Screen2_Images[1]={&Image2};

 TScreen Screen3;
 TImage Image3;
 TImage * const code Screen3_Images[1]={&Image3};

 TScreen Screen4;
 TImage Image4;
 TImage * const code Screen4_Images[1]={&Image4};

 TScreen Screen5;
 TImage Image5;
 TImage * const code Screen5_Images[1]={&Image5};



void mensajesEst(){
 const int delay_msg = 2500;

 TFT_Fill_Screen(CL_WHITE);
 if(estado_SD==0){
 TFT_Write_Text("MMC_FAT_INIT -> GOOD", 5, 20);
 Delay_ms(delay_msg);

 if(estado_File == 1){
 TFT_Fill_Screen(CL_WHITE);
 TFT_Write_Text("Mmc_Fat_Assign -> GOOD", 5, 20);
 Delay_ms(delay_msg);
 }
 else{
 TFT_Fill_Screen(CL_WHITE);
 TFT_Write_Text("PROBLEMAS CON EL ARCHIVO FUENTE", 5, 20);
 Delay_ms(delay_msg);
 }
 }
 else if(estado_SD==1)
 {
 TFT_Write_Text("FAT16 BOOT NF", 5, 20);
 Delay_ms(delay_msg);
 }
 else if(estado_SD==255)
 {
 TFT_Write_Text("SD NOT DETECTED", 5, 20);
 Delay_ms(delay_msg);
 }
 else
 {
 TFT_Write_Text("DESCONOCIDO (??)", 5, 20);
 Delay_ms(delay_msg);
 }
}


 void Proceso(){
#line 159 "C:/Users/Saulp/Downloads/stm_DP/DSPEntrega1/DSP_Entrega1_SD.c"
 if(estado_File == 1){
 display_width = Screen1.width;
 display_height = Screen1.Height;




 DrawScreen(&Screen1);
 Delay_ms(1000);




 DrawScreen(&Screen2);
 Delay_ms(1000);




 DrawScreen(&Screen3);
 Delay_ms(1000);




 DrawScreen(&Screen4);
 Delay_ms(1000);
 }
 }


 static void InitializeObjects() {
 Screen1.Color = CL_WHITE;
 Screen1.Width = 320;
 Screen1.Height = 240;
 Screen1.ImagesCount = 1;
 Screen1.Images = Screen1_Images;
 Screen1.ObjectsCount = 1;

 Screen2.Color = CL_WHITE;
 Screen2.Width = 320;
 Screen2.Height = 240;
 Screen2.ImagesCount = 1;
 Screen2.Images = Screen2_Images;
 Screen2.ObjectsCount = 1;

 Screen3.Color = CL_WHITE;
 Screen3.Width = 320;
 Screen3.Height = 240;
 Screen3.ImagesCount = 1;
 Screen3.Images = Screen3_Images;
 Screen3.ObjectsCount = 1;

 Screen4.Color = CL_WHITE;
 Screen4.Width = 320;
 Screen4.Height = 240;
 Screen4.ImagesCount = 1;
 Screen4.Images = Screen4_Images;
 Screen4.ObjectsCount = 1;

 Screen5.Color = CL_WHITE;
 Screen5.Width = 320;
 Screen5.Height = 240;
 Screen5.ImagesCount = 1;
 Screen5.Images = Screen5_Images;
 Screen5.ObjectsCount = 1;


 Image1.OwnerScreen = &Screen1;
 Image1.Order = 0;
 Image1.Left = 0;
 Image1.Top = 0;
 Image1.Width = 320;
 Image1.Height = 240;
 Image1.Picture_Type = 0;
 Image1.Picture_Ratio = 1;
 Image1.Picture_Name =  0x00000061 ;
 Image1.Visible = 1;
 Image1.Active = 1;
 Image1.OnUpPtr = 0;
 Image1.OnDownPtr = 0;
 Image1.OnClickPtr = 0;
 Image1.OnPressPtr = 0;

 Image2.OwnerScreen = &Screen2;
 Image2.Order = 0;
 Image2.Left = 100;
 Image2.Top = 40;
 Image2.Width = 120;
 Image2.Height = 160;
 Image2.Picture_Type = 0;
 Image2.Picture_Ratio = 1;
 Image2.Picture_Name =  0x00009687 ;
 Image2.Visible = 1;
 Image2.Active = 1;
 Image2.OnUpPtr = 0;
 Image2.OnDownPtr = 0;
 Image2.OnClickPtr = 0;
 Image2.OnPressPtr = 0;

 Image3.OwnerScreen = &Screen3;
 Image3.Order = 0;
 Image3.Left = 100;
 Image3.Top = 40;
 Image3.Width = 120;
 Image3.Height = 160;
 Image3.Picture_Type = 0;
 Image3.Picture_Ratio = 1;
 Image3.Picture_Name =  0x0000BC2D ;
 Image3.Visible = 1;
 Image3.Active = 1;
 Image3.OnUpPtr = 0;
 Image3.OnDownPtr = 0;
 Image3.OnClickPtr = 0;
 Image3.OnPressPtr = 0;

 Image4.OwnerScreen = &Screen4;
 Image4.Order = 0;
 Image4.Left = 100;
 Image4.Top = 40;
 Image4.Width = 120;
 Image4.Height = 160;
 Image4.Picture_Type = 0;
 Image4.Picture_Ratio = 1;
 Image4.Picture_Name =  0x0000E1D3 ;
 Image4.Visible = 1;
 Image4.Active = 1;
 Image4.OnUpPtr = 0;
 Image4.OnDownPtr = 0;
 Image4.OnClickPtr = 0;
 Image4.OnPressPtr = 0;

 Image5.OwnerScreen = &Screen5;
 Image5.Order = 0;
 Image5.Left = 100;
 Image5.Top = 40;
 Image5.Width = 120;
 Image5.Height = 160;
 Image5.Picture_Type = 0;
 Image5.Picture_Ratio = 1;
 Image5.Picture_Name =  0x0000E1D3 ;
 Image5.Visible = 1;
 Image5.Active = 1;
 Image5.OnUpPtr = 0;
 Image5.OnDownPtr = 0;
 Image5.OnClickPtr = 0;
 Image5.OnPressPtr = 0;
 }

 void InitPantalla(){
 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_9| _GPIO_PINMASK_10|
 _GPIO_PINMASK_8,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);

 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 |_GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 |
 _GPIO_PINMASK_10 ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);

 GPIO_Config(&GPIOC_BASE,_GPIO_PINMASK_1 | _GPIO_PINMASK_7 ,_GPIO_CFG_MODE_OUTPUT |
 _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);

 GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_0 |_GPIO_PINMASK_1 |_GPIO_PINMASK_4 |
 _GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_8 );

 GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 |
 _GPIO_PINMASK_10);

 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_7);

 TFT_Set_Active(&TFT_Set_Index_Custom, &TFT_Write_Command_Custom, &TFT_Write_Data_Custom);
 TFT_Init_ILI9341_8bit_Custom(320, 240);
 }


 void TFT_Set_Index_Custom(unsigned short index) {
 unsigned int temp;
 TFT_RS = 0;




 temp = index;
 TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
 TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
 TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
 TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
 TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
 TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
 TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
 TFT_DataPort_B7 = ((temp & 0x80) >> 7 );

 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
 }
 void TFT_Write_Command_Custom(unsigned short cmd) {
 unsigned int temp;
 TFT_RS = 1;




 temp = cmd;
 TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
 TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
 TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
 TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
 TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
 TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
 TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
 TFT_DataPort_B7 = ((temp & 0x80) >> 7 );

 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
 }
 void TFT_Write_Data_Custom(unsigned int _data) {
 unsigned int temp;
 TFT_RS = 1;




 temp =  ((char *)&_data)[1] ;
 TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
 TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
 TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
 TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
 TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
 TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
 TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
 TFT_DataPort_B7 = ((temp & 0x80) >> 7 );

 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;




 temp =  ((char *)&_data)[0] ;
 TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
 TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
 TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
 TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
 TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
 TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
 TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
 TFT_DataPort_B7 = ((temp & 0x80) >> 7 );

 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
 }

 void Init_MCU() {
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_3);

 TFT_Set_Default_Mode();

 }

 void Init_Ext_Mem() {

 SPI3_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
 _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
 _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
 &_GPIO_MODULE_SPI3_PC10_11_12);

 Delay_ms(10);
#line 445 "C:/Users/Saulp/Downloads/stm_DP/DSPEntrega1/DSP_Entrega1_SD.c"
 estado_SD = Mmc_Fat_Init();

 if (!estado_SD) {

 SPI3_CR1 = 0;


 SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
 _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
 _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
 &_GPIO_MODULE_SPI3_PC10_11_12);
#line 472 "C:/Users/Saulp/Downloads/stm_DP/DSPEntrega1/DSP_Entrega1_SD.c"
 estado_File = Mmc_Fat_Assign("entregaa.RES", 0);
 if(estado_File == 1) Mmc_Fat_Reset(&res_file_size);
 }
 }


 char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
 unsigned long start_sector;
 unsigned int fpos;

 start_sector = Mmc_Get_File_Write_Sector() + offset/512;
 fpos = (unsigned long)offset%512;

 if(start_sector == currentSector+1) {
 Mmc_Multi_Read_Sector(Ext_Data_Buffer);
 currentSector = start_sector;
 } else if (start_sector != currentSector) {
 if(currentSector != -1)
 Mmc_Multi_Read_Stop();
 Mmc_Multi_Read_Start(start_sector);
 Mmc_Multi_Read_Sector(Ext_Data_Buffer);
 currentSector = start_sector;
 }

 if(count>512-fpos)
 *num = 512-fpos;
 else
 *num = count;

 return Ext_Data_Buffer+fpos;
 }




 void DrawImage(TImage *AImage) {
 if (AImage->Visible != 0) {
 TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
 }
 }

 void DrawScreen(TScreen *aScreen) {
 unsigned int order;
 unsigned short image_idx;
 TImage *local_image;

 order = 0;
 image_idx = 0;
 CurrentScreen = aScreen;

 if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
 TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
 TFT_Set_Ext_Buffer(TFT_Get_Data);
 TFT_Fill_Screen(CurrentScreen->Color);
 display_width = CurrentScreen->Width;
 display_height = CurrentScreen->Height;
 }
 else
 TFT_Fill_Screen(CurrentScreen->Color);


 while (order < CurrentScreen->ObjectsCount) {
 if (image_idx < CurrentScreen->ImagesCount) {
 local_image =  CurrentScreen->Images[image_idx] ;
 if (order == local_image->Order) {
 image_idx++;
 order++;
 DrawImage(local_image);
 }
 }

 }
 }


 void main()
 {
 GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_0);
 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, _GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO);


 InitPantalla();
 InitializeObjects();
 Init_MCU();
 Init_Ext_Mem();


 TFT_Set_Ext_Buffer(TFT_Get_Data);


 mensajesEst();


 while(1){
 Proceso();
 }
 }
