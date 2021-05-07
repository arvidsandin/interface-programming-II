/*
 * A class for creating 2D buttons that are capable of responsive resizing and appearance
 */
class Button {
  int ID;

  boolean withLine = false;
  boolean animateBtn = true;
  float quadOffset = 60;

  private float animHeightUp;
  private float animHeightDown;

  String btnText;
  color btnTextColor = color(0, 0, 0);
  PFont textFont = createFont("data/fonts/good times rg.ttf", floor(height/25), true);

  float xPos;
  float yPos;

  float btnWidth;
  float btnHeight;

  color btnColor;
  color btnBorderColor;
  PImage backgroundImage = null;


    /*
     * Constructor to set all attributes of Button class
     *
     * @param ID          The button's ID. Not guaranteed to be unique
     * @param withLine          Whether the button should have a line to the edge of the screen's left side
     * @param animateBtn    States whether the button should have animated height
     * @param btnText      The button's text
     * @param btnTextColor    The button text's color
     * @param textFont      The button text's font
     * @param xPos      The button's x position, relative to its upper left corner
     * @param yPos      The button's y position, relative to its upper left corner
     * @param btnWidth    The button's width
     * @param btnHeight    The button's height
     * @param btnColor      The button's color
     * @param btnBorderColor      The button border's color
     * @param quadOffset      Amount of right-sided slant on the button
     * @param backgroundImage    Path to the background image of the button, relative to the sketch
     *
     * @return A new Button object
     */
    Button(int ID, boolean withLine, boolean animateBtn, String btnText, color btnTextColor, PFont textFont,  float xPos, float yPos, float btnWidth, float btnHeight, color btnColor, float quadOffset, color btnBorderColor, String backgroundImage){
      this.ID = ID;
      this.quadOffset = quadOffset;

      this.withLine = withLine;
      this.animateBtn = animateBtn;

      this.btnText = btnText;
      this.btnTextColor = btnTextColor;
      this.textFont = textFont;

      this.xPos = xPos;
      this.yPos = yPos;

      this.btnWidth = btnWidth;
      this.btnHeight = btnHeight;

      this.animHeightUp = this.btnHeight/ 2;
      this.animHeightDown = this.animHeightUp;

      this.btnColor = btnColor;
      this.btnBorderColor = btnBorderColor;
      if(backgroundImage != null){
        this.backgroundImage = loadImage(backgroundImage);
      }
    }

    /*
     * Constructor with buttons dimensions, text, color, and animation or line for Button object, plus a background image and quadOffset
     *
     * @param ID    The button's ID. Not guaranteed to be unique
     * @param withLine          Whether the button should have a line to the edge of the screen's left side
     * @param animateBtn    States whether the button should have animated height
     * @param btnText    The button's text
     * @param xPos    The button's x position, relative to its upper left corner
     * @param yPos    The button's y position, relative to its upper left corner
     * @param btnWidth    The button's width
     * @param btnHeight    The button's height
     * @param btnColor    The button's color
     * @param btnBorderColor    The button border's color
     * @param quadOffset      Amount of right-sided slant on the button
     * @param backgroundImage    Path to the background image of the button, relative to the sketch
     *
     * @return A new Button object
     */
    Button(int ID, boolean withLine, boolean animateBtn, String btnText, float xPos, float yPos, float btnWidth, float btnHeight, color btnColor, color btnBorderColor, float quadOffset, String backgroundImage){
      this.ID = ID;

      this.withLine = withLine;
      this.animateBtn = animateBtn;

      this.btnText = btnText;

      this.xPos = xPos;
      this.yPos = yPos;

      this.btnWidth = btnWidth;
      this.btnHeight = btnHeight;

      if(animateBtn){
        this.animHeightUp = this.btnHeight/ 2;
        this.animHeightDown = this.animHeightUp;
      }
      else{
        this.animHeightUp = 0;
        this.animHeightDown = 0;
      }

      this.btnColor = btnColor;
      this.btnBorderColor = btnBorderColor;

      this.quadOffset = quadOffset;
      if(backgroundImage != null){
        this.backgroundImage = loadImage(backgroundImage);
      }
    }


