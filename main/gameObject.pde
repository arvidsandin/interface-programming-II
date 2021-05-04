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
  float x2Pos = 0;
  float y2Pos = 0;
  float x3Pos = 0;
  float y3Pos = 0;

  PImage texture = null;

  /*************************************************
   *  MODEL
   *************************************************
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
   * Creates a GameObject with a triangular shape and a given color, without texture
   *
   * @param objType  A string signifying which type of object to draw; has to be "triangle"
   * @param xPos  The triangle's first point's x-position
   * @param yPos  The triangle's first point's y-position
   * @param x2Pos  The triangle's second point's x-position
   * @param y2Pos  The triangle's second point's y-position
   * @param x3Pos  The triangle's third point's x-position
   * @param y3Pos  The triangle's third point's y-position
   * @param xMove  The amount to offset the x-position for animations
   * @param yMove  The amount to offset the y-position for animations
   * @param fillColor  The object's color
   * @return A new GameObject instance
   */
   GameObject(String objType, float xPos, float yPos, float x2Pos, float y2Pos, float x3Pos, float y3Pos, float xMove, float yMove, color fillColor){
     this.xPos = xPos;
     this.yPos = yPos;
     this.x2Pos = x2Pos;
     this.y2Pos = y2Pos;
     this.x3Pos = x3Pos;
     this.y3Pos = y3Pos;
     this.objType = objType;

     this.fillColor = fillColor;

     this.xMove = xMove;
     this.yMove = yMove;
   }


   /*
    * Help function for collitionDetection, taken from stackoverflow
    *
    */
   float sign(float p1x, float p1y, float p2x, float p2y, float p3x, float p3y)
   {
     return (p1x - p3x) * (p2y - p3y) - (p2x - p3x) * (p1y - p3y);
   }

  /*
   * Check if the object will collide with player
   *
   * @param p the Player to check for collision with
   * @return
            0 => no collision
            1 => collision in x-axis
            2 => collision in y-axis
            3 => collision in x- and y-axis
   */
  int collisionDetection(Player p){
    if(this.objType.equalsIgnoreCase("circle")){
      //TODO: make circles collidable
      return 0;
    }
    else if(this.objType.equalsIgnoreCase("rectangle")){
      if (p.xPos - p.playerWidth/2 + p.xSpeed <= this.xPos + objWidth/2 &&
          p.xPos + p.playerWidth/2 + p.xSpeed >= this.xPos - objWidth/2 &&
          p.yPos - p.playerHeight/2 < this.yPos + objHeight/2 &&
          p.yPos + p.playerHeight/2 > this.yPos - objHeight/2) {
        return 1;
      }
      else if (
          p.yPos - p.playerHeight/2 + p.ySpeed <= this.yPos + objHeight/2 &&
          p.yPos + p.playerHeight/2 + p.ySpeed >= this.yPos - objHeight/2 &&
          p.xPos - p.playerWidth/2 < this.xPos + objWidth/2 &&
          p.xPos + p.playerWidth/2 > this.xPos - objWidth/2) {
        return 2;
      }
      else if (true) {
        return 0;
      }
    }
    else if(this.objType.equalsIgnoreCase("triangle")){
      float d1 = sign(p.xPos + p.xSpeed, p.yPos + p.playerHeight/2 + p.ySpeed, this.xPos, this.yPos, this.x2Pos, this.y2Pos);
      float d2 = sign(p.xPos + p.xSpeed, p.yPos + p.playerHeight/2 + p.ySpeed, this.x2Pos, this.y2Pos, this.x3Pos, this.y3Pos);
      float d3 = sign(p.xPos + p.xSpeed, p.yPos + p.playerHeight/2 + p.ySpeed, this.x3Pos, this.y3Pos, this.xPos, this.yPos);

      boolean has_neg = (d1 < 0) || (d2 < 0) || (d3 < 0);
      boolean has_pos = (d1 > 0) || (d2 > 0) || (d3 > 0);

      if(!(has_neg && has_pos)){
        return 3;
      }
      else{
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

  /*************************************************
   *  VIEW
   *************************************************
   */

  /*
   * Draw the object according to its given shape
   *
   * return None
   */
   void drawMe(){
     pushStyle();
     rectMode(CENTER);
     ellipseMode(CENTER);
     fill(this.fillColor);
     noStroke();

     if(this.objType.equalsIgnoreCase("ellipse")){
       ellipse(this.xPos, this.yPos, this.objWidth, this.objHeight);
     }
     else if(this.objType.equalsIgnoreCase("rectangle")){
        rect(this.xPos, this.yPos, this.objWidth, this.objHeight);
     }
     else if(this.objType.equalsIgnoreCase("triangle")){
        triangle(this.xPos, this.yPos, this.x2Pos, this.y2Pos, this.x3Pos, this.y3Pos);
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
     else if (this.objType.equalsIgnoreCase("triangle")){
       return (
       (xPos > 0 && xPos < width && yPos > 0 && yPos < height) ||
       (x2Pos > 0 && x2Pos < width && y2Pos > 0 && y2Pos < height) ||
       (x3Pos > 0 && x3Pos < width && y3Pos > 0 && y3Pos < height));
     }
     else{
       return true;
     }
   }

  /*************************************************
   *  CONTROL
   *************************************************
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
    //Only applicable to triangles
    this.x2Pos += xMove;
    this.y2Pos += yMove;
    this.x3Pos += xMove;
    this.y3Pos += yMove;
   }

}
