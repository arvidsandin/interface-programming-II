import java.util.*;

//Enum for where in the program you are
enum NavType{
  INGAME,
  INSETTINGS,
  INMAINMENU,
}

NavType navigation = NavType.INMAINMENU;

/*
 * Sets up window and other game object's setups
 */
void setup(){
 size(1200, 600); 
 background(137, 209, 254);
 setupMenu(); 
}

/*
 * Main loop of what to draw on screen
 */
void draw(){
  if (navigation == NavType.INMAINMENU){
    drawMainMenu();
  }
  else if (navigation == NavType.INSETTINGS){
    
  }
  else if (navigation == NavType.INGAME){
    
  }
}
