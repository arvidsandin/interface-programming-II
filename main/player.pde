/*
 * A class for the playable character
 */
class Player {
  float xPos = width/2;
  float yPos = height/2;
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
    pushStyle();
    rectMode(CENTER);
    rect(this.xPos, this.yPos, this.playerWidth, this.playerHeight);
    popStyle();
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

    if (!movesLeft && !movesRight) {
      xSpeed -= m.friction*xSpeed;
    }

    //Stop if acceleration is too low;
    if (xSpeed < playerAcceleration/2 && xSpeed > -playerAcceleration/2){
      xSpeed = 0;
    }

    //TODO: check for collision
    for (GameObject object:m.objects) {
      if (object.collisionDetection(this) == 1) {
        xSpeed = 0;
        break;
      }
      else if (object.collisionDetection(this) == 2) {
        ySpeed = 0;
        break;
      }
    }

    //movements
    if (xPos + xSpeed > width*m.playerBoundryX || xSpeed == 0) {
      m.updateXOffset(-xSpeed);
    }
    else if (xPos + xSpeed < width-width*m.playerBoundryX) {
      m.updateXOffset(-xSpeed);
    }
    else{
      xPos = xPos + xSpeed;
    }
    if (yPos + ySpeed < height-height*m.playerBoundryY || ySpeed == 0) {
      m.updateYOffset(-ySpeed);
    }
    else if (yPos + ySpeed > height*m.playerBoundryY) {
      m.updateYOffset(-ySpeed);
    }
    else{
      yPos = yPos + ySpeed;
    }
  }

  /*
   * makes the player jump
   *
   * @return None
   */
  void jump(){
    if (ySpeed == 0) {
      ySpeed = -10;
    }
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
   * makes the player go right
   *
   * @return None
   */
  void goRight(){
    movesRight = true;
  }

  /*
   * makes the player stop moving left
   *
   * @return None
   */
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
