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

Game game;
MainMenu mainMenu;
GameMenu gameMenu;

String[] languages = new String[]{"EN", "SWE"};

/*
 * Sets up window and other game object's setups
 */
void setup(){
 size(1200, 600);
 background(137, 209, 254);
 game = new Game(new Map(0.1, 0.01/*TODO:change gravity and friciton constants*/));
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
    game.drawGame();
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
