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
  
  /*
   * Draws up the game and everything inside it
   * 
   * @return None
   */
    void drawGame(){
      map.drawMe();
      player.updatePosition();
      player.drawMe();
    }
  
  void up(){
    player.jump();
  }
  void left(){
    player.goLeft();
  }
  void down(){
  }
  void right(){
    player.goRight();
  }
  
  
  void releaseUp(){
  }
  void releaseLeft(){
    player.stop();
  }
  void releaseDown(){
  }
  void releaseRight(){
    player.stop();
  }
  
}