     /*
     * Constructor with position, dimensions, colors, fonts and ID for Button class.
     *
     * @param ID    The button's ID. Not guaranteed to be unique
     * @param withLine          Whether the button should have a line to the edge of the screen's left side
     * @param animateBtn    States whether the button should have animated height
     * @param btnText    The button's text
     * @param btnTextColor    The button text's color
     * @param textFont      The button text's font
     * @param xPos    The button's x position, relative to its upper left corner
     * @param yPos    The button's y position, relative to its upper left corner
     * @param btnWidth    The button's width
     * @param btnHeight    The button's height
     * @param btnColor    The button's color
     * @param btnBorderColor    The button border's color
     *
     * @return A new Button object
     */
    Button(int ID, boolean withLine, boolean animateBtn, String btnText, color btnTextColor, PFont textFont, float xPos, float yPos, float btnWidth, float btnHeight, color btnColor, color btnBorderColor){
      this.ID = ID;

      this.withLine = withLine;
      this.animateBtn = animateBtn;

      this.btnText = btnText;
      this.btnTextColor = btnTextColor;
      this.textFont = textFont;

      this.xPos = xPos;
      this.yPos = yPos;

      this.btnWidth = btnWidth;
      this.btnHeight = btnHeight;

      setAnimation(animateBtn);

      this.btnColor = btnColor;
      this.btnBorderColor = btnBorderColor;
    }

    /*
     * Constructor with minimal set of attributes set for Button class
     *
     * @param ID    The button's ID. Not guaranteed to be unique
     * @param withLine          Whether the button should have a line to the edge of the screen's left side
     * @param animateBtn    States whether the button should have animated height
     * @param btnText    The button's text
     * @param xPos    The button's x position, relative to its upper left corner
     * @param yPos    The button's y position, relative to its upper left corner
     * @param btnColor    The button's color
     * @param btnBorderColor    The button border's color
     *
     * @return A new Button object
     */
    Button(int ID, boolean withLine, String btnText, float xPos, float yPos, color btnColor, color btnBorderColor){
      this.ID = ID;

      this.withLine = withLine;

      this.btnText = btnText;

      this.xPos = xPos;
      this.yPos = yPos;

      this.btnWidth = width / 3;
      this.btnHeight = height / 12;

      this.animHeightUp = this.btnHeight/ 2;
      this.animHeightDown = this.animHeightUp;

      this.btnColor = btnColor;
      this.btnBorderColor = btnBorderColor;
    }

     /*
     * Animates the button from line width to full button width
     *
     * @return None
     */
     void moveMe(){
       if(!this.animateBtn){
        return;
       }

      if(this.isInside()){

         if(this.animHeightDown > 0  && this.animHeightUp > 0){
           this.animHeightDown -= 4;
           this.animHeightUp -= 4;
         }
       }
      else{
           if(this.animHeightDown < this.btnHeight/2 && this.animHeightUp < this.btnHeight/2){
             this.animHeightDown += 2;
             this.animHeightUp += 2;
           }
         }
     }
     
    /*
     * Check if a point is inside button
     *
     * @param x  x-value of point
     * @param y  y-value of point
     * @return is point inside the button
    */
    boolean isInside(){
      int x = mouseX;
      int y = mouseY;

      //Check if button is a rectangle
      if(this.quadOffset == 0){

       return (x >= xPos && x <= xPos+this.btnWidth  && y >= yPos && y <= yPos+this.btnHeight);
      }

     return (
          //inside inside the biggest rectangle the button fits in
          x >= xPos && x <= xPos+this.btnWidth+this.quadOffset &&
          y >= yPos && y <= yPos+btnHeight &&
          //inside left triangle
          y <= this.btnHeight/this.quadOffset*x + this.yPos-(this.btnHeight/this.quadOffset*this.xPos) &&
          //inside right triangle
          y >= this.btnHeight/this.quadOffset*x + (this.yPos)-(this.btnHeight/this.quadOffset*(this.xPos+this.btnWidth-this.quadOffset))
          );
    }


    /*
     * Sets another string to the text of the button object
     *
     * @param text   The new text for the button
     * @return None
     */
    void setBtnText(String text){
     this.btnText = text;
    }

    /*
     * Sets a new font value to the text of the button object
     *
     * @param font   The new font for the button's text
     * @return None
     */
    void setBtnTextFont(PFont font){
     this.textFont = font;
    }

    /*
     * Sets a new color value to the text of button object
     *
     * @param btnColor   The new color for the button's text
     * @return None
     */
    void setBtnTextColor(color btnColor){
     this.btnTextColor = btnColor;
    }

