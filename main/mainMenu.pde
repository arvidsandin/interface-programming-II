
//Enum for each main menu button
enum mainMenuButtonType{
  START,
  SETTINGS,
  TUTORIAL,
  QUIT,
}

color btnColor = color(170,183,249);
color btnBorder = color(110,123,189);

Button[] mainMenuButtons = new Button[4];

int  windowWidth = 1200;
int  windowHeight = 600;
int topOffset = 180;

String gameName = "Parkour Scroll";
PFont gameFont;
PFont languageFont;

/*
 * Sets up fonts and menu buttons to be included in the main menu
 *
 * @return None
*/
// TODO: CHECK IF MENU SETUP CAN BE CALLED FROM SEPARATE MODULE
void setupMenu(){ 
 textAlign(CENTER);
 
 gameFont = createFont("Arial Bold", 40, true);
 languageFont = createFont("Arial", 17, true);
 
 createMainMenuButtons();
 
}

/*
 * Draws up all objects that are part of the main menu
 *
 * @return None
*/
void drawMainMenu(){
  //Draw main menu buttons
  for(int i = 0; i < mainMenuButtons.length; ++i){
    mainMenuButtons[i].drawMe();
  }
  
  //Draw menu text
  drawGameTitle();
  drawLanguageOptions();
}

/*
 * Creates all buttons that are included in the main menu.
 *
 * @return None
*/
void createMainMenuButtons(){
  String[] btnText = new String[]{"START", "SETTINGS", "TUTORIAL", "QUIT"}; //TODO: include multilanguage option structure
  
  for(int i = 0; i < 4; i++){
    int widthFrac = 15;
    int heightFrac = 8;
    
    float xposBtn = windowWidth / widthFrac;
    float yposBtn = topOffset + (windowHeight / heightFrac) * i;
    
    mainMenuButtons[i] = new Button(i, btnText[i], xposBtn, yposBtn, btnColor, btnBorder);
  }

}

/*
 * Draws up game title text 
 * 
 * @return None
*/
void drawGameTitle(){
  pushStyle();
  textFont(gameFont);
  fill(255);
  text(gameName, (windowWidth/5) * 4, (windowHeight/5) * 2.25);
  popStyle();
}

/*
 * Draws up language options text
 * 
 * @return None
*/
void drawLanguageOptions(){
  pushStyle();
  textFont(languageFont);
  fill(255);
  text("LANGUAGE: ", (windowWidth/15) * 11, windowHeight/15);
  popStyle();
}


/*
 * Click while in the menu
 * 
 * @param x  x-value of the point to click at
 * @param y  y-value of the point to click at
 * @return None
*/
void mainMenuClick(int x, int y){
  for (Button button:mainMenuButtons){
    if (button.isInside(x, y)){
      //button.doSomething
      break;
    }
  }
}
