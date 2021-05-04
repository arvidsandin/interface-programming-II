/*
 * A class for everything inside the game
 */
class Game{
  Player player = new Player();
  Map map;
  /*
   * Constructor to set all attributes of Game class
   *
   * @param map  The map to use
   * @return A new Game object
   */
  Game(Map m){
    map = m;
  }
  
  /***************************************************************************************************************************************************
   *  MODEL
   ***************************************************************************************************************************************************
   */
  
  /*
   * Updates up the game and everything inside it by one step
   *
   * @return None
   */
  void timeStep(){
    player.timeStep(this.map);
    
    if(!player.isAlive()){
      this.gameOver();
      this.resetGame();
    }
  }
  
  /*
   * Exits the game and resets it. Passes control back to main menu.
   *
   * @return None
   */
  void gameOver(){
    navigation = NavType.INMAINMENU;
  }
  
  void resetGame(){
    this.player = new Player(600, 300);
    this.map = new Map(0.15, 0.1/*TODO:change gravity and friciton constants*/, getLevel1());
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
      map.drawMe();
      player.drawMe();
    }

  /*
   * Make Player object 
   *
   * @return None
   */
  void space(){
    player.jump();
  }
  /*
   * 
   *
   * @return None
   */
  void up(){
  }
  /*
   * 
   *
   * @return None
   */
  void left(){
    player.goLeft();
  }
  /*
   * 
   *
   * @return None
   */
  void down(){
  }
  /*
   * 
   *
   * @return None
   */
  void right(){
    player.goRight();
  }

  /*
   * 
   *
   * @return None
   */
  void releaseUp(){
  }
  /*
   * 
   *
   * @return None
   */
  void releaseLeft(){
    player.stopLeft();
  }
  /*
   * 
   *
   * @return None
   */
  void releaseDown(){
  }
  /*
   * 
   *
   * @return None
   */
  void releaseRight(){
    player.stopRight();
  }
  /*
   * 
   *
   * @return None
   */
  void releaseSpace(){
  }

}
