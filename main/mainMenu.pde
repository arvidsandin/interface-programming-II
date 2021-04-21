
class MainMenu implements Menu{

color menuBackground = color(137, 209, 254);
  
color btnColor = color(170,183,249);
color btnBorderColor = color(110,123,189);

Button[] mainMenuButtons = new Button[4];

int yOffset = 180;
int xOffset = (width/5) * 4;

String title = "Parkour Scroll";
PFont titleFont = createFont("data/fonts/good times rg.ttf", 40, true);

PFont languageFont = createFont("data/fonts/good times rg.ttf", 17, true);

String[] flagImgs = new String[]{"data/menu_images/eng_flag.png", "data/menu_images/swe_flag.png"};

//TODO: MOVE OUT LANGUAGE HANDLING TO SEPARATE MODULE
String[][] btnTextLanguages = new String[][]{{"START", "SETTINGS", "TUTORIAL", "QUIT"}, {"STARTA", "INSTÄLLNINGAR", "HJÄLPINSTRUKTIONER", "AVSLUTA"}};
String[] menuText = new String[]{"Language: ","Språk: "};

int START= 0;
int SETTINGS= 1;
int TUTORIAL= 2;
int QUIT= 3;
int ENGBTN = 4;
int SWEBTN = 5;

    /*
     * Sets up fonts and menu buttons to be included in the main menu
     *
     * @param menuButtons    The menu buttons to include
     * @param title    The title text to present on the menu
     * @param titleFont    The title font to use for the title text
     * @param languageFont    The font to use for the language options text
     * @return A new MainMenu object
    */ 
    MainMenu(Button[] menuButtons, String title, PFont titleFont, PFont languageFont){ 

      this.title = title;
      this.titleFont = titleFont;
      this.languageFont = languageFont;
      
      mainMenuButtons = new Button[menuButtons.length];
      
      for(int i = 0; i < menuButtons.length; ++i){
        mainMenuButtons[i] = menuButtons[i];
      }
    }
    
    /*
     * Sets up fonts and menu buttons to be included in the main menu
     *
     * @return A new MainMenu object
    */
    MainMenu(){ 
      this.createMenuButtons();
    }
    
    /*
     * Creates all buttons that are included in the main menu.
     *
     * @return None
    */
    void createMenuButtons(){
      
      mainMenuButtons = new Button[this.btnTextLanguages[currentLanguage].length + languages.length];
      
      for(int i = 0; i < this.btnTextLanguages[currentLanguage].length; i++){
        
        float xposBtn = width / 15;
        float yposBtn = this.yOffset + (height / 8) * i;
        
        mainMenuButtons[i] = new Button(i, true, this.btnTextLanguages[currentLanguage][i], xposBtn, yposBtn, this.btnColor, this.btnBorderColor);
      }
      
     for(int i = 0; i < languages.length; ++i){
       
        float xposBtn = xOffset + (width / 10) * i;
        float yposBtn = height/30;
        
        float btnWidth = width /12;
        float btnHeight = height / 12;
        
        mainMenuButtons[this.btnTextLanguages[currentLanguage].length + i] = new Button(this.btnTextLanguages[currentLanguage].length + i, false, false, null, xposBtn, yposBtn, btnWidth, btnHeight, color(0, 0, 0, 0), this.btnBorderColor, 0, flagImgs[i]);
      }

    }
    
    
    /*
     * Moves all animated objects that are part of the main menu
     *
     * @return None
    */
    void moveMenu(){
      for(int i = 0; i < mainMenuButtons.length; ++i){  
        if(mainMenuButtons[i] != null){
           mainMenuButtons[i].moveMe();
        }
      }
      
    }
    
    /*
     * Draws up all objects that are part of the main menu, including menu background.
     *
     * @return None
    */
    void drawMenu(){
      pushStyle();
      background(this.menuBackground);
      
      textAlign(CENTER);
      
      //Draw main menu buttons
      for(int i = 0; i < mainMenuButtons.length; ++i){
        if(mainMenuButtons[i] != null){
          mainMenuButtons[i].drawMe();
        }
      }
      //Draw menu text
      this.drawTextElements();
      
      popStyle();
    }
    
     /*
     * Draws up text elements in the main menu
     * 
     * @return None
    */
    void drawTextElements(){
      
      this.drawGameTitle();
      this.drawLanguageOptions();
    }
    
    /*
     * Draws up game title text 
     * 
     * @return None
    */
    void drawGameTitle(){
      pushStyle();
      textFont(this.titleFont);
      fill(255);
      text(this.title, (width/4) * 3, (height/5) * 2.25);
      popStyle();
    }
    
    /*
     * Draws up language options text
     * 
     * @return None
    */
    void drawLanguageOptions(){
      pushStyle();
      textFont(this.languageFont);
      fill(255);
      text(this.menuText[currentLanguage], (width/15) * 11, height/15);
      popStyle();
    }

    /*
     * Changes the menu button's text to the current language 
     * 
     * @return None
    */
    void updateBtnLanguage(){
      for(int i = 0; i < this.btnTextLanguages[currentLanguage].length; i++){
             mainMenuButtons[i].changeBtnText(btnTextLanguages[currentLanguage][i]); 
      }
    }

  /*
   * Click while in the menu. Event will depend on which button is clicked
   * 
   *
   *
   * @return None
  */
  void mainMenuClick(){
    for (Button button:mainMenuButtons){
      if (button.isInside()){
        if(button.ID == this.START){
          println("GO TO GAME");
        }
        else if(button.ID == this.SETTINGS){
          println("GO TO SETTINGS");
        }
        else if(button.ID == this.TUTORIAL){
          println("GO TO TUTORIAL");
        }
        else if(button.ID == this.QUIT){
          exit();
        }
        else if(button.ID == this.ENGBTN){
          currentLanguage = ENG;
          
          updateBtnLanguage();
        }
        else if(button.ID == this.SWEBTN){
          currentLanguage = SWE;
          
          updateBtnLanguage();
        }
        break;
      }
    }
  }
  
}
