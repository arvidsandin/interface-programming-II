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
  float maxYSpeed = 25;
  float maxHorizontalSpeed = 5;
  boolean movesLeft = false;
  boolean movesRight = false;
  
  boolean inStaticAnimation = false;
  int startOfClimb;
  
  /***************************************************************************************************************************************************
   *  MODEL
   ***************************************************************************************************************************************************
   */

  /*
   * Constructor to set all attributes of Player class
   *
   * @return A new Player object
   */
  Player(){
  }
  
  boolean inAir(){
    return this.ySpeed != 0;
  }

  boolean isJumping(){
    return this.ySpeed < 0;
  }
  
  /*
   * updates the player's position based on current speed
   *
   * @return None
   */
  void timeStep(Map m){
    //Accelerations
    increasePlayerSpeed(m);

    addFriction(m);

    handleCollision(m);
 
    //movements
    updateMapPosition(m);
    
    println(checkForFallDeath(m));
  }
  
  
  void increasePlayerSpeed(Map m){
    this.ySpeed += m.gravity;
    if(movesLeft){
      this.xSpeed -= this.playerAcceleration;
    }
    if (movesRight){
      this.xSpeed += this.playerAcceleration;
    }

    //stop at max speed
    if (this.xSpeed > this.maxHorizontalSpeed)
    {
      this.xSpeed = this.maxHorizontalSpeed;
    }
    if (this.xSpeed < -this.maxHorizontalSpeed)
    {
      this.xSpeed = -this.maxHorizontalSpeed;
    } 
  }
  
  void addFriction(Map m){
    if (!this.movesLeft && !this.movesRight) {
      this.xSpeed -= m.friction*xSpeed;
    }

    //Stop if speed is too low;
    if (this.xSpeed < playerAcceleration/2 && this.xSpeed > -playerAcceleration/2){
      this.xSpeed = 0;
    } 
  }
  
  
  void handleCollision(Map m){
   for (GameObject object:m.objects) {
      if (object.collisionDetection(this) == 1) {
        this.xSpeed = 0;
        climb(object);
      }
      else if (object.collisionDetection(this) == 2) {
        this.ySpeed = 0;
      }
    }
  }
  
  void climb(GameObject object){
   if(this.isJumping()){
           this.ySpeed = -3;
    } 
  }
  
  void updateMapPosition(Map m){
   if (this.xPos + this.xSpeed > width*m.playerBoundryX || this.xSpeed == 0) {
      m.updateXOffset(-xSpeed);
    }
    else if (xPos + xSpeed < width-width*m.playerBoundryX) {
      m.updateXOffset(-xSpeed);
    }
    else{
      this.xPos = this.xPos + this.xSpeed;
    }
    
    if (yPos + ySpeed < height-height*m.playerBoundryY || this.ySpeed == 0) {
      m.updateYOffset(-this.ySpeed);
    }
    else if (yPos + ySpeed > height*m.playerBoundryY) {
      m.updateYOffset(-this.ySpeed);
    }
    else{
      this.yPos = this.yPos + this.ySpeed;
    } 
  }
  
  
  boolean checkForFallDeath(Map m){
   if(this.ySpeed >= 1){
      for(GameObject object:m.objects){
        float[] objDimensions = object.getDimensions();
        float[] objPos = object.getPosition();
        
        if(!((this.xPos + this.playerWidth/2 <= objPos[0] - objDimensions[0]/2 - 50 || this.xPos - this.playerWidth/2 >= objPos[0] + objDimensions[0]/2 + 50) && 
            this.yPos - this.playerHeight/2 >= objPos[1] + objDimensions[1]/2 )){
               return false;
        }
      }
      return true;
   }
   return false;
  }
  /*(p.xPos - p.playerWidth/2 + p.xSpeed <= this.xPos + objWidth/2 &&
          p.xPos + p.playerWidth/2 + p.xSpeed >= this.xPos - objWidth/2 &&
          p.yPos - p.playerHeight/2 < this.yPos + objHeight/2 &&
          p.yPos + p.playerHeight/2 > this.yPos - objHeight/2)*/
  
  
  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */

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
  
  
  /***************************************************************************************************************************************************
   *  CONTROL
   ***************************************************************************************************************************************************
   */
   
  /*
   * makes the player jump
   *
   * @return None
   */
  void jump(){
    if (this.ySpeed == 0) {
      this.ySpeed = -5;
    }
  }

  /*
   * makes the player go left
   *
   * @return None
   */
  void goLeft(){
    this.movesLeft = true;
  }

  /*
   * makes the player go right
   *
   * @return None
   */
  void goRight(){
    this.movesRight = true;
  }

  /*
   * makes the player stop moving left
   *
   * @return None
   */
  void stopLeft(){
    this.movesLeft = false;
  }

  /*
   * makes the player stop moving right
   *
   * @return None
   */
  void stopRight(){
    this.movesRight = false;
  }
  
}
