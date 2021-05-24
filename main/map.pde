/*
 * A class for the game map.
 */
class Map {
  float gravity;
  float friction;
  float xOffset = 0;
  float yOffset = 0;
  //how far to the sides the player can go before the world moves instead of player, as a fraction of width
  float playerBoundryX = 0.6;
  //how far up or down the player can go before the world moves instead of player, as a fraction of height
  float playerBoundryY = 0.6;
  GameObject[] objects;

  /*
   * Constructor to set all attributes of Map class
   *
   * @param g    Gravity, the downward constant acceleration
   * @param f    Friction, how much speed is countered
   * @param o    All the objects in the map
   * @return A new Map object
   */
  Map(float g, float f, GameObject[] o){
    this.gravity = g;
    this.friction = f;
    this.objects = o;
  }

  /*
   * Updates the offset in x-axis that each object in the map moves in the next frame
   *
   * @param x the offset
   * @return None
   */
  void updateXOffset(float x){
    xOffset = x;
  }

  /*
   * Updates the offset in y-axis that each object in the map moves in the next frame
   *
   * @param y the offset
   * @return None
   */
  void updateYOffset(float y){
    yOffset = y;
  }

  /*
   * Moves all objects in the map by the current offset
   *
   * @return None
   */
  void moveMe(Player p){
    //Camera movements
    this.updateMapPosition(p);

    for (GameObject object : objects) {
      object.moveMe(xOffset, yOffset);
    }
    parallaxBg.updateOffset(xOffset);
  }

  /*
   * Updates what offset each object in the map should be moved in the next frame, as well as the player's position if necessary
   *
   * @param p The player which the map is drawn for
   * @return None
   */
  void updateMapPosition(Player p) {
    float xSpeed = p.getXSpeed();
    float ySpeed = p.getYSpeed();
    float xPos = p.getXPos();
    float yPos = p.getYPos();

    if (rescaleByWidth(xPos + xSpeed) > width * this.playerBoundryX || xSpeed == 0) {
      this.updateXOffset(-xSpeed);
    } else if (rescaleByWidth(xPos + xSpeed) < width - width*this.playerBoundryX) {
      this.updateXOffset(-xSpeed);
    }
    else{
      p.updateXPosition();
    }

    if (rescaleByHeight(yPos + ySpeed) < height - height * this.playerBoundryY || ySpeed == 0) {
      this.updateYOffset(-ySpeed);

    } else if (rescaleByHeight(yPos + ySpeed) > height*this.playerBoundryY) {
      this.updateYOffset(-ySpeed);
    }else{
      p.updateYPosition();
    }

    // TODO: CONSIDER WHETHER MAP SHOULD GET TO UPDATE PLAYER POSITION RATHER THAN PLAYER
  }

  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */
  /*
   * Draws up the map
   *
   * @return None
   */
    void drawMe(){
      push();
      background(137, 209, 254);
      parallaxBg.drawParallax();

      for (GameObject object : objects) {
        if (object.isVisible()){
          object.drawMe();
        }
      }
      pop();
    }




}