    /*
     * Sets a new color value to the background of the button object
     *
     * @param newColor   The new color for the button's background
     * @return None
     */
    void setBtnColor(color newColor){
      this.btnColor = newColor;
    }
    
    /*
     * Sets the width and height of the button
     *
     * @return None
     */
    void setBtnDimensions(float btnWidth, float btnHeight){
      this.btnWidth = btnWidth;
      this.btnHeight = btnHeight;
    }
    /*
     * Sets the (x,y)-position of the button. Corresponds to upper left corner
     *
     * @return None
     */
    void setBtnPosition(float xPos, float yPos){
      this.xPos = xPos;
      this.yPos = yPos;
    }
    
    /*
     * Sets whether button should have a vertical animation
     *
     * @return None
     */
    void setAnimation(boolean animate){
      this.animateBtn = animate;
      
      if(animateBtn){
        this.animHeightUp = this.btnHeight/ 2;
        this.animHeightDown = this.animHeightUp;
      }
      else{
        this.animHeightUp = 0;
        this.animHeightDown = 0;
      }
    }
    
    /*
     * Sets the value of quadOffset; how angled the parallelogram will be
     *
     * @return quadOffset
     */
    void setQuadOffset(float quadOffset){
      this.quadOffset = quadOffset;
    }
    
    /*
     * Returns the value of the button ID
     *
     * @return quadOffset
     */
    float getBtnHeight(){
      return this.btnHeight;
    }
    /*
     * Returns the value of the button ID
     *
     * @return quadOffset
     */
    float getBtnWidth(){
      return this.btnWidth;
    }
    
    /*
     * Returns the value of the button ID
     *
     * @return quadOffset
     */
    int getID(){
     return this.ID;
    }

    /*
     * Returns the value of quadOffset
     *
     * @return quadOffset
     */
    float getQuadOffset(){
      return this.quadOffset;
    }
    
  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */
    
    /*
     * Draws up the button and the text it contains
     *
     * @return None
     */
    void drawMe(){
     pushStyle();
     strokeWeight(2);

     this.drawBtnLine();

     this.drawBtnShape();

     this.drawBtnText();
     this.drawBackgroundImage();
     popStyle();
    }

    /*
     * Draws up the button shape in the form of a parallelogram
     *
     * @return None
     */
    void drawBtnShape(){
     /*Corners in a parallelogram are created clockwise
        (x,y) 1------2
               \      \
                4------3 (x + xwidth, y + ywidth)

       To determine animation direction, the animation variables must decrease in value
       to let both upper half go "higher up" and lower half go "lower down"
     */
     float yCorner1 = this.yPos + this.animHeightUp;

     float xCorner2 = this.xPos + this.btnWidth - this.quadOffset;
     float yCorner2 = yCorner1;

     float xCorner3 = xCorner2 + this.quadOffset;
     float yCorner3 = this.yPos + this.btnHeight - this.animHeightDown;

     float yCorner4 =yCorner3;
     float xCorner4 = this.xPos + this.quadOffset;

     fill(this.btnColor);
     quad(this.xPos, yCorner1, xCorner2, yCorner2, xCorner3, yCorner3, xCorner4, yCorner4);

    }


    /*
     * Draws up the button line to a button
     *
     * @return None
     */
    void drawBtnLine(){
     float xStrokeLen = this.xPos + this.btnWidth - this.quadOffset/2 -1;
     float yStrokeLen = this.yPos + this.btnHeight/2;

     stroke(this.btnBorderColor);

     if(this.withLine != false){
       line(0, yStrokeLen, xStrokeLen, yStrokeLen);
     }
    }

    /*
     * Draws up the button text
     *
     * @return None
     */
    void drawBtnText(){
     float xTxtCenter = this.xPos + this.btnWidth/2;
     float yTxtCenter = this.yPos + (this.btnHeight/3) *1.95;

     if(btnText != null){

       textFont(this.textFont);
       fill(this.btnTextColor);
       text(this.btnText, xTxtCenter, yTxtCenter);
     }
    }

    /*
     * Draws up the background image to a button. Disregards any quadOffset.
     *
     * @return None
     */
    void drawBackgroundImage(){

      if(this.backgroundImage != null){
        image(this.backgroundImage, this.xPos, this.yPos, this.btnWidth, this.btnHeight);
      }
    }
}
