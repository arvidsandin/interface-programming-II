/*
 * A class for handling the 2D main menu; buttons and their respective actions
 */
class MainMenu implements Menu {
  int resizeLimit = 600;

  color menuBackground = color(137, 209, 254);

  color btnColor = color(170, 183, 249);
  color btnBorderColor = color(110, 123, 189);
  color flagBorderColor = color(0, 0, 0, 0);
  
  // Dimensions for main and language buttons
  float[] btnWidths;
  float[] btnHeights;
  
  // Spacing between buttons - x used by language buttons, y used by main buttons
  float xBtnSpacing = (width / 10);
  float yBtnSpacing = (height / 8);
  // Set button font size and animation
  int btnFontSize;
  boolean animateMainBtns = true;

  Button[] mainMenuButtons;

  // Button offsets from origo on screen
  float yOffset = floor(height/3.33);
  float xOffset = (width/5) * 4;

  // Title text attributes
  String title = "Parkour Scroll";
  int titleFontSize = floor(height/15);
  PFont titleFont = createFont("data/fonts/good times rg.ttf", this.titleFontSize, true);
  float[] titleTextPos = new float[]{(width/4) * 3, (height/5) * 2.25};

  // Language buttons attributes
  int languageFontSize = ceil(height/35);
  PFont languageFont = createFont("data/fonts/good times rg.ttf", this.languageFontSize, true);
  String[] flagImgs = new String[]{"data/menu_images/eng_flag.png", "data/menu_images/swe_flag.png"};

  //TODO: MOVE OUT LANGUAGE HANDLING TO SEPARATE MODULE
  String[][] btnTextLanguages = new String[][]{{"START", "SETTINGS", "TUTORIAL", "QUIT"}, {"STARTA", "INSTÄLLNINGAR", "HJÄLPINSTRUKTIONER", "AVSLUTA"}};
  String[] menuText = new String[]{"Language: ", "Språk: "};

  // Enums to correspond with a button press
  int START= 0;
  int SETTINGS= 1;
  int TUTORIAL= 2;
  int QUIT= 3;
  int ENGBTN = 4;
  int SWEBTN = 5;

  /***************************************************************************************************************************************************
   *  MODEL
   ***************************************************************************************************************************************************
   */

  /*
     * Sets up fonts and menu buttons to be included in the main menu
   *
   * @param menuButtons    The menu buttons to include
   * @param title    The title text to present on the menu
   * @param titleFont    The title font to use for the title text
   * @param languageFont    The font to use for the language options text
   * @return A new MainMenu object
   */
  MainMenu(Button[] menuButtons, String title, PFont titleFont, PFont languageFont) {

    this.title = title;
    this.titleFont = titleFont;
    this.languageFont = languageFont;

    mainMenuButtons = new Button[this.btnTextLanguages[currentLanguage].length + languages.length];

    for (int i = 0; i < menuButtons.length; ++i) {
      mainMenuButtons[i] = menuButtons[i];
    }
  }

  /*
   * Sets up fonts and menu buttons to be included in the main menu
   *
   * @return A new MainMenu object
   */
  MainMenu() {
      mainMenuButtons = new Button[this.btnTextLanguages[currentLanguage].length + languages.length];
  
      // Create main buttons
      float xPosBtn = width / 15;
      for (int i = 0; i < this.btnTextLanguages[currentLanguage].length; i++) {
        float yPosBtn = this.yOffset + this.yBtnSpacing * i;
  
        mainMenuButtons[i] = new Button(i, true, this.animateMainBtns, this.btnTextLanguages[currentLanguage][i], xPosBtn, yPosBtn, this.btnColor, this.btnBorderColor);
      }
  
      // Create language buttons
      float yPosBtn = height/30;
      float btnWidth = width /12;
      float btnHeight = height / 12;
      for (int i = 0; i < languages.length; ++i) {
  
        xPosBtn = xOffset + this.xBtnSpacing * i;
        int languageBtnIndex = this.btnTextLanguages[currentLanguage].length;
  
        mainMenuButtons[languageBtnIndex + i] = new Button(languageBtnIndex + i, false, false, null, xPosBtn, yPosBtn, btnWidth, btnHeight, this.btnBorderColor, this.btnBorderColor, 0, flagImgs[i]);
      }
     
     // Resize created menu and buttons if necessary
     if(width <= this.resizeLimit){
        this.resize();
      }
  }
  


