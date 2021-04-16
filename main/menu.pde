
//Enum for each main menu button
enum mainMenuButtonType{
  START,
  SETTINGS,
  TUTORIAL,
  QUIT,
}
//Enum for each tutorial menu button
enum tutorialMenuButtonType{
  MOVE_TUTORIAL,
  JUMP_TUTORIAL,
  GRAB_TUTORIAL,
  EXIT_BUTTON, 
}
//Enum for each game menu button
enum gameMenuButtonType{
  GAME_RETURN,
  GAME_SETTINGS,
  GAME_WORLD,
  EXIT_BUTTON,
}

color btnColor = color(170,183,249);
color btnBorder = color(110,123,189);

Button[] mainMenuButtons = new Button[4];
Button[] tutorialMenuButtons = new Button[4];
Button[] gameMenuButtons = new Button[4];

int  windowWidth = 1200;
int  windowHeight = 600;
int topOffset = 180;

boolean mainMenuDraw = true;
boolean tutorialMenuDraw = false;
boolean gameMenuDraw = false;



String gameName = "Parkour Scroll";
PFont gameFont;
PFont languageFont;
/*

*/
// TODO: CHECK IF MENU SETUP CAN BE CALLED FROM SEPARATE MODULE
void setupMenu(){ 
 rectMode(CENTER);
 textAlign(CENTER);
 
 gameFont = createFont("Arial Bold", 40, true);
 languageFont = createFont("Arial", 17, true);
 
 createMainMenuButtons();
 
}

/*

*/
void drawMenu(){
  //Draw main menu buttons
  for(int i = 0; i < mainMenuButtons.length; ++i){
    mainMenuButtons[i].drawMe();
  }
  
  drawGameTitle();
  drawLanguageOptions();
}

/*

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

void drawGameTitle(){
  pushStyle();
  textFont(gameFont);
  fill(255);
  text(gameName, (windowWidth/5) * 4, (windowHeight/5) * 2.25);
  popStyle();
}

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
