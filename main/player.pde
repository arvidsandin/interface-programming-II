/*
 * A class for the playable character
 */
class Player {
  float xpos = width/2;
  float ypos = height/2;
  float playerHeight = 50;
  float playerWidth = 30;
  float playerAcceleration = 0.2;
  float xSpeed = 0;
  float ySpeed = 0;
  float maxHorizontalSpeed = 5;
  boolean movesLeft = false;
  boolean movesRight = false;
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
  void updatePosition(Map m){
    //Accelerations
    ySpeed += m.gravity;
    if(movesLeft){
      xSpeed -= playerAcceleration;
    }
    if (movesRight){
      xSpeed += playerAcceleration;
    }

    //stop at max speed
    if (xSpeed > maxHorizontalSpeed)
    {
      xSpeed = maxHorizontalSpeed;
    }
    if (xSpeed < -maxHorizontalSpeed)
    {
      xSpeed = -maxHorizontalSpeed;
    }

    ySpeed -= m.friction*ySpeed;
    xSpeed -= m.friction*xSpeed;

    //Stop if acceleration is too low;
    if (xSpeed < playerAcceleration/2 && xSpeed > -playerAcceleration/2){
      xSpeed = 0;
    }

    //TODO: check for collision

    //movements
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
    movesLeft = true;
  }
  
  /*
   * 
   * makes the player go right
   * @return None
   */
  void goRight(){
    movesRight = true;
  }
  
  /*
   * 
   * makes the player stop moving left
   * @return None
   */
  void stop(){
  void stopLeft(){
    movesLeft = false;
  }

  /*
   * makes the player stop moving right
   *
   * @return None
   */
  void stopRight(){
    movesRight = false;
  }
}
