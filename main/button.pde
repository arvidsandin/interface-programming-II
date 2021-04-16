/*
 * A class for creating buttons that have responsive resizing and appearance
 */
class Button {
  int ID;
  
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
     * @param ID          The button's ID
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
     * @param backgroundImage    The background image of the button
     * @return A new Button object
     */
    Button(int ID, String btnText, color btnTextColor, PFont textFont,  float xpos, float ypos, float btnWidth, float btnHeight, int btnRounding, color btnColor, color btnBorderColor, PImage backgroundImage){
      this.ID = ID;
      
      this.btnText = btnText;
      this.btnTextColor = btnTextColor;
      this.textFont = textFont;
      
      this.xpos = xpos;
      this.ypos = ypos;
      
      this.btnWidth = btnWidth;
      this.btnHeight = btnHeight;
  
     
      this.btnRounding = btnRounding;
      this.btnColor = btnColor;
      this.btnBorderColor = btnBorderColor;
      this.backgroundImage = backgroundImage;
    }
     /*
     * Constructor with position, dimensions, colors and ID set for Button class. 
     *
     * @param ID    The button's ID
     * @param btnText    The button's text
     * @param btnTextColor    The button text's color
     * @param textFont      The button text's font
     * @param xpos    The button's x position, relative to its upper left corner
     * @param ypos    The button's y position, relative to its upper left corner
     * @param btnWidth    The button's width
     * @param btnHeight    The button's height
     * @param btnColor    The button's color
     * @param btnBorderColor    The button border's color
     * @return A new Button object
     */
    Button(int ID, String btnText, color btnTextColor, PFont textFont, float xpos, float ypos, float btnWidth, float btnHeight, color btnColor, color btnBorderColor){
      this.ID = ID;
      
      this.btnText = btnText;
      this.btnTextColor = btnTextColor;
      this.textFont = textFont;
      
      this.xpos = xpos;
      this.ypos = ypos;
      
      this.btnWidth = btnWidth;
      this.btnHeight = btnHeight;
     
      this.btnColor = btnColor;
      this.btnBorderColor = btnBorderColor;
    }
    
    
    /*
     * Constructor with minimal set of attributes set for Button class
     *
     * @param ID    The button's ID
     * @param btnText    The button's text
     * @param xpos    The button's x position, relative to its upper left corner
     * @param ypos    The button's y position, relative to its upper left corner
     * @param btnColor    The button's color
     * @param btnBorderColor    The button border's color
     * @return A new Button object
     */
    Button(int ID, String btnText, float xpos, float ypos, color btnColor, color btnBorderColor){
      this.ID = ID;
      this.btnText = btnText;
      
      this.xpos = xpos;
      this.ypos = ypos;
      
      this.btnWidth = windowWidth / 4;
      this.btnHeight = windowHeight / 15;
     
      this.btnColor = btnColor;
      this.btnBorderColor = btnBorderColor;
    }
    
    /*
     * Draws up the button and the text it contains
     * 
     * @return None
     */
    void drawMe(){
     float xMidPoint = this.xpos + this.btnWidth/2;
     float yMidPoint = this.ypos + this.btnHeight/2;
     
     int quadOffset = 60;
     
     strokeWeight(2);
     stroke(this.btnBorderColor);
     line(0, yMidPoint, xMidPoint, yMidPoint);
     
    
     /*Corners in a parallelogram are created clockwise
          1------2
           \ (x,y)\
            4------3 (x + xwidth, y + ywidth)
     */
     float xCorner3 = this.xpos + this.btnWidth;
     float yCorner3 = this.ypos + this.btnHeight;
     
     float xCorner2 = xCorner3 - quadOffset;
     float yCorner2 = this.ypos;
     
     float xCorner4 = this.xpos + quadOffset;
     float yCorner4 =yCorner3;
     
     fill(this.btnColor);
     quad(this.xpos, this.ypos, xCorner2, yCorner2, xCorner3, yCorner3, xCorner4, yCorner4);
     
     this.drawBtnText();
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
       pushStyle();
        
       textFont(this.textFont);
       fill(this.btnTextColor);
       text(this.btnText, xTxtCenter, yTxtCenter);
         
       popStyle();
     }
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
    



//btnIsPressed function?

}
