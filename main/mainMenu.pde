/*
 * A class for handling the 2D main menu; buttons and their respective actions
 */
class MainMenu implements Menu {
  boolean useSmallLayout = false;

  color menuBackground = color(137, 209, 254);

  color btnColor = color(170, 183, 249);
  color btnBorderColor = color(110, 123, 189);
  color flagBorderColor = color(0, 0, 0, 0);

  Button[] mainMenuButtons;

  float yOffset = floor(height/3.33);
  float xOffset = (width/5) * 4;

  String title = "Parkour Scroll";
  float[] titleTextPos = new float[]{(width/4) * 3, (height/5) * 2.25};
  PFont titleFont = createFont("data/fonts/good times rg.ttf", floor(height/15), true);

  PFont languageFont = createFont("data/fonts/good times rg.ttf", ceil(height/35), true);

  String[] flagImgs = new String[]{"data/menu_images/eng_flag.png", "data/menu_images/swe_flag.png"};

  //TODO: MOVE OUT LANGUAGE HANDLING TO SEPARATE MODULE
  String[][] btnTextLanguages = new String[][]{{"START", "SETTINGS", "TUTORIAL", "QUIT"}, {"STARTA", "INSTÄLLNINGAR", "HJÄLPINSTRUKTIONER", "AVSLUTA"}};
  String[] menuText = new String[]{"Language: ", "Språk: "};

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
    this.createMenuButtons();
  }

  /*
     * Creates all buttons that are included in the main menu.
   *
   * @return None
   */
  void createMenuButtons() {

    mainMenuButtons = new Button[this.btnTextLanguages[currentLanguage].length + languages.length];

    float xPosBtn = width / 15;
    for (int i = 0; i < this.btnTextLanguages[currentLanguage].length; i++) {
      float yPosBtn = this.yOffset + (height / 8) * i;

      mainMenuButtons[i] = new Button(i, true, this.btnTextLanguages[currentLanguage][i], xPosBtn, yPosBtn, this.btnColor, this.btnBorderColor);
    }

    float yPosBtn = height/30;
    float btnWidth = width /12;
    float btnHeight = height / 12;
    for (int i = 0; i < languages.length; ++i) {

      xPosBtn = xOffset + (width / 10) * i;

      mainMenuButtons[this.btnTextLanguages[currentLanguage].length + i] = new Button(this.btnTextLanguages[currentLanguage].length + i, false, false, null, xPosBtn, yPosBtn, btnWidth, btnHeight, this.btnBorderColor, this.btnBorderColor, 0, flagImgs[i]);
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

  void useSmallLayout() {
    this.useSmallLayout = true;
    this.yOffset = height/12;
    this.xOffset = width * 2.1/3;

    float xPosBtn = width/30;
    float btnWidth = width/2;
    float btnHeight = height/6;

    int mainBtnsLength = this.mainMenuButtons.length - this.btnTextLanguages.length;

    //Resize main buttons
    for (int i = 0; i < mainBtnsLength; ++i) {
      Button btn = this.mainMenuButtons[i];
      float yPosBtn = this.yOffset + (height / 4.5) * i; //height/25;

      btn.setBtnDimensions(btnWidth, btnHeight);
      btn.setBtnPosition(xPosBtn, yPosBtn);
      btn.setQuadOffset(60/1.75);
      btn.setAnimation(false);
      btn.setBtnTextFont(createFont("data/fonts/good times rg.ttf", floor(height/15), true));
    }

    //Resize language buttons
    btnWidth = btnWidth / 4;
    float yPosBtn = this.yOffset/2;

    for (int i = 0; i < this.btnTextLanguages.length; ++i) {
      Button btn = this.mainMenuButtons[mainBtnsLength + i];
      xPosBtn = this.xOffset + (btnWidth + 10) * i;

      btn.setBtnDimensions(btnWidth, btnHeight/1.25);
      btn.setBtnPosition(xPosBtn, yPosBtn);
    }

    this.title = "Parkour\nScroll";
    this.titleTextPos[0] = width * (4.0/5);
    updateMenuTextFontSizes(floor(height/9), 1);
  }

  void useBigLayout() {
    this.useSmallLayout = false;
    this.yOffset = floor(height/3.33);
    this.xOffset = (width/5) * 4;

    float xPosBtn = width / 15;
    float btnWidth = width / 3;
    float btnHeight = height / 12;

    int mainBtnsLength = this.mainMenuButtons.length - this.btnTextLanguages.length;

    //Resize main buttons
    for (int i = 0; i < mainBtnsLength; ++i) {
      Button btn = this.mainMenuButtons[i];
      float yPosBtn = this.yOffset + (height / 8) * i; //height/25;

      btn.setBtnDimensions(btnWidth, btnHeight);
      btn.setBtnPosition(xPosBtn, yPosBtn);
      btn.setQuadOffset(60);
      btn.setAnimation(true);
      btn.setBtnTextFont(createFont("data/fonts/good times rg.ttf", floor(height/25), true));
    }

    //Resize language buttons
    btnWidth = width / 12;
    float yPosBtn = height/30;

    for (int i = 0; i < this.btnTextLanguages.length; ++i) {
      Button btn = this.mainMenuButtons[mainBtnsLength + i];
      xPosBtn = this.xOffset + (width / 10) * i;

      btn.setBtnDimensions(btnWidth, btnHeight*1.25);
      btn.setBtnPosition(xPosBtn, yPosBtn);
    }

    this.title = "Parkour Scroll";
    this.titleTextPos[0] = width * (4.0/5);
    updateMenuTextFontSizes(floor(height/9), 1);
  }

  void updateMenuTextFontSizes(float titleFontSize, float languageFontSize) {
    this.titleFont = createFont("data/fonts/good times rg.ttf", titleFontSize, true);

    this.languageFont = createFont("data/fonts/good times rg.ttf", languageFontSize, true);
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
   *
   *
   * @return None
   */
  void mainMenuClick() {
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
        } else if (button.ID == this.ENGBTN) {
          currentLanguage = ENG;

          updateBtnLanguage();
          settingsMenu.updateBtnLanguage();
        } else if (button.ID == this.SWEBTN) {
          currentLanguage = SWE;

          updateBtnLanguage();
          settingsMenu.updateBtnLanguage();
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
    this.drawLanguageOptions();
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
  void drawLanguageOptions() {
    pushStyle();
    textFont(this.languageFont);
    fill(255);
    if (!this.useSmallLayout) {
      text(this.menuText[currentLanguage], (width/15) * 11, height/15);
    }
    popStyle();
  }
}
