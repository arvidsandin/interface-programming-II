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
  
  // If object is a rectangle
  float objWidth;
  float objHeight;
  
  // If object is a circle
  float radius;
  
  PImage texture = null;
  
  /*************************************************
   *  MODEL
   *************************************************
   */
   
 /*
  * Creates a GameObject with a given shape, color, and background texture
  *
  * @param objType  A string signifying which type of object to draw; either "rectangle" or "circle"
  * @param xPos  The object's x-position, given from its center
  * @param yPos  The object's y-position, given from its center
  * @param objWidth  The object's width
  * @param objHeight  The object's height
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
  * @param objType  A string signifying which type of object to draw; either "rectangle" or "circle"
  * @param xPos  The object's x-position, given from its center
  * @param yPos  The object's y-position, given from its center
  * @param objWidth  The object's width
  * @param objHeight  The object's height
  * @param xMove  The amount to offset the x-position for animations
  * @param yMove  The amount to offset the y-position for animations
  * @param fillColor  The object's color
  * @return A new GameObject instance
  */   
  GameObject(String objType, float xPos, float yPos, float objWidth, float xMove, float yMove, float objHeight, color fillColor){ 
    this.xPos = xPos;
    this.yPos = yPos;
    this.objType = objType;
    
    this.fillColor = fillColor;
    
    this.objWidth = objWidth;
    this.objHeight = objHeight;
    
    this.xMove = xMove;
    this.yMove = yMove;
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
     
     if(this.objType.equalsIgnoreCase("circle")){
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


  /*************************************************
   *  CONTROL
   *************************************************
   */
   
   /*
   * Move the object by changing its position. Call to allow for animation
   *
   * @param xDir  The direction in which the object should move on the x-axis. -1 for left, 1 for right, 0 for neither
   * @param yDir  The direction in which the object should move on the y-axis. -1 for up, 1 for down, 0 for neither
   * return None
   */
   void moveMe(int xDir, int yDir){
    this.xPos += this.xMove * xDir;
    this.yPos += this.yMove * yDir;
   }

}
