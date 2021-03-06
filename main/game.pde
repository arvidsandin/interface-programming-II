/*
 * A class for everything inside the game
 */
class Game{
  Level level = new Level();   // Future implementation: make Game hold all possible levels from start
  Player player = new Player();
  Map map;
  String homeButtonPath  = "data/menu_images/home_button.png";
  HomeButton homeButton = new HomeButton(homeButtonPath);
  /*
   * Constructor to set all attributes of Game class with a given game map
   *
   * @param map  The map to use
   * @return A new Game object
   */
  Game(Map m){
    map = m;
  }

  /*
   * Constructor to set all attributes of Game class
   *
   * @param l the level to play
   * @return A new Game object
   */
  Game(){
    map = new Map(0.2, 0.2/*TODO:change gravity and friciton constants*/, this.level.getLevel());
  }

  /***************************************************************************************************************************************************
   *  MODEL
   ***************************************************************************************************************************************************
   */

  /*
   * Updates the game and everything inside it by one frame
   *
   * @return boolean indicating whether game over has been reached or not
   */
  boolean timeStep(){
    player.moveMe(this.map);
    map.moveMe(player);

    if(!player.isAlive()){
      this.gameOver();
      this.resetGame();
      return true;
    }
    return false;
  }

  /*
   * Exits the game and passes control back to main menu.
   *
   * @return None
   */
  void gameOver(){
    navigation = NavType.INMAINMENU;
  }

  /*
   * Resets the game level.
   *
   * @return None
   */
  void resetGame(){
    this.player = new Player(600, 300);
    // this.level = new Level();
    this.map = new Map(0.2, 0.2/*TODO:change gravity and friction constants*/, this.level.getLevel());
  }
  
  /*
   * Will load a game level into the game. Currently there's only one
   *
   * @return None
   */
  void loadLevel(){
    // Load tutorial level
    this.level.level1();
    
    // Update map to use the level
    map.changeLevel(this.level.getLevel());
    
    // Update text size
    this.resizeOverlayElements();
    
    game.resetGame();
  }
  
  /*
   * Will load the game tutorial
   *
   * @return None
   */
  void loadTutorial(){
    // Load tutorial level
    this.level.tutorialLevel();
    // Update map to use the level
    map.changeLevel(this.level.getLevel());
    
    // Update text size
    this.resizeOverlayElements();
    // Resets game to put player at start of tutorial
    game.resetGame();
  }
  
    
    
  /*
   * Determines what event should happen during a mouse click during the game
   *
   * @return None
   */
  void click(){
    if(homeButton.isInside()){
      navigation = NavType.INGAMEMENU;
    }
  }
  
  /*
   * Resizes button and text elements of the game level to current window dimensions
   *
   * @return None
   */
  void resizeOverlayElements(){
    map.resizeGameText();
    homeButton.updateBtnDimensions();
  }
  
  
  /*
   * Any currently active player control is stopped
   *
   * @return None
   */
  void resetControls(){
    player.stopLeft();
    player.stopRight();
  }
  
 
  
  /*
   * Makes the player jump
   *
   * @return None
   */
  void space(){
    player.spaceBar();
  }
  /*
   * Makes the player jump as well.  //Consider alternative control
   * @return None
   */
  void up(){
    player.jump();
  }
  /*
   * Makes the player go left
   *
   * @return None
   */
  void left(){
    player.goLeft();
  }
  /*
   * Makes the player go down - TO BE DETERMINED
   *
   * @return None
   */
  void down(){
    // TODO: IMPLEMENT CROUCH ABILITY WHEN RUNNING/STANDING IN PLAYER
  }
  /*
   * Makes the player go right
   *
   * @return None
   */
  void right(){
    player.goRight();
  }

  /*
   * Makes the player stop going up - TO BE DETERMINED
   *
   * @return None
   */
  void releaseUp(){
  }
  /*
   * Makes the player stop going left
   *
   * @return None
   */
  void releaseLeft(){
    player.stopLeft();
  }
  /*
   * Makes the player stop going down - TO BE DETERMINED
   *
   * @return None
   */
  void releaseDown(){
  }
  /*
   * Makes the player stop going right
   *
   * @return None
   */
  void releaseRight(){
    player.stopRight();
  }
  /*
   * TO BE DETERMINED
   *
   * @return None
   */
  void releaseSpace(){
  }

  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */

  /*
   * Draws up the game and everything inside it
   *
   * @return None
   */
    void drawGame(){
      // Must use pop instead of popStyle, as scale() is a transformation
      push();
      
      if(useSmallLayout){
        scale((float)width/1000, (float)height/600);
      }
      else{
        scale((float)width/1280, (float)height/720);
      }

      map.drawMe();
      player.drawMe();
      pop();

      //Home button must rescale itself
      // Needs to be outside rescale for mouseClick and drawing to correspond
      homeButton.drawMe();
    }

}
