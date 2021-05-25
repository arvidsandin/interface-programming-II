import java.util.*;
import processing.sound.*;
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
SettingsMenu settingsMenu;
GameMenu gameMenu;
ParallaxBg parallaxBg;
MusicPlayer musicPlayer;

String[] languages = new String[]{"ENG", "SWE"};
int ENG = 0;
int SWE = 1;

int currentLanguage = ENG;
float currentWidth = 0;
float currentHeight = 0;
int selectedSong = 0;

Sound globalSound = new Sound(this);

boolean inGame = false;
boolean muteGame = false;
boolean useSmallLayout = false;

/*
 * Sets up window and other game object's setups
 * @return None
 */
void setup(){
 //P2D uses OpenGL code to run faster on computer graphics card
 size(1280, 720, P2D);
 surface.setResizable(true);

 //background(137, 209, 254);
 surface.setResizable(true);

 game = new Game();

 mainMenu = new MainMenu();
 settingsMenu = new SettingsMenu();
 gameMenu = new GameMenu();
 parallaxBg = new ParallaxBg();
 musicPlayer = new MusicPlayer(this);
 
 this.loadSettings();
 globalSound.volume(0.15);

 if (muteGame){
   thread("loadMusicFiles");
 }
 else{
   this.loadMusicFiles();
 }
}

/*
 * load music files and starts playing the music if unmuted (and is quite slow)
 * @return None
 */
public void loadMusicFiles(){
  musicPlayer.loadFiles();
  if(!muteGame){
    musicPlayer.loopTrack(selectedSong);
  }
}

/*
 * load previous settings from file
 * @return None
 */
void loadSettings(){
  String[] previousSettings = loadStrings("data/settings/settings.txt");
  muteGame = Boolean.valueOf(previousSettings[0]);
  settingsMenu.resolutionIndex = Integer.parseInt(previousSettings[1]);

  surface.setSize(settingsMenu.resolutions[settingsMenu.resolutionIndex][0], settingsMenu.resolutions[settingsMenu.resolutionIndex][1]);
  if (width <= 600) {
    useSmallLayout = true;
  }
  else{
    useSmallLayout = false;
  }
  resizeProgram();
}

/*
 * Main loop of what to draw on screen
 * @return None
 */
void draw(){

  if (navigation == NavType.INMAINMENU){
    mainMenu.moveMenu();
    mainMenu.drawMenu();
    inGame = false;
  }
  else if (navigation == NavType.INSETTINGS){
    settingsMenu.moveMenu();
    settingsMenu.drawMenu();
  }
  else if (navigation == NavType.INGAME){
    inGame = true;
    boolean gameOver = game.timeStep();
    if(!gameOver){
      game.drawGame();
    }
  }
  else if (navigation == NavType.INGAMEMENU){
    gameMenu.moveMenu();
    gameMenu.drawMenu();
  }
  
  // Check whether it's possible the interface is being accessed during active game session
  if(navigation != NavType.INGAMEMENU && navigation != NavType.INGAME && navigation != NavType.INSETTINGS){
    inGame = false;
  }
}

/*
 * Draws the latest game frame without updating it
 *
 * @return None
 */
void returnToGame(){
  game.drawGame();
}

/*
 * Resizes all interfaces to the current sketch width and height.
 *
 * @return None
 */
void resizeProgram(){
  mainMenu.resize();
  gameMenu.resize();
  settingsMenu.resize();
  game.resizeOverlayElements();
   /*
   gameStateMenu.resize();
  */
}

/*
 * Rescales a value by the current width of the window
 *
 * @return The rescaled value
 */
float rescaleByWidth(float value){
  return value * width/1280.0;
}
/*
 * Rescales a value by the current height of the window
 *
 * @return The rescaled value
 */
float rescaleByHeight(float value){
  return value * height/720.0;
}


/*
 * Updates all interfaces' languages the current selected language
 *
 * @return None
 */
void updateLanguage(){
  mainMenu.updateMenuLanguage();
  gameMenu.updateMenuLanguage();
  settingsMenu.updateMenuLanguage();
  /*
   gameStateMenu.updateMenuLanguage();
  */
}


/*
 * Handles mouse click events in the window
 * @return None
 */
void mouseClicked(){
  if (navigation == NavType.INMAINMENU){
    mainMenu.menuClick();
  }
  else if (navigation == NavType.INSETTINGS){
    settingsMenu.menuClick();
  }
  else if (navigation == NavType.INGAMEMENU){
    gameMenu.menuClick();
  }
  else if(navigation == NavType.INGAME){
    game.click();
  }
}


/*
 * Handles key presses at different parts of the program
 *
 * @return None
 */
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
    else if (key == ESC){
      key=0;
      navigation = NavType.INGAMEMENU;
      game.resetControls();
    }
  }

  if(navigation == NavType.INGAMEMENU){
    if (key == ESC){
      key=0;
      navigation = NavType.INGAME;
    }
  }
  
  if(navigation == NavType.INSETTINGS){
    if (key == ESC){
      key=0;
      navigation = NavType.INGAMEMENU;
      returnToGame();
    }
  }
}

/*
 * Handles key releases at different parts of the program
 *
 * @return None
 */
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
}
