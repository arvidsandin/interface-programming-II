/*
 * A class for handling the 2D game menu; buttons and their respective actions 
 */

public class GameMenu implements Menu{
  color menuBackground = color(137, 209, 254, 0.4);
  
  color btnColor = color(170,183,249);
  color btnBorderColor = color(110,123,189);
  
  float btnWidth = width / 3;
  float btnHeight = height / 12;
  
  color textColor = color(255);
  PFont textFont = createFont("data/fonts/good times rg.ttf", 24, true);
  
  int topOffset = 180;
  
  Button[] gameMenuButtons;
  
  String[][] btnTextLanguages = new String[][]{{"CONTINUE", "SETTINGS", "CHOOSE LEVEL", "MAIN MENU"}, {"FORTSÄTT", "INSTÄLLNINGAR", "VÄLJ NIVÅ", "HUVUDMENY"}};
  int menuLanguage = ENG;
  
  int CONTINUE = 0;
  int SETTINGS = 1;
  int CHOOSELEVEL= 2;
  int MAINMENU = 3;
  
      /*
       * Sets up default fonts and menu buttons to be included in the game menu
       *
       * @return A new GameMenu object
      */
    GameMenu(){
      
      this.createMenuButtons();
    }

    /*
     * Creates all buttons that are included in the main menu.
     *
     * @return None
    */
    void createMenuButtons(){
      gameMenuButtons = new Button[btnTextLanguages[currentLanguage].length];
      
      float widthFrac = 2;
      float heightFrac = 8;
  
      for(int i = 0; i < gameMenuButtons.length; i++){
        float xposBtn = (width - this.btnWidth)/widthFrac;
        float yposBtn = topOffset + (height / heightFrac) * i;
        
        this.gameMenuButtons[i] = new Button(i, false, false, this.btnTextLanguages[currentLanguage][i], this.textColor, this.textFont, xposBtn, yposBtn, this.btnWidth, this.btnHeight, this.btnColor, this.btnBorderColor);
      }
    }
    
    void drawMenu(){
      pushStyle();
      background(this.menuBackground);
      
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
     * Draws up text elements in the game menu
     *
     * @return None
    */
    void drawTextElements(){

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
             this.gameMenuButtons[i].changeBtnText(this.btnTextLanguages[currentLanguage][i]);
      }
    }
    
  /*
   * Click occurs while in the menu. Event will depend on which button is clicked
   * 
   *
   *
   * @return None
  */
  void gameMenuClick(){
    for (Button button:this.gameMenuButtons){
      if (button.isInside()){
        if(button.ID == this.CONTINUE){
          println("GO BACK TO GAME");
        }
        else if(button.ID == this.SETTINGS){
          println("GO TO SETTINGS");
        }
        else if(button.ID == this.CHOOSELEVEL){
          println("GO TO LEVEL SELECTION");
        }
        else if(button.ID == this.MAINMENU){
          println("RETURN");
          navigation = NavType.INMAINMENU;
        }
        break;
      }
    }
  }
    
}
