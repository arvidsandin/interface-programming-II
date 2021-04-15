/*

*/
class Button {
  int ID;
  
  String btnText;
  PFont textFont = createFont("Arial Bold", 16, true);
  
  float xpos;
  float ypos;
  float btnWidth;
  float btnHeight;
  
  int btnRounding;
  color btnColor;
  color btnBorder;
  PImage backgroundImage;


/*

*/
Button(int ID, String btnText, PFont textFont, float xpos, float ypos, float btnWidth, float btnHeight, int btnRounding, color btnColor, color btnBorder, PImage backgroundImage){
  this.ID = ID;
  
  this.btnText = btnText;
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
  
  this.btnWidth = 300;
  this.btnHeight = 40;
 
  this.btnColor = btnColor;
  this.btnBorder = btnBorder;
}

/*

*/
void drawMe(){
 float xMidPoint = this.xpos + this.btnWidth/2;
 float yMidPoint = this.ypos + this.btnHeight/2;
 
 strokeWeight(2);
 stroke(this.btnBorder);
 line(0, yMidPoint, xMidPoint, yMidPoint);
 
 
 int quadOffset = 60;
 /*Corners in a parallelogram are created clockwise
 (x,y)1------2
       \      \
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
}

/*

*/
void drawBtnText(PFont f, color fontColor){
 float xMidPoint = this.xpos + this.btnWidth/2;
 float yMidPoint = this.ypos + this.btnHeight/2;
  
  if(f == null){
    textFont(this.textFont);
  }
  else{
    textFont(f);
  }
  
  pushStyle();
  if(fontColor != -1){
    fill(fontColor);
    text(this.btnText, xMidPoint, yMidPoint);
  }
  else{
   fill(0);
   text(this.btnText, xMidPoint, yMidPoint + 5); 
  }
  
  popStyle();
}
 
/*

*/
void changeButtonColor(color newColor){
  this.btnColor = newColor;
}



//btnIsPressed function?

}
