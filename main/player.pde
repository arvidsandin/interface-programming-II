/*
 * A class for the playable character
 */
class Player {
  boolean isAlive = true;
  float xPos = 600;
  float yPos = 300;
  float playerHeight = 90;
  float playerWidth = 40;
  float playerAcceleration = 0.6;
  float xSpeed = 0;
  float ySpeed = 0;
  float lethalSpeed = 25;
  float maxHorizontalSpeed = 5;
  boolean movesLeft = false;
  boolean movesRight = false;

  float climbDistance = 0;
  boolean isClimbing = false;

  boolean inAnimation = false;
  PImage playerModel = loadImage("data/models/crop.png");


   // TODO: Implement ability to slide in player and game controls
  /***************************************************************************************************************************************************
   *  MODEL
   ***************************************************************************************************************************************************
   */

  /*
   * Constructor to set all attributes of Player class
   *
   * @return A new Player object
   */
  Player() {
  }
  
  /*
   * Constructor to set position attributes of Player class
   *
   * @return A new Player object
   */
  Player(float xPos, float yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
  }

  boolean inAir() {
    return this.ySpeed != 0;
  }

  boolean isJumping() {
    return this.ySpeed < 0;
  }

  boolean isFalling() {
    return this.ySpeed > 0;
  }
  
  
  float getWidth(){
    return this.playerWidth;
  }
  float getHeight(){
    return this.playerHeight;
  }
  float getXPos(){
    return this.xPos;
  }
  float getYPos(){
   return this.yPos; 
  }
  float getXSpeed(){
    return this.xSpeed;
  }
  float getYSpeed(){
    return this.ySpeed;
  }

  /*
   * updates the player's position based on current speed
   *
   * @return None
   */
  void timeStep(Map m) {
    //Accelerations
    this.increasePlayerSpeed(m);

    this.addFriction(m);

    this.handleCollision(m);

    //Camera movements
    this.updateMapPosition(m);

    if (this.checkForFallDeath(m)) {
      this.isAlive = false;
    }
  }

  void increasePlayerSpeed(Map m) {
    this.ySpeed += m.gravity;
    if (movesLeft) {
      this.xSpeed -= this.playerAcceleration;
    }
    if (movesRight) {
      this.xSpeed += this.playerAcceleration;
    }
    
    

    if (this.xSpeed > this.maxHorizontalSpeed)
    {
      println("here");
      this.xSpeed -= 2*this.playerAcceleration;
      //stop at max speed
      if (this.xSpeed < this.maxHorizontalSpeed)
      {
        this.xSpeed = this.maxHorizontalSpeed;
      }
    }
    else if (this.xSpeed < -this.maxHorizontalSpeed)
    {
      this.xSpeed += 2*this.playerAcceleration;
      //stop at max speed
      if (this.xSpeed > -this.maxHorizontalSpeed)
      {
        this.xSpeed = -this.maxHorizontalSpeed;
      }
    }

  }



  void addFriction(Map m) {
    if (!this.movesLeft && !this.movesRight) {
      this.xSpeed -= m.friction*xSpeed;
    }

    //Stop if speed is too low;
    if (this.xSpeed < playerAcceleration/2 && this.xSpeed > -playerAcceleration/2) {
      this.xSpeed = 0;
    }
  }


  void handleCollision(Map m) {
    for (GameObject object : m.objects) {
      if (object.collisionDetection(this) == 1) {
        climb(object);
        this.xSpeed = 0;
      }
      else if (object.collisionDetection(this) == 2) {
        if (checkForCollisionDeath()) {
          this.isAlive = false;
        }
        this.ySpeed = 0;
      }
      else if (object.collisionDetection(this) == 3) {
        if (checkForCollisionDeath()) {
          this.isAlive = false;
        }
        this.ySpeed = 0;
        this.xSpeed = 0;
      }
    }
    if (this.isFalling()){
      this.isClimbing = false;
      this.climbDistance = 0;
    }
  }


  void climb(GameObject object) {
    // Allow climbing while jumping or while fall speed is low
    if (this.isJumping()) {
      this.isClimbing = true;
      float objY = object.getPosition()[1];
      float objHeight = object.getDimensions()[1];

      // To climb edge
      if(objY - objHeight/2 > this.yPos - this.playerHeight/2){
        this.ySpeed = -3;
        if(objY - objHeight/2 > this.yPos + this.playerHeight/2 -4){
          // When close to edge
          this.ySpeed = -2;
        }
      }
      else if(abs(this.climbDistance) <= this.playerHeight * 1.5){
      // To climb wall
        this.ySpeed = -4;
        this.climbDistance += this.ySpeed;
      }
      else{
        this.ySpeed = -0.1;
      }
    }
  }
  
  /*
   * Updates map offset each frame
   *
   */

  // TODO: Update handling of rescaled positions/width/height
  void updateMapPosition(Map m) {
    if (rescaleByWidth(this.xPos + this.xSpeed) > width*m.playerBoundryX || this.xSpeed == 0) {
      m.updateXOffset(-xSpeed);
    } else if (rescaleByWidth(this.xPos + this.xSpeed) < width-width*m.playerBoundryX) {
      m.updateXOffset(-xSpeed);
    } else {
      this.xPos = this.xPos + this.xSpeed;
    }

    if (rescaleByHeight(yPos + ySpeed) < height-height*m.playerBoundryY || this.ySpeed == 0) {
      m.updateYOffset(-this.ySpeed);

    } else if (rescaleByHeight(yPos + ySpeed) > height*m.playerBoundryY) {
      m.updateYOffset(-this.ySpeed);
    } else {
      this.yPos = this.yPos + this.ySpeed;
    }
  }


  boolean checkForFallDeath(Map m) {
    if (this.ySpeed >= this.lethalSpeed) {
      for (GameObject object : m.objects) {
        float[] objDimensions = object.getDimensions();
        float[] objPos = object.getPosition();

        if ((this.xPos + this.playerWidth/2 >= objPos[0] - objDimensions[0]/2 - 50 && this.xPos - this.playerWidth/2 <= objPos[0] + objDimensions[0]/2 + 50) &&
          this.yPos - this.playerHeight/2 <= objPos[1] + objDimensions[1]/2) {
          return false;
        }
      }
      return true;
    }
    return false;
  }


  boolean checkForCollisionDeath() {
    if (this.ySpeed >= this.lethalSpeed) {
      return true;
    }
    return false;
  }

  boolean isAlive() {
    return this.isAlive;
  }

  void climbAnimation(){

  }


  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */

  /*
   * Draws up the player
   *
   * @return None
   */
  void drawMe() {
    fill(255, 60, 60);
    pushStyle();
    rectMode(CENTER);
    imageMode(CENTER);
    
    image(this.playerModel, this.xPos, this.yPos, (int)this.playerWidth, (int)this.playerHeight);
    
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
  void jump() {
    if (this.ySpeed == 0) {
      this.ySpeed = -5;
    }
    if(abs(this.xSpeed) > 0){
      this.xSpeed *= 1.75;
    }
  }

  /*
   * makes the player go left
   *
   * @return None
   */
  void goLeft() {
    this.movesLeft = true;
  }

  /*
   * makes the player go right
   *
   * @return None
   */
  void goRight() {
    this.movesRight = true;
  }

  /*
   * makes the player stop moving left
   *
   * @return None
   */
  void stopLeft() {
    this.movesLeft = false;
  }

  /*
   * makes the player stop moving right
   *
   * @return None
   */
  void stopRight() {
    this.movesRight = false;
  }
}
