
/*
 * A class for the home button visible during a game, that brings up a menu
 *
 */
class HomeButton extends Button{
  
  String homeButtonPath;
  
  
  /***************************************************************************************************************************************************
   *  MODEL
   ***************************************************************************************************************************************************
   */
  
  /*
   * Constructor for a round home button placed at the corner of the screen during a game
   *
   * @return A new HomeButton object
   */
  HomeButton(String homeButtonPath){
    //x and y-pos are given as center positions
    
    super(0, false, false, "", width/25, height/15, width/20, height/10, color(255), homeButtonPath);
    
    this.homeButtonPath = homeButtonPath;

  }
  
  /*
   * Determines whether a mouse click is inside the radius of the button
   *
   * @return Whether the mouse click landed inside the button
   */
  boolean isInside(){
    float x = mouseX;
    float y = mouseY;
    
    float distance = sqrt(pow(x - this.xPos, 2) + pow(y - this.yPos, 2));

    if(distance <= this.btnWidth/2 && distance <= this.btnHeight/2){
       return true; 
      }
    return false;
  }
  
  /*
   * Updates the button's dimensions according to current window size
   *
   * @return None
   */
  void updateBtnDimensions(){
    if(useSmallLayout){
      this.btnWidth = width/12;
      this.btnHeight = height/6;
      
      this.xPos = width/18.5;
      this.yPos = height/12;
    }
    else{
      this.btnWidth = width/20;
      this.btnHeight = height/10;
      
      this.xPos = width/25;
      this.yPos = height/15;
    }
  }
  
  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */
   
  /*
   * Draws the home button
   *
   * @return None
   */
  void drawMe(){
    pushStyle();
    imageMode(CENTER);
    image(this.backgroundImage, this.xPos, this.yPos, this.btnWidth, this.btnHeight);
    popStyle();
  }
  
}
