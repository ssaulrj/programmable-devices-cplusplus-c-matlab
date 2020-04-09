  /*Recursos
  TFT Display Library
    http://download.mikroe.com/documents/compilers/mikroc/arm/help/tft_library.htm#tft_ext_image

  MMC Library
    http://download.mikroe.com/documents/compilers/mikroc/arm/help/mmc_library.htm#mmc_multi_read_sector

*/

//#include(s)
  #include <Pantalla.h>
  #include <built_in.h>
  #include <stdio.h>
  #include <string.h>
  #include <stdlib.h>
  #include <math.h>
  #include <time.h>

  ////Generados en VISUAL FFT
  #include "entregaa1_objects.h"

  //Generados en VISUAL FFT
  #define FATPANDA_bmp 0x00000061
  #define F1_bmp       0x00009687
  #define F2_bmp       0x0000BC2D
  #define F4_bmp       0x0000E1D3

//PROTOTIPOS DE FUNCIONES
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

//CONNECTIONS
  // MMC/SD Connections
  sbit Mmc_Chip_Select at GPIOD_ODR.B15;      //SD_SS?
  // end of MMC/SD

  // TFT CONNECTIONS
  unsigned int TFT_DataPort at GPIOE_ODR;
  sbit TFT_DataPort_B0 at GPIOA_ODR.B9;    //-
  sbit TFT_DataPort_B1 at GPIOC_ODR.B7;    //
  sbit TFT_DataPort_B2 at GPIOA_ODR.B10;   //-
  sbit TFT_DataPort_B3 at GPIOB_ODR.B6;    //CAMBIAR B3 POR B6
  sbit TFT_DataPort_B4 at GPIOB_ODR.B5;    //
  sbit TFT_DataPort_B5 at GPIOB_ODR.B4;    //
  sbit TFT_DataPort_B6 at GPIOB_ODR.B10;  //
  sbit TFT_DataPort_B7 at GPIOA_ODR.B8;  //-
  sbit TFT_RST at GPIOC_ODR.B1;    //
  sbit TFT_CS at GPIOB_ODR.B0;     //
  sbit TFT_RS at GPIOA_ODR.B4;     //
  sbit TFT_WR at GPIOA_ODR.B1;     //
  sbit TFT_RD at GPIOA_ODR.B0;     //

//GLOBAL VARIABLES
  unsigned int Xcoord, Ycoord;
  unsigned int display_width, display_height;

  int _object_count;
  TImage *local_image;
  TImage *exec_image;
  int image_order;

  //Para los mensajes de estado
  unsigned short estado_SD;
  unsigned int estado_File;

  // TFT Get Data globals
  char Ext_Data_Buffer[512];
  unsigned long currentSector = -1, res_file_size;
  // end of TFT Get Data

  //"Objetos" TScreen y TImage
    //Etos "objetos" están definidos en "entregaa1_objects.h"

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


