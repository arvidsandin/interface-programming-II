import java.util.*;

//Enum for where in the program you are
enum NavType{
  INGAME,
  INGAMEMENU,
  INSETTINGS,
  INTUTORIAL,
  INMAINMENU,
}
NavType navigation = NavType.INMAINMENU;

MainMenu mainMenu;
GameMenu gameMenu;

String[] languages = new String[]{"EN", "SWE"};

/*
 * Sets up window and other game object's setups
 */
void setup(){
 size(1200, 600); 
 background(137, 209, 254);
 mainMenu = new MainMenu(); 
 gameMenu = new GameMenu();
}

/*
 * Main loop of what to draw on screen
 */
void draw(){
  
  if (navigation == NavType.INMAINMENU){
    mainMenu.moveMenu();
    mainMenu.drawMenu();
  }
  else if (navigation == NavType.INSETTINGS){
    
  }
  else if (navigation == NavType.INGAME){
    gameMenu.drawMenu();
  }
}

/*
 * Handles mouse click events in the window
 */
void mouseClicked(){
  if (navigation == NavType.INMAINMENU){
    mainMenu.mainMenuClick();
  }
  else if (navigation == NavType.INSETTINGS){
    
  }
  else if (navigation == NavType.INGAME){
    
  }
}
