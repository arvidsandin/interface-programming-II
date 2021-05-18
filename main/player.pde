/*
 * A class for the playable character and its attributes
 */
class Player {
  boolean isAlive = true;
  float xPos = 600;
  float yPos = 300;
  
  float playerHeight = 90;
  float playerWidth = 40;
  
  float playerAcceleration = 0.5;
  float xSpeed = 0;
  float ySpeed = 0;
  float lethalSpeed = 25;
  float maxHorizontalSpeed = 5;
  
  boolean movesLeft = false;
  boolean movesRight = false;

  float climbDistance = 0;
  boolean isClimbing = false;

  //Player visualization and animation variables
  boolean inAnimation = false;
  PImage playerSprite = loadImage("data/models/cut.png");
  
  //TODO: Implement sprite sheet
  // Arrays need to be initialised before the setup. 
  //
  // The number of sprites in each row.
  //
  int[] spriteSize = {2, 13, 13};
  // The direction of movement: 1 is right, -1 is left
  // 
  int[] spriteDir = {-1, 1, 0};
  
  int spriteHeight = 60;
  int spriteWidth = 60;
  
  // We store a sequence of images in an ArrayLists. 
  // 
  ArrayList<PImage> animation;
  ArrayList<Sprite> sprite_data;
  
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
   * Returns whether the player is moving through the air
   *
   * @return Whether Player is in air
   */
  boolean inAir() {
    return this.ySpeed != 0;
  }

  /*
   * Returns whether the player is jumping up
   *
   * @return Whether Player is jumping
   */
  boolean isJumping() {
    return this.ySpeed < 0;
  }

  /*
   * Returns whether the player is falling
   *
   * @return Whether Player is falling
   */
  boolean isFalling() {
    return this.ySpeed > 0;
  }

  /*
   * The width of Player 
   *
   * @return Width of Player
   */
  float getWidth(){
    return this.playerWidth;
  }

  /*
   * The height of Player 
   *
   * @return Height of Player
   */
  float getHeight(){
    return this.playerHeight;
  }


  /*
   * Returns the Player's x-coordinate
   *
   * @return Position in x-axis of Player
   */
  float getXPos(){
    return this.xPos;
  }

  /*
   * Returns the Player's y-coordinate
   *
   * @return Position in y-axis of Player
   */
  float getYPos(){
   return this.yPos;
  }

  /*
   * Returns the Player's horizontal speed
   *
   * @return Speed in x-axis of Player
   */
  float getXSpeed(){
    return this.xSpeed;
  }

  /*
   * Returns the Player's vertical speed
   *
   * @return Speed in y-axis of Player
   */
  float getYSpeed(){
    return this.ySpeed;
  }

  /*
   * Updates any of the Player's positions that will change in one frame, based on the map
   *
   * @param m   The Map in which the Player is currently in
   * @return None
   */
  void moveMe(Map m) {
    //Accelerations
    this.increasePlayerSpeed(m);
    this.addFriction(m);
    
    //this.updatePosition();

    this.handleCollision(m);

    if (this.checkForFallDeath(m)) {
      this.isAlive = false;
    }
  }
  
  /*
   * Updates the player's x-position with their horizontal speed
   *
   * @return None
   */
  void updateXPosition(){
    this.xPos = this.xPos + this.xSpeed;
    
  }
  /*
   * Updates the player's y-position with their vertical speed
   *
   * @return None
   */
  void updateYPosition(){
    this.yPos = this.yPos + this.ySpeed;
  }

  /*
   * Updates the player's speed based on gravity and whether the player is running
   *
   * @param m    The Map in which the Player is currently in
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
   * Slows down the player's speed if the player stops running
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
   * Updates the player's speed in along either the y or x-axis if it collides with any object
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
    if (this.isFalling()){
      this.isClimbing = false;
      this.climbDistance = 0;
    }
   }
  }

  /*
   * Updates the player's vertical speed based on whether it should be capable of sprinting up a vertical surface
   *
   * @param m the Map in which the Player is currently in
   * @return None
   */
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
   * Checks whether the player should die if it is not close enough to land on an object
   *
   * @param m   The Map in which the Player is currently in
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
   * Checks whether the player should die before impact with an object 
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
   * States whether Player's status is alive or not
   *
   * @return if the player is alive
   */
  boolean isAlive() {
    return this.isAlive;
  }


  /*
   * Makes the player jump in next frame
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
   * Makes the player go left in next frame
   *
   * @return None
   */
  void goLeft() {
    this.movesLeft = true;
  }

  /*
   * Makes the player go right in next frame
   *
   * @return None
   */
  void goRight() {
    this.movesRight = true;
  }

  /*
   * Makes the player stop moving left in next frame
   *
   * @return None
   */
  void stopLeft() {
    this.movesLeft = false;
  }

  /*
   * Makes the player stop moving right in next frame
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
    
    image(this.playerSprite, this.xPos, this.yPos, (int)this.playerWidth, (int)this.playerHeight);

    popStyle();
  }
}