  /*
   * Moves all animated objects that are part of the main menu
   *
   * @return None
   */
  void moveMenu() {

    for (int i = 0; i < mainMenuButtons.length; ++i) {
      if (mainMenuButtons[i] != null) {
        mainMenuButtons[i].moveMe();
      }
    }
  }
  
  
  /*
   * Sets smaller button dimensions and font sizes to use in the window
   *
   * @return None
   */
  void setSmallScreenVariables(){
    // Updates from previous value if height is changed
    this.titleFontSize = floor(height/10);
    this.btnFontSize = floor(height/15);
    
    this.yOffset = height/12;
    this.xOffset = width * 2.0/3;
    
    this.animateMainBtns = false;
    this.btnWidths = new float[]{width/2, width / 7.5};
    this.btnHeights = new float[]{height / 6, height / 6.5};
    
    this.xBtnSpacing = (this.btnWidths[1] + 10);
    this.yBtnSpacing = (height / 4.5);
  }

  /*
   * Sets the default button dimensions and font sizes to use in the window
   *
   * @return None
   */
  void setDefaultScreenVariables(){
    // Updates from previous value if height is changed
    this.titleFontSize = floor(height/15);
    this.btnFontSize = floor(height/25);
    
    this.yOffset = floor(height/3.33);
    this.xOffset = width * (4 / 5.0);
    
    this.animateMainBtns = true;
    this.btnWidths = new float[]{width /3, width / 12};
    this.btnHeights = new float[]{height / 12, height / 12};
    
    this.xBtnSpacing = (width / 10);
    this.yBtnSpacing = (height / 8);
  }
  
  
  /*
   * Resizes menu elements according to a small or larger screen. Adapted to a 2.5:1 ratio in small size.
   *
   * @return None
   */
  void resize(){
    int mainBtnsLength = this.mainMenuButtons.length - this.btnTextLanguages.length;
    float newQuadOffset;
    float newXStartPos;
    float newYStartPos;
    
    if(width <= this.resizeLimit){
      newQuadOffset = 35;
      newXStartPos =  width / 30;
      newYStartPos = this.yOffset/2;
      this.setSmallScreenVariables();
      
      //Break title in two and resize
      this.resizeTitle(true);
    }
    else{
      newQuadOffset = 60;
      newXStartPos =  width / 15;
      newYStartPos = height / 30;
      this.setDefaultScreenVariables();
      // Will reset to default title size in one line
      this.resizeTitle(false);
    }
    // Resize main buttons
    this.resizeMainButtons(this.btnWidths[0], this.btnHeights[0], mainBtnsLength, newQuadOffset, newXStartPos);
    
    //Resize language buttons
    resizeLanguageButtons(this.btnWidths[1], this.btnHeights[1], mainBtnsLength, newYStartPos);
  }

   /*
   * Resizes the principal menu buttons to look better on a smaller screen. Adapted to a 2.5 ratio.
   *
   * @param btnWidth  The new width of the main button
   * @param btnHeight  The new height of the main button
   * @param mainBtnsLength  The number of main buttons
   * @param newQuadOffset  The new quad offset to use on the buttons
   * @param xPosBtn the x-coordinate to use for all main buttons
   *
   * @return None
   */
  void resizeMainButtons(float btnWidth, float btnHeight, int mainBtnsLength, float newQuadOffset, float xPosBtn){
    for (int i = 0; i < mainBtnsLength; ++i) {
      float yPosBtn = this.yOffset + this.yBtnSpacing * i;
      Button btn = this.mainMenuButtons[i];

      btn.setBtnDimensions(btnWidth, btnHeight);
      btn.setBtnPosition(xPosBtn, yPosBtn);
      
      btn.setQuadOffset(newQuadOffset);
      btn.setAnimation(this.animateMainBtns);
  
      btn.setBtnTextFont(createFont("data/fonts/good times rg.ttf", this.btnFontSize, true));
    }
  }
  
