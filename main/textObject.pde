class TextObject extends GameObject{
  String[] text;
  PFont textFont = createFont("data/fonts/Swansea-q3pd.ttf", floor(height/25), true);
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

     this.xMove = xMove;
     this.yMove = yMove;
     this.text = text;
     this.objWidth = textWidth(this.text[currentLanguage]);
   }

   int collisionDetection(Player p){
     return 0;
   }

   void drawMe(){
     pushStyle();

     noStroke();
     rectMode(CENTER);
     fill(this.fillColor);

     rect(this.xPos, this.yPos, this.objWidth, this.objHeight);
     textFont(this.textFont);
     fill(this.fillColor);
     if (useSmallLayout){
       textSize(floor(height/10));
     }
     textLeading(30);
     text(this.text[currentLanguage], this.xPos, this.yPos);

    popStyle();
   }
}
