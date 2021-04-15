/*

*/
class Button {
  int ID;
  
  String btnText;
  color btnTextColor = color(0, 0, 0);
  PFont textFont = createFont("Arial Bold", 20, true);
  
  float xpos;
  float ypos;
  
  float btnWidth;
  float btnHeight;
  
  float  btnWindowWidth = 1200;
  float  btnWindowHeight = 600;
  
  int btnRounding;
  color btnColor;
  color btnBorder;
  PImage backgroundImage;


/*

*/
Button(int ID, String btnText, PFont textFont, color btnTextColor, float xpos, float ypos, float btnWidth, float btnHeight, float  btnWindowWidth, float  btnWindowHeight, int btnRounding, color btnColor, color btnBorder, PImage backgroundImage){
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
  this.btnBorder = btnBorder;
  this.backgroundImage = backgroundImage;
}

/*

*/
Button(int ID, String btnText, float xpos, float ypos, float btnWidth, float btnHeight, int btnRounding, color btnColor, color btnBorder){
  this.ID = ID;
  
  this.btnText = btnText;
  
  this.xpos = xpos;
  this.ypos = ypos;
  
  this.btnWidth = btnWidth;
  this.btnHeight = btnHeight;
 
  this.btnRounding = btnRounding;
  this.btnColor = btnColor;
  this.btnBorder = btnBorder;
}

/*

*/
Button(int ID, String btnText, float xpos, float ypos, float btnWidth, float btnHeight, int btnRounding, color btnColor){
  this.ID = ID;
  
  this.btnText = btnText;
  
  this.xpos = xpos;
  this.ypos = ypos;
  
  this.btnWidth = btnWidth;
  this.btnHeight = btnHeight;
  
  this.btnRounding = btnRounding;
  this.btnColor = btnColor;
}

/*

*/
Button(int ID, String btnText, float xpos, float ypos, color btnColor, color btnBorder){
  this.ID = ID;
  this.btnText = btnText;
  
  this.xpos = xpos;
  this.ypos = ypos;
  
  this.btnWidth = this.btnWindowWidth / 4;
  this.btnHeight = this.btnWindowHeight / 15;
 
  this.btnColor = btnColor;
  this.btnBorder = btnBorder;
}

/*

*/
void drawMe(){
 float xMidPoint = this.xpos + this.btnWidth/2;
 float yMidPoint = this.ypos + this.btnHeight/2;
 
 int quadOffset = 60;
 
 strokeWeight(2);
 stroke(this.btnBorder);
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

*/
void drawBtnText(){
 float xMidPoint = this.xpos + this.btnWidth/2;
 float yMidPoint = this.ypos + this.btnHeight/2;

 if(btnText != null){
   pushStyle();
    
   textFont(this.textFont);
   fill(this.btnTextColor);
   text(this.btnText, xMidPoint, yMidPoint +5);
     
   popStyle();
 }
}

/*

*/
void changeBtnTextFont(PFont f){
 this.textFont = f;
}

/*

*/
void changeBtnTextColor(color btnColor){
 this.btnTextColor = btnColor;
}
 
/*

*/
void changeButtonColor(color newColor){
  this.btnColor = newColor;
}



//btnIsPressed function?

}