  /*
   * Resizes the language buttons to look better on a smaller screen. Adapted to a 2.5 ratio.
   *
   * @param btnWidth  The new width of the language button
   * @param btnHeight  The new height of the language button
   * @param mainBtnsLength  The number of main buttons - Offset to get language buttons
   * @param yPosBtn the y-coordinate to use for all main buttons
   *
   * @return None
   */
  void resizeLanguageButtons(float btnWidth, float btnHeight, int mainBtnsLength, float yPosBtn){
    for (int i = 0; i < this.btnTextLanguages.length; ++i) {
      float xPosBtn = this.xOffset + this.xBtnSpacing * i;
      Button btn = this.mainMenuButtons[mainBtnsLength + i];

      btn.setBtnDimensions(btnWidth, btnHeight);
      btn.setBtnPosition(xPosBtn, yPosBtn);
    }
  }

  /*
   * Resizes the title to look better on a smaller screen. Adapted to a 2.5 ratio.
   *
   * @param useSmallLayout  Whether the resized title should adapt to a small screen or a larger one
   * @return None
   */
  void resizeTitle(boolean useSmallLayout) {
    if(useSmallLayout){
      this.title = "Parkour\nScroll";
      // New X-position for title
      this.titleTextPos[0] = width * (4.0/5);
    }
    else{
      this.title = "Parkour Scroll";
      // New X-position for title
      this.titleTextPos[0] = width * (3 / 4.0);
    }
    // Updates old y-position
    this.titleTextPos[1] = (height/5) * 2.25;
    this.titleFont = createFont("data/fonts/good times rg.ttf", this.titleFontSize, true);
  }
  
  

  /*
   * Changes the menu button's text to the current language
   *
   * @return None
   */
  void updateBtnLanguage() {
    for (int i = 0; i < this.btnTextLanguages[currentLanguage].length; i++) {
      mainMenuButtons[i].setBtnText(btnTextLanguages[currentLanguage][i]);
    }
  }



  /*
   * Click while in the menu. Event will depend on which button is clicked
   *
   * @return None
   */
  void menuClick() {
    for (Button button : mainMenuButtons) {
      if (button.isInside()) {
        if (button.ID == this.START) {
          navigation = NavType.INGAME;
        } else if (button.ID == this.SETTINGS) {
          println("GO TO SETTINGS");
        } else if (button.ID == this.TUTORIAL) {
          println("GO TO TUTORIAL");
        } else if (button.ID == this.QUIT) {
          exit();
        } else if (button.ID == this.ENGBTN) {
          currentLanguage = ENG;

          updateBtnLanguage();
        } else if (button.ID == this.SWEBTN) {
          currentLanguage = SWE;
          settings();
          updateBtnLanguage();
        }
        break;
      }
    }
  }

  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */

  /*
   * Draws up all objects that are part of the main menu, including menu background.
   *
   * @return None
   */
  void drawMenu() {

    pushStyle();
    background(this.menuBackground);

    textAlign(CENTER);

    //Draw main menu buttons
    for (int i = 0; i < mainMenuButtons.length; ++i) {
      if (mainMenuButtons[i] != null) {
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
  void drawTextElements() {

    this.drawGameTitle();
    this.drawLanguageText();
  }

  /*
   * Draws up game title text
   *
   * @return None
   */
  void drawGameTitle() {
    pushStyle();
    textFont(this.titleFont);
    fill(255);
    
    text(this.title, this.titleTextPos[0], this.titleTextPos[1]);
    popStyle();
  }

  /*
   * Draws up language options text
   *
   * @return None
   */
  void drawLanguageText() {
    pushStyle();
    textFont(this.languageFont);
    fill(255);
    
    // Show only text if there is space for it
    if (!(width <= this.resizeLimit)) {
      text(this.menuText[currentLanguage], width * 11.0/15, height/15);
    }
    popStyle();
  }
}
