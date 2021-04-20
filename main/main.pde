import java.util.*;

//Enum for where in the program you are
enum NavType{
  INGAME,
  INSETTINGS,
  INMAINMENU,
}

NavType navigation = NavType.INMAINMENU;
Game game;
/*
 * Sets up window and other game object's setups
 */
void setup(){
 size(1200, 600); 
 background(137, 209, 254);
 setupMenu();
 game = new Game(new Map());
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
    game.drawGame();
  }
}

void mouseClicked(){
  if (navigation == NavType.INMAINMENU){
    mainMenuClick(mouseX, mouseY);
  }
  else if (navigation == NavType.INSETTINGS){
    
  }
  else if (navigation == NavType.INGAME){
    
  }
}

void keyPressed(){
  if (navigation == NavType.INGAME){
    if (key == 'w'){
      game.up();
    }
    else if (key == 'a'){
      game.left();
    }
    else if (key == 's'){
      game.down();
    }
    else if (key == 'd'){
      game.right();
    }
  }
}

void keyReleased(){
  if (navigation == NavType.INGAME){
    if (key == 'w'){
      game.releaseUp();
    }
    else if (key == 'a'){
      game.releaseLeft();
    }
    else if (key == 's'){
      game.releaseDown();
    }
    else if (key == 'd'){
      game.releaseRight();
    }
  }
}