//Mensajes de estado
void mensajesEst(){
      const int delay_msg = 2500;
      //---------------  Mensajes de estado  ---------------
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

//PROCESO()
  void Proceso(){
       //TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
       /*
       //---------------  Imagenes en la memoria local  ---------------
       TFT_Image(0, 0, FATPANDA_bmp, 1);
       Delay_ms(500);

       TFT_Fill_Screen(CL_WHITE);
       TFT_Image(100, 40, F1_bmp, 1);
       Delay_ms(500);
       */
       //Si el archivo fuente se localizo correctamente

       //---------------  Imagenes desde la SD  ---------------

       if(estado_File == 1){
           display_width = Screen1.width;
           display_height = Screen1.Height;

           //TFT_Fill_Screen(CL_WHITE);
           //TFT_Write_Text("IMAGEN 1", 5, 20);
           //Delay_ms(500);
           DrawScreen(&Screen1);
           Delay_ms(1000);

           //TFT_Fill_Screen(CL_WHITE);
           //TFT_Write_Text("IMAGEN 2", 5, 20);
           //Delay_ms(500);
           DrawScreen(&Screen2);
           Delay_ms(1000);

           //TFT_Fill_Screen(CL_WHITE);
           //TFT_Write_Text("IMAGEN 3", 5, 20);
           //Delay_ms(500);
           DrawScreen(&Screen3);
           Delay_ms(1000);

           //TFT_Fill_Screen(CL_WHITE);
           //TFT_Write_Text("IMAGEN 4", 5, 20);
           //Delay_ms(500);
           DrawScreen(&Screen4);
           Delay_ms(1000);
       }
  }

//INIT FUNCTIONS
  static void InitializeObjects() {
  Screen1.Color                     = CL_WHITE;
  Screen1.Width                     = 320;
  Screen1.Height                    = 240;
  Screen1.ImagesCount               = 1;
  Screen1.Images                    = Screen1_Images;
  Screen1.ObjectsCount              = 1;

  Screen2.Color                     = CL_WHITE;
  Screen2.Width                     = 320;
  Screen2.Height                    = 240;
  Screen2.ImagesCount               = 1;
  Screen2.Images                    = Screen2_Images;
  Screen2.ObjectsCount              = 1;

  Screen3.Color                     = CL_WHITE;
  Screen3.Width                     = 320;
  Screen3.Height                    = 240;
  Screen3.ImagesCount               = 1;
  Screen3.Images                    = Screen3_Images;
  Screen3.ObjectsCount              = 1;

  Screen4.Color                     = CL_WHITE;
  Screen4.Width                     = 320;
  Screen4.Height                    = 240;
  Screen4.ImagesCount               = 1;
  Screen4.Images                    = Screen4_Images;
  Screen4.ObjectsCount              = 1;

  Screen5.Color                     = CL_WHITE;
  Screen5.Width                     = 320;
  Screen5.Height                    = 240;
  Screen5.ImagesCount               = 1;
  Screen5.Images                    = Screen5_Images;
  Screen5.ObjectsCount              = 1;


  Image1.OwnerScreen     = &Screen1;
  Image1.Order           = 0;
  Image1.Left            = 0;
  Image1.Top             = 0;
  Image1.Width           = 320;
  Image1.Height          = 240;
  Image1.Picture_Type    = 0;
  Image1.Picture_Ratio   = 1;
  Image1.Picture_Name    = FATPANDA_bmp;
  Image1.Visible         = 1;
  Image1.Active          = 1;
  Image1.OnUpPtr         = 0;
  Image1.OnDownPtr       = 0;
  Image1.OnClickPtr      = 0;
  Image1.OnPressPtr      = 0;

  Image2.OwnerScreen     = &Screen2;
  Image2.Order           = 0;
  Image2.Left            = 100;
  Image2.Top             = 40;
  Image2.Width           = 120;
  Image2.Height          = 160;
  Image2.Picture_Type    = 0;
  Image2.Picture_Ratio   = 1;
  Image2.Picture_Name    = F1_bmp;
  Image2.Visible         = 1;
  Image2.Active          = 1;
  Image2.OnUpPtr         = 0;
  Image2.OnDownPtr       = 0;
  Image2.OnClickPtr      = 0;
  Image2.OnPressPtr      = 0;

  Image3.OwnerScreen     = &Screen3;
  Image3.Order           = 0;
  Image3.Left            = 100;
  Image3.Top             = 40;
  Image3.Width           = 120;
  Image3.Height          = 160;
  Image3.Picture_Type    = 0;
  Image3.Picture_Ratio   = 1;
  Image3.Picture_Name    = F2_bmp;
  Image3.Visible         = 1;
  Image3.Active          = 1;
  Image3.OnUpPtr         = 0;
  Image3.OnDownPtr       = 0;
  Image3.OnClickPtr      = 0;
  Image3.OnPressPtr      = 0;

  Image4.OwnerScreen     = &Screen4;
  Image4.Order           = 0;
  Image4.Left            = 100;
  Image4.Top             = 40;
  Image4.Width           = 120;
  Image4.Height          = 160;
  Image4.Picture_Type    = 0;
  Image4.Picture_Ratio   = 1;
  Image4.Picture_Name    = F4_bmp;
  Image4.Visible         = 1;
  Image4.Active          = 1;
  Image4.OnUpPtr         = 0;
  Image4.OnDownPtr       = 0;
  Image4.OnClickPtr      = 0;
  Image4.OnPressPtr      = 0;

  Image5.OwnerScreen     = &Screen5;
  Image5.Order           = 0;
  Image5.Left            = 100;
  Image5.Top             = 40;
  Image5.Width           = 120;
  Image5.Height          = 160;
  Image5.Picture_Type    = 0;
  Image5.Picture_Ratio   = 1;
  Image5.Picture_Name    = F4_bmp;
  Image5.Visible         = 1;
  Image5.Active          = 1;
  Image5.OnUpPtr         = 0;
  Image5.OnDownPtr       = 0;
  Image5.OnClickPtr      = 0;
  Image5.OnPressPtr      = 0;
  }

  void InitPantalla(){
       GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_9| _GPIO_PINMASK_10|
       _GPIO_PINMASK_8,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);

       GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 |_GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 |
       _GPIO_PINMASK_10 ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);    //CAMBIAR 3 POR 6

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

  //Funciones *_Custom()  para InitPantalla()
    void TFT_Set_Index_Custom(unsigned short index) {
       unsigned int temp;
       TFT_RS = 0;
       //Write to port
       //temp = TFT_DataPort;
       //temp &= 0xFF00;
       //TFT_DataPort = index | temp;
       temp = index;
       TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
       TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
       TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
       TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
       TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
       TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
       TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
       TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
       // Strobe
       TFT_WR = 0;
       asm nop;
       TFT_WR = 1;
    }
    void TFT_Write_Command_Custom(unsigned short cmd) {
         unsigned int temp;
         TFT_RS = 1;
         //Write to port
         //temp = TFT_DataPort;
         //temp &= 0xFF00;
         //TFT_DataPort = cmd | temp;
         temp = cmd;
         TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
         TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
         TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
         TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
         TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
         TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
         TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
         TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
         // Strobe
         TFT_WR = 0;
         asm nop;
         TFT_WR = 1;
    }
    void TFT_Write_Data_Custom(unsigned int _data) {
         unsigned int temp;
         TFT_RS = 1;
         //Write to port
         //temp = TFT_DataPort;
         //temp &= 0xFF00;
         //TFT_DataPort = Hi(_data) | temp;
         temp = Hi(_data);
         TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
         TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
         TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
         TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
         TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
         TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
         TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
         TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
         // Strobe
         TFT_WR = 0;
         asm nop;
         TFT_WR = 1;
         //Write to port
         //temp = TFT_DataPort;
         //temp &= 0xFF00;
         //TFT_DataPort = Lo(_data) | temp;
         temp = Lo(_data);
         TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
         TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
         TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
         TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
         TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
         TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
         TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
         TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
         // Strobe
         TFT_WR = 0;
         asm nop;
         TFT_WR = 1;
    }

  void Init_MCU() {
    GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_3);  //CAMBIAR E9 A D3
    //TFT_BLED = 1;
    TFT_Set_Default_Mode();
    //TP_TFT_Set_Default_Mode();
  }

  void Init_Ext_Mem() {
    // Initialize SPI
    SPI3_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
                                                   _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                                                   _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                                                   &_GPIO_MODULE_SPI3_PC10_11_12);
    //mmc_error = Mmc_Init();  //Inicializar a MMC Card
    Delay_ms(10);


    //----------------- init the FAT library -----------------
      /*
        Mmc_Fat_Init()

        Description

        Initializes MMC/SD card, reads MMC/SD FAT16 boot sector and extracts necessary data needed by the library.

        RETURN:
        0 - if MMC/SD card was detected and successfully initialized
        1 - if FAT16 boot sector was not found
        255 - if MMC/SD card was not detected

      */


    estado_SD = Mmc_Fat_Init();

    if (!estado_SD) {

      SPI3_CR1 = 0;    //  ??????

      // reinitialize spi at higher speed
      SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
                                          _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                                                _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                                                &_GPIO_MODULE_SPI3_PC10_11_12);

      //----------------- Open resource file for read -----------------
      /*
      Mmc_Fat_Assign()

      Description

      Assigns file for file operations (read, write, delete...). All subsequent file operations will be applied on an assigned file.

      RETURN:
          2 - if there are no more free file handlers, currently opened file is closed in order to free space.
          1 - if file already exists or file does not exist but a new file is created.
          0 - if file does not exist and no new file is created.

      */

      estado_File = Mmc_Fat_Assign("entregaa.RES", 0);
      if(estado_File == 1) Mmc_Fat_Reset(&res_file_size);
    }
  }

 //TFT_GET_DATA()
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

//DRAW FUNCTIONS

  #define GetImage(index) CurrentScreen->Images[index]
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
        local_image = GetImage(image_idx);
        if (order == local_image->Order) {
          image_idx++;
          order++;
          DrawImage(local_image);
        }
      }

    }
  }

  //MAIN()
  void main()
  {
       GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_0);                                           //   ??????
       GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, _GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO);      //   ??????

       //Inicializamos los elementos
       InitPantalla();
       InitializeObjects();
       Init_MCU();
       Init_Ext_Mem();

       //Cargamos los datos desde la SD
       TFT_Set_Ext_Buffer(TFT_Get_Data);

       //Mensajes de estado (SD, FILE)
       mensajesEst();

       //Bucle principal
       while(1){
         Proceso();
       }
  }