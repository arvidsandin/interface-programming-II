/*
 * A class for everything inside the game
 */
class Game{
  Level level = new Level();   // Future implementation: make Game hold all possible levels from start
  Player player = new Player();
  Map map;
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
   *
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
    map.moveMe();
    player.timeStep(this.map);

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
    this.map = new Map(0.2, 0.2/*TODO:change gravity and friction constants*/, this.level.getLevel());
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
      push();
      if(width <= 600){
        scale((float)width/1000, (float)height/400);
      }
      else{
        scale((float)width/1200, (float)height/600);
      }

      map.drawMe();
      player.drawMe();

      pop();
    }


  /*
   * Makes the player jump
   *
   * @return None
   */
  void space(){
    player.jump();
  }
  /*
   * Makes the player go up - TO BE DETERMINED
   *
   * @return None
   */
  void up(){
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

}
