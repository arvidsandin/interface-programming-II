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

GameObject object;

String[] languages = new String[]{"ENG", "SWE"};
int ENG = 0;
int SWE = 1;
int currentLanguage = ENG;

/*
 * Sets up window and other game object's setups
 */
void setup(){

 //P2D uses OpenGL code to run faster on computer graphics card
 size(500, 200, P2D);
 background(137, 209, 254);
 
 game = new Game(new Map(0.15, 0.15/*TODO:change gravity and friciton constants*/, getLevel1()));
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

    boolean gameOver = game.timeStep();
    if(!gameOver){
      game.drawGame();
    }
  }
  else if (navigation == NavType.INGAMEMENU){
    gameMenu.moveMenu();
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

/*
 * Rescales a value by the current width of the window
 *
 * @return The rescaled value
 */
float rescaleByWidth(float value){
  return value * width/1200.0;
}
/*
 * Rescales a value by the current height of the window
 *
 * @return The rescaled value
 */
float rescaleByHeight(float value){
  return value * height/600.0;
}

/*
 * Resizes all menu interfaces to the current sketch width and height
 *
 * @return None
 */
void rescaleMenus(){
  /*
   gameMenu.resize();
   mainMenu.resize();
   tutorialMenu.resize();
   settingsmenu.resize();
  */
}

void keyPressed(){
  if (navigation == NavType.INGAME){
    if (key == 'w' || keyCode == UP){
      game.up();
    }
    else if (key == 'a' || keyCode == LEFT){
      game.left();
    }
    else if (key == 's' || keyCode == DOWN){
      game.down();
    }
    else if (key == 'd' || keyCode == RIGHT){
      game.right();
    }
    else if (key == ' '){
      game.space();
    }
  }
}

void keyReleased(){
  if (navigation == NavType.INGAME){
    if (key == 'w' || keyCode == UP){
      game.releaseUp();
    }
    else if (key == 'a' || keyCode == LEFT){
      game.releaseLeft();
    }
    else if (key == 's' || keyCode == DOWN){
      game.releaseDown();
    }
    else if (key == 'd' || keyCode == RIGHT){
      game.releaseRight();
    }
    else if (key == ' '){
      game.releaseSpace();
    }
  }
  else if (navigation == NavType.INGAMEMENU){
   gameMenu.gameMenuClick();
  }
}
