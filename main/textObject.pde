class TextObject extends GameObject{
  String[] text;
  /*
   * Creates a TextObject with a given color
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
   TextObject(float xPos, float yPos, float xMove, float yMove, color fillColor, String[] text){
     this.objType= "rectangle";
     this.xPos = xPos;
     this.yPos = yPos;
     this.fillColor = fillColor;

     this.objWidth = objWidth;
     this.objHeight = objHeight;

     this.xMove = xMove;
     this.yMove = yMove;
     this.text = text;
   }

   int collisionDetection(Player p){
     return 0;
   }

   void drawMe(){
     pushStyle();

     noStroke();
     rectMode(CENTER);
     textMode(CENTER);
     fill(this.fillColor);

     rect(this.xPos, this.yPos, this.objWidth, this.objHeight);
     text(this.text[currentLanguage], this.xPos, this.yPos);

    popStyle();
   }
}
