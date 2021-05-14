/*
 * A class for handling the 2D game menu; buttons and their respective actions
 */

public class GameMenu implements Menu{
  Button[] gameMenuButtons;
  
  color menuBackground = color(175, 175, 175, 3);
  color btnColor = color(170, 183, 249);
  color btnBorderColor = color(110,123,189);

  float btnWidth = width / 2;
  float btnHeight = height / 10;

  color textColor = color(255);
  PFont textFont = createFont("data/fonts/good times rg.ttf", width/44, true);

  float topOffset = (float) width / 10;

  String[][] btnTexts = new String[][]{{"CONTINUE", "SETTINGS", "CHOOSE LEVEL", "MAIN MENU"}, {"FORTSÄTT", "INSTÄLLNINGAR", "VÄLJ NIVÅ", "HUVUDMENY"}};
  int menuLanguage = ENG;

  int CONTINUE = 0;
  int SETTINGS = 1;
  int CHOOSELEVEL= 2;
  int MAINMENU = 3;

  /***************************************************************************************************************************************************
   *  MODEL
   ***************************************************************************************************************************************************
   */

      /*
       * Sets up default fonts and menu buttons to be included in the game menu
       *
       * @return A new GameMenu object
      */
    GameMenu(){
      gameMenuButtons = new Button[btnTexts[currentLanguage].length];
      
      float xPosBtn = (width - this.btnWidth)/ 2;
      float ySpacing = (height / 6);
      
      for(int i = 0; i < gameMenuButtons.length; i++){
        float yPosBtn = topOffset + ySpacing * i;

        this.gameMenuButtons[i] = new Button(i, false, false, this.btnTexts[currentLanguage][i], this.textColor, this.textFont, xPosBtn, yPosBtn, this.btnWidth, this.btnHeight, this.btnColor, this.btnBorderColor);
      }
      // "Global" varaible. Resize created menu and buttons if necessary
      if(useSmallLayout){
        this.resize();
      }
    }
    
    /*
     * Moves all animated objects that are part of the game menu
     *
     * @return None
    */
    void moveMenu(){
      for(int i = 0; i < this.gameMenuButtons.length; ++i){
        if(this.gameMenuButtons[i] != null){
           this.gameMenuButtons[i].moveMe();
        }
      }

    }

    /*
     * Changes the menu button's text to the current language
     *
     * @return None
    */
    void updateMenuLanguage(){
      for(int i = 0; i < this.btnTexts[currentLanguage].length; i++){
             this.gameMenuButtons[i].setBtnText(this.btnTexts[currentLanguage][i]);
      }
    }

  /*
   * Click occurs while in the menu. Event will depend on which button is clicked
   *
   * @return None
  */
  void menuClick(){
    for (Button button:this.gameMenuButtons){
      if (button.isInside()){
        if(button.ID == this.CONTINUE){
          navigation = NavType.INGAME;
        }
        else if(button.ID == this.SETTINGS){
          navigation = NavType.INSETTINGS;
        }
        else if(button.ID == this.CHOOSELEVEL){
          println("GO TO LEVEL SELECTION");
        }
        else if(button.ID == this.MAINMENU){
          navigation = NavType.INMAINMENU;
        }
        break;
      }
    }
  }
  
  /*
   * Resizes menu elements according to a small or larger screen. Adapted to a 2.5:1 ratio in small size.
   *
   *
   * @return None
   */
  void resize(){
    if(useSmallLayout){
      this.useSmallLayout();
    }
    else{
      this.useBigLayout();
    }
  }
  
  /*
   * Resizes menu elements to be more visible on a small screen. 
   *
   * @return None
   */
  void useSmallLayout(){
    this.btnWidth = width/2;
    this.btnHeight = height/6;
    
    float ySpacing = (height / 4.5);
    float newXStartPos =  (width - this.btnWidth)/ 2;
    
    this.topOffset = (float) width / 25;
    
    int btnFontSize = width/30;
    float newQuadOffset = 35;
    
    this.resizeButtons(btnWidth, btnHeight, newXStartPos, ySpacing, btnFontSize, newQuadOffset);
  }
  
  /*
   * Resizes menu elements according to a larger screen.
   *
   * @return None
   */
  void useBigLayout(){
    this.btnWidth = width / 2;
    this.btnHeight = height / 10;
    
    float ySpacing = (height / 6);
    float newXStartPos = (width - this.btnWidth)/ 2;  // Offset by btnWidth as button position is upper left corner
    
    this.topOffset = (float) width / 10;
    
    int btnFontSize = width/45;
    float newQuadOffset = 60;
    
    this.resizeButtons(btnWidth, btnHeight, newXStartPos, ySpacing, btnFontSize, newQuadOffset);
  }
  
  /*
   * Resizes the menu buttons to look better on a smaller screen. Adapted to a 2.5 ratio.
   *
   * @param btnWidth    The new width of the main button
   * @param btnHeight    The new height of the main button
   * @param xPosBtn   The x-coordinate to use for all main buttons
   * @param ySpacing    The space between buttons on the y-axis. Measured from the center of buttons.
   * @param btnFontSize   The new font size of the buttons
   * @param newQuadOffset    The new quad offset to use on the buttons
   *
   * @return None
   */
  void resizeButtons(float btnWidth, float btnHeight, float xPosBtn, float ySpacing, int btnFontSize, float newQuadOffset){
    for (int i = 0; i < this.gameMenuButtons.length; ++i) {
      float yPosBtn = this.topOffset + ySpacing * i;
      Button btn = this.gameMenuButtons[i];

      btn.setBtnDimensions(btnWidth, btnHeight);
      btn.setBtnPosition(xPosBtn, yPosBtn);
      
      btn.setQuadOffset(newQuadOffset);
  
      btn.setBtnTextFont(createFont("data/fonts/good times rg.ttf", btnFontSize, true));
    }
  }

  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */
    
    /*
     * Draws up all elements in the game menu
     *
     * @return None
    */
    void drawMenu(){
      pushStyle();
      // Transparency overwrites itself
      fill(this.menuBackground);
      rect(0, 0, width, height);
      
      textAlign(CENTER);

      //Draw game menu buttons
      for(int i = 0; i < this.gameMenuButtons.length; ++i){
        if(this.gameMenuButtons[i] != null){
          this.gameMenuButtons[i].drawMe();
        }
      }
      //Draw menu text
      this.drawTextElements();

      popStyle();
    }

    /*
     * Draws up text elements in the game menu, if there are any
     *
     * @return None
    */
    void drawTextElements(){

    }
}
