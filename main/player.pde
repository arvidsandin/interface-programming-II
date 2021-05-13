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

  /*
   *
   * @return if Player is in air
   */
  boolean inAir() {
    return this.ySpeed != 0;
  }

  /*
   *
   * @return if Player is jumping
   */
  boolean isJumping() {
    return this.ySpeed < 0;
  }

  /*
   *
   * @return if Player is falling
   */
  boolean isFalling() {
    return this.ySpeed > 0;
  }

  /*
   *
   * @return width of Player
   */
  float getWidth(){
    return this.playerWidth;
  }

  /*
   *
   * @return height of Player
   */
  float getHeight(){
    return this.playerHeight;
  }


  /*
   *
   * @return position in x-axis of Player
   */
  float getXPos(){
    return this.xPos;
  }

  /*
   *
   * @return position in y-axis of Player
   */
  float getYPos(){
   return this.yPos;
  }

  /*
   *
   * @return speed in x-axis of Player
   */
  float getXSpeed(){
    return this.xSpeed;
  }

  /*
   *
   * @return speed in y-axis of Player
   */
  float getYSpeed(){
    return this.ySpeed;
  }

  /*
   * updates any positions that will change in one frame
   *
   * @param m the Map in which the Player is currently in
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

  /*
   * updates the player's speed if the player is running and based on gravity
   *
   * @param m the Map in which the Player is currently in
   * @return None
   */
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


  /*
   * slows down the player's speed if the player stops running
   *
   * @param m the Map in which the Player is currently in
   * @return None
   */
  void addFriction(Map m) {
    if (!this.movesLeft && !this.movesRight) {
      this.xSpeed -= m.friction*xSpeed;
    }

    //Stop if speed is too low;
    if (this.xSpeed < playerAcceleration/2 && this.xSpeed > -playerAcceleration/2) {
      this.xSpeed = 0;
    }
  }

  /*
   * updates the player's speed if it collisides with any object
   *
   * @param m the Map in which the Player is currently in
   * @return None
   */
  void handleCollision(Map m) {
    for (GameObject object : m.objects) {
      //rectangle collision x-axis
      if (object.collisionDetection(this) == 1) {
        climb(object);
        this.xSpeed = 0;
      }
      //rectangle collision y-axis
      else if (object.collisionDetection(this) == 2) {
        if (checkForCollisionDeath()) {
          this.isAlive = false;
        }
        this.ySpeed = 0;
      }
      //triangle, collision from above
      //TODO: make triangle collision handling work better
      else if (object.collisionDetection(this) == 3) {
        if (checkForCollisionDeath()) {
          this.isAlive = false;
          this.ySpeed = 0;
          this.xSpeed = 0;
          return;
        }
        float oldxSpeed = this.xSpeed;
        float oldySpeed = this.ySpeed;
        this.ySpeed = -abs(2*oldxSpeed);
        if (this.xSpeed == 0 || object.collisionDetection(this) != 0) {
          this.xSpeed = 0;
          this.ySpeed = 0;
          //is this better?
          this.xSpeed = -oldxSpeed;
          return;
        }
        //Check the lowest angle between ~±63° that can be traveled without a collision
        for (float i=abs(oldxSpeed); i>-abs(oldxSpeed)+0.1; i-=0.1) {
          //i*2 is to try a wider range than 45°
          this.ySpeed = - i*2;
          //Normalize xSpeed and ySpeed
          this.xSpeed = Math.signum(xSpeed)*(float)Math.cos(Math.atan(abs(ySpeed/oldxSpeed)));
          this.ySpeed = Math.signum(ySpeed)*(float)Math.sin(Math.atan(abs(ySpeed/oldxSpeed)));
          //Scale xSpeedand ySpeed appropriately
          if (this.movesLeft || this.movesRight) {
            this.xSpeed *= this.maxHorizontalSpeed;
            this.ySpeed *= this.maxHorizontalSpeed;
          }
          else{
            this.xSpeed *= this.xSpeed;
            this.ySpeed *= this.xSpeed;
          }
          if (object.collisionDetection(this) != 0){
            //Use the last i that didn't cause a collision
            this.ySpeed = - (i+0.1)*2;
            this.xSpeed = Math.signum(xSpeed)*(float)Math.cos(Math.atan(abs(ySpeed/oldxSpeed)));
            this.ySpeed = Math.signum(ySpeed)*(float)Math.sin(Math.atan(abs(ySpeed/oldxSpeed)));
            if (this.movesLeft || this.movesRight) {
              this.xSpeed *= this.maxHorizontalSpeed;
              this.ySpeed *= this.maxHorizontalSpeed;
            }
            else{
              this.xSpeed *= this.xSpeed;
              this.ySpeed *= this.xSpeed;
            }
            return;
          }
        }
        this.xSpeed = 0;
        this.ySpeed = 0;
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
      // To climb wall
      else if(abs(this.climbDistance) <= this.playerHeight * 1.5){
        this.ySpeed = -4;
        this.climbDistance += this.ySpeed;
      }
      else{
        this.ySpeed = 0;
      }
    }
  }

  /*
   * Updates what offset each object in the map should be moved in the next frame
   *
   * @param m the Map in which the Player is currently in
   * @return None
   */
  // TODO: Update handling of rescaled positions/width/height
  void updateMapPosition(Map m) {
    if (rescaleByWidth(this.xPos + this.xSpeed) > 1200*m.playerBoundryX || this.xSpeed == 0) {
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

  /*
   *
   * @param m the Map in which the Player is currently in
   * @return if the Player is falling outside of the map
   */
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

  /*
   *
   * @return Boolean for whether the speed of the Player makes the collision lethal
   */
  boolean checkForCollisionDeath() {
    if (this.ySpeed >= this.lethalSpeed) {
      return true;
    }
    return false;
  }

  /*
   * States whether boolean 
   *
   * @return if the player is alive
   */
  boolean isAlive() {
    return this.isAlive;
  }


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
    imageMode(CENTER);
    
    image(this.playerModel, this.xPos, this.yPos, (int)this.playerWidth, (int)this.playerHeight);

    popStyle();
  }
}
