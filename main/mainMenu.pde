/*
 * A class for handling the 2D main menu; buttons and their respective actions
 */
class MainMenu implements Menu {
  Button[] mainMenuButtons;
  
  PImage menuBackground = loadImage("data/menu_images/MenuGradient.png");

  color btnColor = color(170, 183, 249);
  color btnBorderColor = color(110, 123, 189);
  color flagBorderColor = color(0, 0, 0, 0);

  // Button offsets from origo on screen
  float yOffset = floor(height/3.33);
  float xOffset = (width/5) * 4;

  // Title text attributes
  String title = "Parkour Scroll";
  int titleFontSize = floor(height/15);
  PFont titleFont = createFont("data/fonts/good times rg.ttf", this.titleFontSize, true);
  float[] titleTextPos = new float[]{width * (2.95 / 4.0), (height/5) * 2.25};

  // Language buttons attributes
  int languageFontSize = ceil(height/35);
  PFont languageFont = createFont("data/fonts/good times rg.ttf", this.languageFontSize, true);
  String[] flagImgs = new String[]{"data/menu_images/eng_flag.png", "data/menu_images/swe_flag.png"};
  float[] languageTextPos = new float[]{width * 11.0/15, height/15};
  
  String[] musicCredit = new String[]{"Music from BenSound.com", "Musik av BenSound.com"};
  int creditFontSize = languageFontSize;
  PFont creditFont = createFont("data/fonts/good times rg.ttf", this.languageFontSize, true);
  float[] creditTextPos = new float[]{width * 12/15.0, height * 14/15.0};

  //TODO: MOVE OUT LANGUAGE HANDLING TO SEPARATE MODULE
  String[][] btnTexts = new String[][]{{"START", "SETTINGS", "TUTORIAL", "QUIT"}, {"STARTA", "INSTÄLLNINGAR", "HJÄLPINSTRUKTIONER", "AVSLUTA"}};
  String[] languageText = new String[]{"Language: ", "Språk: "};
  boolean showLanguageText = true;

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

    mainMenuButtons = new Button[this.btnTexts[currentLanguage].length + languages.length];

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
    mainMenuButtons = new Button[this.btnTexts[currentLanguage].length + languages.length];

    float xPosBtn = width / 15;
    float ySpacing = (height / 8);
    
    for (int i = 0; i < this.btnTexts[currentLanguage].length; i++) {
      float yPosBtn = this.yOffset + ySpacing * i;

      mainMenuButtons[i] = new Button(i, true, this.btnTexts[currentLanguage][i], xPosBtn, yPosBtn, this.btnColor, this.btnBorderColor);
    }

    float yPosBtn = height/30;
    float xSpacing = (width / 10);
    
    float btnWidth = width /12;
    float btnHeight = height / 12;
    for (int i = 0; i < languages.length; ++i) {

      xPosBtn = xOffset + xSpacing * i;

      mainMenuButtons[this.btnTexts[currentLanguage].length + i] = new Button(this.btnTexts[currentLanguage].length + i, false, false, null, xPosBtn, yPosBtn, btnWidth, btnHeight, this.btnBorderColor, this.btnBorderColor, 0, flagImgs[i]);
    }
     
