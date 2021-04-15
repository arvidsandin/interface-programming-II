import java.util.*;
void setup(){
 size(1200, 600); 
 background(137, 209, 254);
 setupMenu(); 
}
//Enum for where in the program you are
enum NavType{
  INGAME,
  INSETTINGS,
  INMAINMENU,
}

NavType navigation = NavType.INMAINMENU;


/*
Main loop of what to draw on screen
*/
void draw(){
  if (navigation == NavType.INMAINMENU){
    drawMenu();
  }
  else if (navigation == NavType.INSETTINGS){
    
  }
  else if (navigation == NavType.INGAME){
    
  }
}

void mouseClicked(){
  if (navigation == NavType.INMAINMENU){
    menuClick(mouseX, mouseY);
  }
  else if (navigation == NavType.INSETTINGS){
    
  }
  else if (navigation == NavType.INGAME){
    
  }
}
