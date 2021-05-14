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
   * Help function for collisionDetection, taken from stackoverflow
   *
   *
   * @return 
   */
  float sign(float p1x, float p1y, float p2x, float p2y, float p3x, float p3y){
    return (p1x - p3x) * (p2y - p3y) - (p2x - p3x) * (p1y - p3y);
  }

  /*
   * Returns the dimensions of the object
   * @return The dimensions of the object
   */
  float[] getDimensions(){
    return new float[]{this.objWidth, this.objHeight};
  }

  /*
   * Returns the position of a game object
   *
   * @return The xy-position of the object in an array
   */
  float[] getPosition(){
    return new float[]{this.xPos, this.yPos};
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
      else {
        return 0;
      }
    }
    //triangle should be disabled until collsion handling is fixed
    /*
    else if(this.objType.equalsIgnoreCase("triangle")){
      float d1 = sign(p.getXPos() + p.getXSpeed(), p.getYPos() + p.getHeight()/2 + p.getYSpeed(), this.xPos, this.yPos, this.x2Pos, this.y2Pos);
      float d2 = sign(p.getXPos() + p.getXSpeed(), p.getYPos() + p.getHeight()/2 + p.getYSpeed(), this.x2Pos, this.y2Pos, this.x3Pos, this.y3Pos);
      float d3 = sign(p.getXPos() + p.getXSpeed(), p.getYPos() + p.getHeight()/2 + p.getYSpeed(), this.x3Pos, this.y3Pos, this.xPos, this.yPos);

      boolean has_neg = (d1 < 0) || (d2 < 0) || (d3 < 0);
      boolean has_pos = (d1 > 0) || (d2 > 0) || (d3 > 0);

      if(!(has_neg && has_pos)){
        return 3;
      }
      else{
        return 0;
      }
    }*/
    return 0;
  }

  /*
   * States whether the game object is visible through the current dimensions of the game window
   *
   * @return boolean indicating whether the object is visible
   */
  boolean isVisible(){
    float rescaledX = rescaleByWidth(xPos);
    float rescaledY = rescaleByWidth(yPos);

    if(this.objType.equalsIgnoreCase("ellipse") || this.objType.equalsIgnoreCase("rectangle")){
      return (
      xPos + this.objWidth > 0 && rescaledX - rescaleByWidth(this.objWidth) < width &&
      yPos + this.objHeight > 0 && rescaledY - rescaleByHeight(this.objHeight) < height);
    }
    else if (this.objType.equalsIgnoreCase("triangle")){

      return (
      (xPos > 0 && rescaledX < width && yPos > 0 && rescaledY < height) ||
      (x2Pos > 0 && rescaleByWidth(x2Pos) < width && y2Pos > 0 && rescaleByWidth(y2Pos) < height) ||
      (x3Pos > 0 && rescaleByWidth(x3Pos) < width && y3Pos > 0 && rescaleByWidth(y3Pos) < height));
    }
    else{
      return true;
    }
  }

  /*
   * Changes the object's position according to given offset values.
   *
   * @param xMove  The direction in which the object should move on the x-axis.
   * @param yMove  The direction in which the object should move on the y-axis.
   * @return None
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

  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */

  /*
   * Draw the object according to its given shape
   *
   * @return None
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

}
