typedef struct Screen TScreen;

typedef struct  Image {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  const char    *Picture_Name;
  char          Visible;
  char          Active;
  char          Picture_Type;
  char          Picture_Ratio;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TImage;

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned int           ObjectsCount;
  unsigned int           ImagesCount;
  TImage                 * const code *Images;
};

extern   TScreen                Screen1;
extern   TImage               Image1;
extern   TImage                 * const code Screen1_Images[1];

extern   TScreen                Screen2;
extern   TImage               Image2;
extern   TImage                 * const code Screen2_Images[1];

extern   TScreen                Screen3;
extern   TImage               Image3;
extern   TImage                 * const code Screen3_Images[1];

extern   TScreen                Screen4;
extern   TImage               Image4;
extern   TImage                 * const code Screen4_Images[1];

extern   TScreen                Screen5;
extern   TImage               Image5;
extern   TImage                 * const code Screen5_Images[1];


/////////////////////////
// Events Code Declarations
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
extern char Image1_Caption[];
extern char Image2_Caption[];
extern char Image3_Caption[];
extern char Image4_Caption[];
extern char Image5_Caption[];
/////////////////////////////////

void DrawScreen(TScreen *aScreen);
void DrawImage(TImage *AImage);
void Check_TP();
void Start_TP();
void Proceso();
