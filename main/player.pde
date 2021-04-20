/*
 * A class for the playable character
 */
class Player {
  float xpos = width/2;
  float ypos = height/2;
  float playerHeight = 50;
  float playerWidth = 30;
  float xSpeed = 0;
  float ySpeed = 0;
  /*
   * Constructor to set all attributes of Player class
   *
   * @return A new Player object
   */
  Player(){
  }
  
  /*
   * Draws up the player
   * 
   * @return None
   */
  void drawMe(){
    fill(255, 60, 60);
    rect(this.xpos, this.ypos, this.playerWidth, this.playerHeight);
  }
  
  /*
   * updates the player's position based on current speed
   * 
   * @return None
   */
  void updatePosition(){
    xpos = xpos + xSpeed;
    ypos = ypos + ySpeed;
  }
  
  /*
   * makes the player jump
   * 
   * @return None
   */
  void jump(){
    ySpeed = -5;
  }
  
  /*
   * makes the player go left
   * 
   * @return None
   */
  void goLeft(){
    xSpeed = -3;
  }
  
  /*
   * makes the player go left
   * 
   * @return None
   */
  void goRight(){
    xSpeed = 3;
  }
  
  /*
   * makes the player stop moving sideways
   * 
   * @return None
   */
  void stop(){
    xSpeed = 0;
  }  
}
