import java.util.*;

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
LinkedList<Button> gameButtons = new LinkedList();

int  windowWidth = 1200;
int  windowHeight = 600;
int topOffset = 150;

PFont f;
/*

*/
void setup(){
 size(1200, 600); 
 background(137, 209, 254);
 
 rectMode(CENTER);
 textAlign(CENTER);
 
 createMainMenuButtons();
}

/*

*/
void draw(){
  
  for(int i = 0; i < mainMenuButtons.length; ++i){
    mainMenuButtons[i].drawMe();
    mainMenuButtons[i].drawBtnText(null, -1);
  }
}


void createMainMenuButtons(){
  String[] btnText = new String[]{"START", "SETTINGS", "TUTORIAL", "QUIT"};
  
  for(int i = 0; i < 4; i++){
    float xposBtn = windowWidth/15;
    float yposBtn = topOffset + (windowHeight/8) * i;
    
    mainMenuButtons[i] = new Button(i, btnText[i], xposBtn, yposBtn, btnColor, btnBorder);
  }

}
