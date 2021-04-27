/*
 * A class for creating buttons that have responsive resizing and appearance
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
  PFont textFont = createFont("Arial Bold", 22, true);

  float xpos;
  float ypos;

  float btnWidth;
  float btnHeight;

  int btnRounding = 0;

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
     * @param xpos      The button's x position, relative to its upper left corner
     * @param ypos      The button's y position, relative to its upper left corner
     * @param btnWidth    The button's width
     * @param btnHeight    The button's height
     * @param btnRounding      The amount of rounding the button's corners should have
     * @param btnColor      The button's color
     * @param btnBorderColor      The button border's color
     * @param quadOffset      Amount of right-sided slant on the button
     * @param backgroundImage    Path to the background image of the button
     *
     * @return A new Button object
     */
    Button(int ID, boolean withLine, boolean animateBtn, String btnText, color btnTextColor, PFont textFont,  float xpos, float ypos, float btnWidth, float btnHeight, int btnRounding, color btnColor, float quadOffset, color btnBorderColor, String backgroundImage){
      this.ID = ID;

      this.withLine = withLine;
      this.animateBtn = animateBtn;

      this.btnText = btnText;
      this.btnTextColor = btnTextColor;
      this.textFont = textFont;

      this.xpos = xpos;
      this.ypos = ypos;

      this.btnWidth = btnWidth;
      this.btnHeight = btnHeight;

      this.animHeightUp = this.btnHeight/ 2;
      this.animHeightDown = this.animHeightUp;

      this.btnRounding = btnRounding;
      this.btnColor = btnColor;
      this.btnBorderColor = btnBorderColor;
      this.backgroundImage = loadImage(backgroundImage);
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
     * @param xpos    The button's x position, relative to its upper left corner
     * @param ypos    The button's y position, relative to its upper left corner
     * @param btnWidth    The button's width
     * @param btnHeight    The button's height
     * @param btnColor    The button's color
     * @param btnBorderColor    The button border's color
     *
     * @return A new Button object
     */
    Button(int ID, boolean withLine, String btnText, color btnTextColor, PFont textFont, float xpos, float ypos, float btnWidth, float btnHeight, color btnColor, color btnBorderColor){
      this.ID = ID;

      this.withLine = withLine;

      this.btnText = btnText;
      this.btnTextColor = btnTextColor;
      this.textFont = textFont;

      this.xpos = xpos;
      this.ypos = ypos;

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
    }

    /*
     * Constructor with minimal set of attributes set for Button class
     *
     * @param ID    The button's ID. Not guaranteed to be unique
     * @param withLine          Whether the button should have a line to the edge of the screen's left side
     * @param btnText    The button's text
     * @param xpos    The button's x position, relative to its upper left corner
     * @param ypos    The button's y position, relative to its upper left corner
     * @param btnColor    The button's color
     * @param btnBorderColor    The button border's color
     *
     * @return A new Button object
     */
    Button(int ID, boolean withLine, String btnText, float xpos, float ypos, color btnColor, color btnBorderColor){
      this.ID = ID;

      this.withLine = withLine;

      this.btnText = btnText;

      this.xpos = xpos;
      this.ypos = ypos;

      this.btnWidth = width / 4;
      this.btnHeight = height / 12;

      this.animHeightUp = this.btnHeight/ 2;
      this.animHeightDown = this.animHeightUp;

      this.btnColor = btnColor;
      this.btnBorderColor = btnBorderColor;
    }
    /*
     * Constructor with buttons dimensions, text, color, and animation or line for Button object, plus a background image and quadOffset
     *
     * @param ID    The button's ID. Not guaranteed to be unique
     * @param withLine          Whether the button should have a line to the edge of the screen's left side
     * @param animateBtn    States whether the button should have animated height
     * @param btnText    The button's text
     * @param xpos    The button's x position, relative to its upper left corner
     * @param ypos    The button's y position, relative to its upper left corner
     * @param btnWidth    The button's width
     * @param btnHeight    The button's height
     * @param btnColor    The button's color
     * @param btnBorderColor    The button border's color
     * @param quadOffset      Amount of right-sided slant on the button
     * @param backgroundImage    Path to the background image of the button
     *
     * @return A new Button object
     */
    Button(int ID, boolean withLine, boolean animateBtn, String btnText, float xpos, float ypos, float btnWidth, float btnHeight, color btnColor, color btnBorderColor, float quadOffset, String backgroundImage){
      this.ID = ID;

      this.withLine = withLine;
      this.animateBtn = animateBtn;

      this.btnText = btnText;

      this.xpos = xpos;
      this.ypos = ypos;

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
      this.backgroundImage = loadImage(backgroundImage);
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
     * Draws up the button and the text it contains
     *
     * @return None
     */
    void drawMe(){
     pushStyle();

     this.drawBtnLine();
     /*Corners in a parallelogram are created clockwise
        (x,y) 1------2
               \      \
                4------3 (x + xwidth, y + ywidth)

       To determine animation direction, the animation variables must decrease in value
       to let both upper half go "higher up" and lower half go "lower down"
     */
     float yCorner1 = this.ypos + this.animHeightUp;

     float xCorner2 = this.xpos + this.btnWidth - this.quadOffset;
     float yCorner2 = yCorner1;

     float xCorner3 = xCorner2 + this.quadOffset;
     float yCorner3 = this.ypos + this.btnHeight - this.animHeightDown;

     float yCorner4 =yCorner3;
     float xCorner4 = this.xpos + this.quadOffset;

     fill(this.btnColor);
     quad(this.xpos, yCorner1, xCorner2, yCorner2, xCorner3, yCorner3, xCorner4, yCorner4);

     this.drawBtnText();
     this.drawBackgroundImage();
     popStyle();
    }

    /*
     * Draws up the button line to a button
     *
     * @return None
     */
    void drawBtnLine(){
     float xStrokeLen = this.xpos + this.btnWidth - this.quadOffset/2 -1;
     float yStrokeLen = this.ypos + this.btnHeight/2;

     stroke(this.btnBorderColor);

     if(this.withLine != false){
       strokeWeight(2);
       line(0, yStrokeLen, xStrokeLen, yStrokeLen);
     }
    }

    /*
     * Draws up the button text
     *
     * @return None
     */
    void drawBtnText(){
     float xTxtCenter = this.xpos + this.btnWidth/2;
     float yTxtCenter = this.ypos + (this.btnHeight/3) *2;

     if(btnText != null){

       textFont(this.textFont);
       fill(this.btnTextColor);
       text(this.btnText, xTxtCenter, yTxtCenter);
     }
    }

    void drawBackgroundImage(){
      if(this.backgroundImage != null){
         image(this.backgroundImage, this.xpos, this.ypos, this.btnWidth, this.btnHeight);
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

      return (
          //inside inside the biggest rectangle the button fits in
          x >= xpos && x <= xpos+this.btnWidth+this.quadOffset &&
          y >= ypos && y <= ypos+btnHeight &&
          //inside left triangle
          y <= this.btnHeight/this.quadOffset*x + this.ypos-(this.btnHeight/this.quadOffset*this.xpos) &&
          //inside right triangle
          y >= this.btnHeight/this.quadOffset*x + (this.ypos)-(this.btnHeight/this.quadOffset*(this.xpos+this.btnWidth-this.quadOffset))
          );
    }


    /*
     * Sets a new font value to the text of the button object
     *
     * @param font   The new font for the button's text
     * @return None
     */
    void changeBtnTextFont(PFont font){
     this.textFont = font;
    }

    /*
     * Sets a new color value to the text of button object
     *
     * @param btnColor   The new color for the button's text
     * @return None
     */
    void changeBtnTextColor(color btnColor){
     this.btnTextColor = btnColor;
    }

    /*
     * Sets a new color value to the background of the button object
     *
     * @param newColor   The new color for the button's background
     * @return None
     */
    void changeButtonColor(color newColor){
      this.btnColor = newColor;
    }

    int getID(){
     return this.ID;
    }

    /*
     * gives value of quadOffset
     *
     * @return quadOffset
     */
    float getQuadOffset(){
      return this.quadOffset;
    }



//btnIsPressed function?

}
