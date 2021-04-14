/*

*/
class Button {
  
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
Button(float xpos, float ypos, float btnWidth, float btnHeight, int btnRounding, color btnColor, color btnBorder, PImage backgroundImage){
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
Button(float xpos, float ypos, float btnWidth, float btnHeight, int btnRounding, color btnColor, color btnBorder){
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
Button(float xpos, float ypos, float btnWidth, float btnHeight, int btnRounding, color btnColor){
  this.xpos = xpos;
  this.ypos = ypos;
  
  this.btnWidth = btnWidth;
  this.btnHeight = btnHeight;
  
  this.btnRounding = btnRounding;
  this.btnColor = btnColor;
}

/*

*/
void drawMe(){
 fill(this.btnColor);
 rect(this.xpos, this.ypos, this.btnWidth, this.btnHeight, this.btnRounding);

  stroke(this.btnBorder); 
 }
 
/*

*/
void changeButtonColor(color newColor){
  this.btnColor = newColor;
}

}
