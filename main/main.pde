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


/*
 * Sets up window and other game object's setups
 */
void setup(){
  
 //P2D uses OpenGL code to run faster on computer graphics card
 size(1200, 600, P2D); 
 background(137, 209, 254);
 mainMenu = new MainMenu();
 gameMenu = new GameMenu();
 
 surface.setResizable(true);
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
    
  }
  else if (navigation == NavType.INGAMEMENU){
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
