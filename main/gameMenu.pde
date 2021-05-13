/*
 * A class for handling the 2D game menu; buttons and their respective actions
 */

public class GameMenu implements Menu{
  color menuBackground = color(137, 209, 254, 0.5);

  color btnColor = color(170,183,249);
  color btnBorderColor = color(110,123,189);

  float btnWidth = width / 3;
  float btnHeight = height / 12;

  color textColor = color(255);
  PFont textFont = createFont("data/fonts/good times rg.ttf", width/45, true);

  float topOffset = (float) width / 8;

  Button[] gameMenuButtons;

  String[][] btnTextLanguages = new String[][]{{"CONTINUE", "SETTINGS", "CHOOSE LEVEL", "MAIN MENU"}, {"FORTSÄTT", "INSTÄLLNINGAR", "VÄLJ NIVÅ", "HUVUDMENY"}};
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
      gameMenuButtons = new Button[btnTextLanguages[currentLanguage].length];

      for(int i = 0; i < gameMenuButtons.length; i++){
        float xPosBtn = (width - this.btnWidth)/ 2;
        float yPosBtn = topOffset + (height / 8) * i;

        this.gameMenuButtons[i] = new Button(i, false, false, this.btnTextLanguages[currentLanguage][i], this.textColor, this.textFont, xPosBtn, yPosBtn, this.btnWidth, this.btnHeight, this.btnColor, this.btnBorderColor);
      }
    }
    
    /*
     * Moves all animated objects that are part of the game menu
     *
     * @return None
    */
    void moveMenu(){
      if (currentLanguage != this.menuLanguage){
        this.updateBtnLanguage();
      }

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
    void updateBtnLanguage(){
      for(int i = 0; i < this.btnTextLanguages[currentLanguage].length; i++){
             this.gameMenuButtons[i].setBtnText(this.btnTextLanguages[currentLanguage][i]);
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
          println("GO TO SETTINGS");
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
  
  void resize(){
    
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
      rectMode(CORNER);
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
