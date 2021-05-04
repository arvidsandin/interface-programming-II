/*
 * A class which creates 2D objects that are part of the game map.
 */
class GameObject{
  float xPos;
  float yPos;

  String objType;

  color fillColor;

  // By how much to move the object in animations
  float xMove;
  float yMove;

  // If object is an ellipse, these are its radi
  float objWidth;
  float objHeight;
  
  ///////////////// TODO: Implement support for triangular objects
  // If object is a triangle
  float x2Pos;
  float y2Pos;
  float x3Pos;
  float y3Pos;

  PImage texture = null;

  /***************************************************************************************************************************************************
   *  MODEL
   ***************************************************************************************************************************************************
   */

 /*
  * Creates a GameObject with a given shape, color, and background texture
  *
  * @param objType  A string signifying which type of object to draw; either "rectangle" or "ellipse"
  * @param xPos  The object's x-position, given from its center
  * @param yPos  The object's y-position, given from its center
  * @param objWidth  The object's width. If the object is an ellipse, this sets the first radius
  * @param objHeight  The object's height. If the object is an ellipse, this sets the second radius
  * @param xMove  The amount to offset the x-position for animations
  * @param yMove  The amount to offset the y-position for animations
  * @param fillColor  The object's color
  * @param texture   Image path to the texture to set for the object, relative to the sketch
  * @return A new GameObject instance
  */
  GameObject(String objType, float xPos, float yPos, float objWidth, float objHeight, float xMove, float yMove, color fillColor, String texture){
    this.xPos = xPos;
    this.yPos = yPos;
    this.objType = objType;

    this.objWidth = objWidth;
    this.objHeight = objHeight;

    this.xMove = xMove;
    this.yMove = yMove;

    this.fillColor = fillColor;
    this.texture = loadImage(texture);
  }

 /*
  * Creates a GameObject with a given shape and color, without texture
  *
  * @param objType  A string signifying which type of object to draw; either "rectangle" or "ellipse"
  * @param xPos  The object's x-position, given from its center
  * @param yPos  The object's y-position, given from its center
  * @param objWidth  The object's width. If the object is an ellipse, this sets the first radius
  * @param objHeight  The object's height. If the object is an ellipse, this sets the second radius
  * @param xMove  The amount to offset the x-position for animations
  * @param yMove  The amount to offset the y-position for animations
  * @param fillColor  The object's color
  * @return A new GameObject instance
  */
  GameObject(String objType, float xPos, float yPos, float objWidth, float objHeight, float xMove, float yMove, color fillColor){
    this.xPos = xPos;
    this.yPos = yPos;
    this.objType = objType;

    this.fillColor = fillColor;

    this.objWidth = objWidth;
    this.objHeight = objHeight;

    this.xMove = xMove;
    this.yMove = yMove;
  }

  /*
   * Check if the object will collide with player
   *
   * @param p the Player to check for collision with
   * @return
            0 => no collision
            1 => collision in x-axis
            2 => collision in y-axis
   */
  int collisionDetection(Player p){
    if(this.objType.equalsIgnoreCase("circle")){
      //TODO: make circles collidable
      return 0;
    }
    else if(this.objType.equalsIgnoreCase("rectangle")){
      if (p.getXPos() - p.getWidth()/2 + p.getXSpeed() <= this.xPos + objWidth/2 &&
          p.getXPos() + p.getWidth()/2 + p.getXSpeed() >= this.xPos - objWidth/2 &&
          p.getYPos() - p.getHeight()/2 < this.yPos + objHeight/2 &&
          p.getYPos() + p.getHeight()/2 > this.yPos - objHeight/2) {
        return 1;
      }
      else if (
          p.getYPos() - p.getHeight()/2 + p.getYSpeed() <= this.yPos + objHeight/2 &&
          p.getYPos() + p.getHeight()/2 + p.getYSpeed() >= this.yPos - objHeight/2 &&
          p.getXPos() - p.getWidth()/2 < this.xPos + objWidth/2 &&
          p.getXPos() + p.getWidth()/2 > this.xPos - objWidth/2) {
        return 2;
      }
      else if (true) {
        return 0;
      }
    }
    return 0;
  }
  
  float[] getDimensions(){
    return new float[]{this.objWidth, this.objHeight};
  }
  
  float[] getPosition(){
    return new float[]{this.xPos, this.yPos};
  }

  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */

  /*
   * Draw the object according to its given shape
   *
   * return None
   */
   void drawMe(){
     pushStyle();
     noStroke();
     rectMode(CENTER);
     ellipseMode(CENTER);
     fill(this.fillColor);

     if(this.objType.equalsIgnoreCase("ellipse")){
       ellipse(this.xPos, this.yPos, this.objWidth, this.objHeight);
     }
     else{
        rect(this.xPos, this.yPos, this.objWidth, this.objHeight);
     }

     if(this.texture != null){
        image(this.texture, this.xPos, this.yPos, this.objWidth, this.objHeight);
      }

    popStyle();
   }

   boolean isVisible(){
     if(this.objType.equalsIgnoreCase("ellipse") || this.objType.equalsIgnoreCase("rectangle")){
       return (
       xPos + this.objWidth > 0 && xPos - this.objWidth < width &&
       yPos + this.objHeight > 0 && yPos - this.objHeight < height);
     }
     else{
       // TODO: ADAPT FOR TRIANGULAR OBJECTS INSTEAD
       return (
       xPos + objWidth/2 > 0 && xPos - objWidth/2 < width &&
       yPos + objHeight/2 > 0 && yPos - objHeight/2 < height);
     }
   }

  /***************************************************************************************************************************************************
   *  CONTROL
   ***************************************************************************************************************************************************
   */

   /*
   * Changes the object's position according to the direction it is moving in.
   *
   * @param xDir  The direction in which the object should move on the x-axis. -1 for left, 1 for right, 0 for neither
   * @param yDir  The direction in which the object should move on the y-axis. -1 for up, 1 for down, 0 for neither
   * return None
   */
   void moveMe(float xMove, float yMove){
    this.xPos += xMove;
    this.yPos += yMove;
   }

}
