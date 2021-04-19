/*
 * A class for creating buttons that have responsive resizing and appearance
 */
class Button {
  int ID;
  
  boolean withLine = false;
  float quadOffset = 30;
  
  private float animWidth = 2;
  private float animHeight = 2;
  private boolean isHovering = false;
  
  String btnText;
  color btnTextColor = color(0, 0, 0);
  PFont textFont = createFont("Arial Bold", 22, true);
  
  float xpos;
  float ypos;
  
  float btnWidth;
  float btnHeight;
<<<<<<< HEAD

  int btnRounding = 0;
=======
  
  int quadOffset = 60;
  
  float  btnWindowWidth = 1200;
  float  btnWindowHeight = 600;
  
  int btnRounding;
>>>>>>> origin/mouse-input
  color btnColor;
  color btnBorderColor;
  PImage backgroundImage = null;


<<<<<<< HEAD
    /*
     * Constructor to set all attributes of Button class
     *
     * @param ID          The button's ID
     * @param withLine          Whether the button should have a line to the edge of the screen's left side
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
    Button(int ID, boolean withLine, String btnText, color btnTextColor, PFont textFont,  float xpos, float ypos, float btnWidth, float btnHeight, int btnRounding, color btnColor, color btnBorderColor, PImage backgroundImage){
      this.ID = ID;
      
      this.withLine = withLine;
      
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
     * @param withLine          Whether the button should have a line to the edge of the screen's left side
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
     
      this.btnColor = btnColor;
      this.btnBorderColor = btnBorderColor;
    }
    
=======
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
 * @param btnWindowWidth    The width of the window containing the button
 * @param btnWindowHeight    The height of the window containing the button
 * @param btnRounding      The amount of rounding the button's corners should have
 * @param btnColor      The button's color
 * @param btnBorderColor      The button border's color
 * @param backgroundImage    The background image of the button
 * @return A new Button object
 */
Button(int ID, String btnText, color btnTextColor, PFont textFont,  float xpos, float ypos, float btnWidth, float btnHeight, float  btnWindowWidth, float  btnWindowHeight, int quadOffset, int btnRounding, color btnColor, color btnBorderColor, PImage backgroundImage){
  this.ID = ID;
  
  this.btnText = btnText;
  this.btnTextColor = btnTextColor;
  this.textFont = textFont;
  
  this.xpos = xpos;
  this.ypos = ypos;
  
  this.btnWidth = btnWidth;
  this.btnHeight = btnHeight;
  this.quadOffset = quadOffset;
  
  this.btnWindowWidth = btnWindowWidth;
  this.btnWindowHeight = btnWindowHeight;
 
  this.btnRounding = btnRounding;
  this.btnColor = btnColor;
  this.btnBorderColor = btnBorderColor;
  this.backgroundImage = backgroundImage;
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
  
  this.btnWidth = this.btnWindowWidth / 4;
  this.btnHeight = this.btnWindowHeight / 15;
 
  this.btnColor = btnColor;
  this.btnBorderColor = btnBorderColor;
}

/*
 * gives value of quadOffset
 * 
 * @return quadOffset
 */
int getQuadOffset(){
  return this.quadOffset;
}

/*
 * Draws up the button and the text it contains
 * 
 * @return None
 */
void drawMe(){
 float xMidPoint = this.xpos + this.btnWidth/2;
 float yMidPoint = this.ypos + this.btnHeight/2;
 
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
>>>>>>> origin/mouse-input
    
    /*
     * Constructor with minimal set of attributes set for Button class
     *
     * @param ID    The button's ID
     * @param withLine          Whether the button should have a line to the edge of the screen's left side
     * @param btnText    The button's text
     * @param xpos    The button's x position, relative to its upper left corner
     * @param ypos    The button's y position, relative to its upper left corner
     * @param btnColor    The button's color
     * @param btnBorderColor    The button border's color
     * @return A new Button object
     */
    Button(int ID, boolean withLine, String btnText, float xpos, float ypos, color btnColor, color btnBorderColor){
      this.ID = ID;
      
      this.withLine = withLine;
      
      this.btnText = btnText;
      
      this.xpos = xpos;
      this.ypos = ypos;
      
      this.btnWidth = windowWidth / 4;
      this.btnHeight = windowHeight / 15;
     
<<<<<<< HEAD
      this.btnColor = btnColor;
      this.btnBorderColor = btnBorderColor;
    }
    
     /*
     * Determines if mouse click should lead to button event
     * 
     * @return boolean value indicating if mouse click was on button
     */
    boolean isPressed(){
      
      return false;
    }
    
     /*
     * Animates the button between line width and full button width
     * 
     * @return None
     */
     void moveMe(){
     if(this.isHovering){
       
       if(this.animWidth < this.btnWidth){
         this.animWidth += 5;
       }
       
       if(this.animHeight < this.btnHeight){
         this.animHeight += 5;
       }
     }
     
     
       
       
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
     
     pushStyle();
     stroke(this.btnBorderColor);
     
     
     if(this.withLine != false){
       strokeWeight(2);
       line(0, yMidPoint, xMidPoint, yMidPoint);
     }
     
    
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
     popStyle();
     
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
    
    void causeEvent(){
      
    }
    
    boolean isInside(){
      return false;
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
    
=======
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

/*
 * Check if a point is inside button
 *
 * @param x  x-value of point
 * @param y  y-value of point
 * @return is point inside the button
*/
boolean isInside(int x, int y){
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
 * Sets the window height and width attributes stored in the button to new values
 *
 * @param newWindowWidth    The new height of the window containing the button
 * @param newWindowHeight    The new width of the window containing the button
 * @return None
 */
void resizeWindowDimensions(int newWindowWidth, int newWindowHeight){
  this.btnWindowWidth = newWindowWidth;
  this.btnWindowHeight = newWindowHeight;
}

>>>>>>> origin/mouse-input



//btnIsPressed function?

}
