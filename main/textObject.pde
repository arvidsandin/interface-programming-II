
/*
 * A class for non-collidable game objects that contain text
 *
 */
class TextObject extends GameObject{
  String[] text;
  PFont textFont = createFont("data/fonts/Swansea-q3pd.ttf", floor(height/25), true);
  
  
/***************************************************************************************************************************************************
 *  MODEL
 ***************************************************************************************************************************************************
 */

  /*
   * Creates a TextObject with a given color
   *
   * @param objType  A string signifying which type of object to draw; either "rectangle" or "ellipse"
   * @param xPos  The object's x-position, given from its center
   * @param yPos  The object's y-position, given from its center
   * @param objWidth  The object's width. If the object is an ellipse, this sets the first radius
   * @param objHeight  The object's height. If the object is an ellipse, this sets the second radius
   * @param fillColor  The object's color
   * @return A new GameObject instance
   */
   TextObject(float xPos, float yPos, color fillColor, String[] text){
     this.objType= "rectangle";
     this.xPos = xPos;
     this.yPos = yPos;
     this.fillColor = fillColor;

     this.text = text;
     this.objWidth = textWidth(this.text[currentLanguage]);
   }

  /*
   * Collision detection for a text object, which are never collidable
   *
   * @return No collision: 0
   */
   @Override
   int collisionDetection(Player p){
     return 0;
   }
   
  /*
   * Resizes the object's text according to current window dimensions
   *
   * @return None
   */
   void resize(){
     if (useSmallLayout){
       textFont = createFont("data/fonts/Swansea-q3pd.ttf", floor(height/12), true);
     }
     else{
       textFont = createFont("data/fonts/Swansea-q3pd.ttf", floor(height/25), true);
     }
   }
   
   
   
/***************************************************************************************************************************************************
 *  VIEW
 ***************************************************************************************************************************************************
 */
   
   
  /*
   * Draws up the text object 
   *
   * @return None
   */
   @Override
   void drawMe(){
     pushStyle();

     noStroke();
     rectMode(CENTER);
     fill(this.fillColor);
     textFont(textFont);
     
     rect(this.xPos, this.yPos, this.objWidth, this.objHeight);
     
     textLeading(35);
     text(this.text[currentLanguage], this.xPos, this.yPos);

    popStyle();
   }
}