     // "Global" varaible. Resize created menu and buttons if necessary
     if(useSmallLayout){
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
   * Changes the menu button's text to the current language
   *
   * @return None
   */
  void updateMenuLanguage() {
    for (int i = 0; i < this.btnTexts[currentLanguage].length; i++) {
      mainMenuButtons[i].setBtnText(this.btnTexts[currentLanguage][i]);
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
          navigation = NavType.INSETTINGS;
        } else if (button.ID == this.TUTORIAL) {
          println("GO TO TUTORIAL");
        } else if (button.ID == this.QUIT) {
          exit();
        } 
        // Call global update Language function
        else if (button.ID == this.ENGBTN) {
          currentLanguage = ENG;
          
          updateLanguage();
        } else if (button.ID == this.SWEBTN) {
          currentLanguage = SWE;
          updateLanguage();
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
    this.yOffset = height/12;
    this.xOffset = width * 2.1/3;
    
    //Resize main buttons
    float btnWidth = width/2;
    float btnHeight = height/6;
    float newXStartPos =  width / 30;
    float ySpacing = (height / 4.5);
     
    int btnFontSize = floor(height/15);
    float newQuadOffset = 35;
    boolean useBtnAnimation = false;
    
    resizeMainButtons(btnWidth, btnHeight, newXStartPos, ySpacing, btnFontSize, useBtnAnimation, newQuadOffset);

    //Resize language buttons
    btnWidth /= 4;
    btnHeight /= 1.25;
    
    float newYStartPos = this.yOffset/2;
    float xSpacing = (btnWidth + 10);

    resizeLanguageButtons(btnWidth, btnHeight, newYStartPos, xSpacing);
    
    //Break title in two and resize
    this.resizeMenuTextElements();
  }
  
  /*
   * Resizes menu elements according to a larger screen.
   *
   * @return None
   */
  void useBigLayout(){
    this.yOffset = floor(height / 3.33);
    this.xOffset = (width / 5) * 4;
    
    //Resize main buttons
    float btnWidth = width / 3;
    float btnHeight = height / 12;
    float newXStartPos =  width / 15;
    float ySpacing = (height / 8);
     
    int btnFontSize = floor(height/25);
    float newQuadOffset = 60;
    boolean useBtnAnimation = true;
    
    resizeMainButtons(btnWidth, btnHeight, newXStartPos, ySpacing, btnFontSize, useBtnAnimation, newQuadOffset);


    //Resize language buttons
    btnWidth =  width / 12;
    btnHeight *= 1.25;
    float newYStartPos = height / 30;
    float xSpacing = (width / 10);

    resizeLanguageButtons(btnWidth, btnHeight, newYStartPos, xSpacing);
    
    // Will reset to default title size in one line and language text
    this.resizeMenuTextElements();
  }

  /*
   * Resizes the principal menu buttons to new dimensions and position.
   *
   * @param btnWidth    The new width of the main button
   * @param btnHeight    The new height of the main button
   * @param xPosBtn   The x-coordinate to use for all main buttons
   * @param ySpacing    The space between buttons on the y-axis. Measured from the center of buttons.
   * @param btnFontSize   The new font size of the buttons
   * @param animateMainBtns   Whether the buttons should be animated or not
   * @param newQuadOffset    The new quad offset to use on the buttons
   *
   * @return None
   */
  void resizeMainButtons(float btnWidth, float btnHeight, float xPosBtn, float ySpacing, int btnFontSize, boolean animateMainBtns, float newQuadOffset){
    int mainBtnsLength = this.mainMenuButtons.length - this.btnTexts.length;
    
    for (int i = 0; i < mainBtnsLength; ++i) {
      Button btn = this.mainMenuButtons[i];
      float yPosBtn = this.yOffset + ySpacing * i;

      btn.setBtnDimensions(btnWidth, btnHeight);
      btn.setBtnPosition(xPosBtn, yPosBtn);
      
      btn.setQuadOffset(newQuadOffset);
      btn.setAnimation(animateMainBtns);
  
      btn.setBtnTextFont(createFont("data/fonts/good times rg.ttf", btnFontSize, true));
    }
  }
  
  /*
   * Resizes the language buttons and accompanying text to new dimensions and position.
   *
   * @param btnWidth  The new width of the language button
   * @param btnHeight  The new height of the language button
   * @param yPosBtn the y-coordinate to use for all main buttons
   * @param xSpacing The space to be used between buttons on the x-axis. Measured from the center of two buttons
   *
   * @return None
   */
  void resizeLanguageButtons(float btnWidth, float btnHeight, float yPosBtn, float xSpacing){
    int mainBtnsLength = this.mainMenuButtons.length - this.btnTexts.length;

    for (int i = 0; i < this.btnTexts.length; ++i) {
      float xPosBtn = this.xOffset + xSpacing * i;
      Button btn = this.mainMenuButtons[mainBtnsLength + i];

      btn.setBtnDimensions(btnWidth, btnHeight);
      btn.setBtnPosition(xPosBtn, yPosBtn);
    }

  }

  /*
   * Resizes the menu text elements that aren't buttons, according to current window dimensions.
   *
   * @return None
   */
  void resizeMenuTextElements() {
    if(useSmallLayout){
      this.title = "Parkour\nScroll";
      this.titleTextPos[0] = width * (4.0/5);
      this.titleFontSize = floor(height/10);
      
      this.creditFontSize = ceil(height/20);
      
      this.showLanguageText = false;
    }
    else{
      this.title = "Parkour Scroll";
      this.titleTextPos[0] = width * (2.95 / 4.0);
      this.titleFontSize = floor(height/15);
      
      this.creditFontSize = ceil(height/35);
      
      this.showLanguageText = true;
    }
    
    // Updates old y-position
    this.titleTextPos[1] = (height/5) * 2.25;
    this.titleFont = createFont("data/fonts/good times rg.ttf", this.titleFontSize, true);
    
    this.languageFontSize = ceil(height/35);
    this.languageFont = createFont("data/fonts/good times rg.ttf", this.languageFontSize, true);
    this.languageTextPos[0] = width * 11.0/15;
    this.languageTextPos[1] = height/15;
    
    this.musicCredit = new String[]{"Music from BenSound.com", "Musik av BenSound.com"};
    this.creditFont = createFont("data/fonts/good times rg.ttf", this.creditFontSize, true);
    this.creditTextPos[0] = width * 12/15.0;
    this.creditTextPos[1] =height * 14/15.0;
    
    
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
    // An image must be the same pixel size as the background
    this.menuBackground.resize(width, height);
    background(this.menuBackground);

    textAlign(CENTER);

    //Draw main menu buttons
    for (int i = 0; i < this.mainMenuButtons.length; ++i) {
      if (this.mainMenuButtons[i] != null) {
        this.mainMenuButtons[i].drawMe();
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
    this.drawCreditText();
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
    
    if (this.showLanguageText == true) {
      text(this.languageText[currentLanguage], this.languageTextPos[0], this.languageTextPos[1]);
    }
    popStyle();
  }
  
    /*
   * Draws up the music credits text
   *
   * @return None
   */
  void drawCreditText() {
    pushStyle();
    textFont(this.creditFont);
    fill(255);
    
    text(this.musicCredit[currentLanguage], this.creditTextPos[0], this.creditTextPos[1]);
    popStyle();
  }
}
