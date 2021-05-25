
/*
 * A class for the home button visible during a game, that brings up a menu
 *
 */
class HomeButton extends Button{
  
  String homeButtonPath  = "data/menu_images/home_button.png";
  
  HomeButton(){
    super(0, false, false, "", width/75, height/75, width/20, height/10, color(255), "data/menu_images/home_button.png");
  }
  
  boolean isInside(){
    float x = rescaleByWidth(mouseX);
    float y = rescaleByHeight(mouseY);
    if( x >= rescaleByWidth(this.xPos - this.btnWidth/2) && x <= this.xPos + rescaleByWidth(this.btnWidth/2)){
      if(y >= rescaleByHeight(this.yPos - this.btnHeight/2) && y <= rescaleByHeight(this.yPos + this.btnHeight/2)){
       return true; 
      }
      
    }
    return false;
  }
  
  void drawMe(){
    pushStyle();
    imageMode(CENTER);
    image(this.backgroundImage, this.xPos, this.yPos, this.btnWidth, this.btnHeight);
    popStyle();
  }
  
  void updateBtnDimensions(){
  this.btnWidth = width/20;
  this.btnHeight = height/10;
  
  this.xPos = width/25;
  this.yPos = height/20;
  }
}
