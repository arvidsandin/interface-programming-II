
class MainMenu implements Menu{

color btnColor = color(170,183,249);
color btnBorderColor = color(110,123,189);

Button[] mainMenuButtons = new Button[4];

int topOffset = 180;

String title = "Parkour Scroll";
PFont titleFont = createFont("Arial Bold", 40, true);
PFont languageFont = createFont("Arial", 17, true);

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

      this.topOffset = topOffset;
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
     * Draws up all objects that are part of the main menu
     *
     * @return None
    */
    void drawMenu(){
      pushStyle();
      textAlign(CENTER);
      
      //Draw main menu buttons
      for(int i = 0; i < mainMenuButtons.length; ++i){
        mainMenuButtons[i].drawMe();
      }
      
      //Draw menu text
      this.drawTextElements();
      
      popStyle();
    }
    
    /*
     * Creates all buttons that are included in the main menu.
     *
     * @return None
    */
    void createMenuButtons(){
      String[] btnText = new String[]{"START", "SETTINGS", "TUTORIAL", "QUIT"}; //TODO: include multilanguage option structure
      
      int widthFrac = 15;
      int heightFrac = 8;
      
      for(int i = 0; i < mainMenuButtons.length; i++){
        
        float xposBtn = windowWidth / widthFrac;
        float yposBtn = topOffset + (windowHeight / heightFrac) * i;
        
        mainMenuButtons[i] = new Button(i, true, btnText[i], xposBtn, yposBtn, this.btnColor, this.btnBorderColor);
      }
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
      text(this.title, (windowWidth/5) * 4, (windowHeight/5) * 2.25);
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
      text("LANGUAGE: ", (windowWidth/15) * 11, windowHeight/15);
      popStyle();
    }

}
