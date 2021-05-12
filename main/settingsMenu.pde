/*
 * A class for handling the 2D settings menu; buttons and their respective actions
 */
class SettingsMenu implements Menu {

  color menuBackground = color(137, 209, 254);

  color btnColor = color(170, 183, 249);
  color btnBorderColor = color(110, 123, 189);

  Button[] settingsMenuButtons;

  float yOffset = floor(height/3.33);
  float xOffset = (width/5) * 4;

  String title = "Parkour Scroll";
  float[] titleTextPos = new float[]{(width/4) * 3, (height/5) * 2.25};
  PFont titleFont = createFont("data/fonts/good times rg.ttf", floor(height/15), true);

 int[][] resolutions = new int[][]{{1920, 1080}, {1280, 720}, {720, 480}, {480, 320}};
 int resolutionIndex = 1;

  //TODO: MOVE OUT LANGUAGE HANDLING TO SEPARATE MODULE
  String[][] btnTextLanguages = new String[][]{{"RESOLUTION", "BACK"}, {"UPPLÖSNING", "TILLBAKA"}};

  int RESOLUTION= 0;
  int BACK= 1;

  /***************************************************************************************************************************************************
   *  MODEL
   ***************************************************************************************************************************************************
   */

  /*
     * Sets up fonts and menu buttons to be included in the settings menu
   *
   * @return A new SettingsMenu object
   */
  SettingsMenu() {
    this.createMenuButtons();
  }

  /*
     * Creates all buttons that are included in the settings menu.
   *
   * @return None
   */
  void createMenuButtons() {

    settingsMenuButtons = new Button[this.btnTextLanguages[currentLanguage].length];

    float xPosBtn = width / 15;
    for (int i = 0; i < this.btnTextLanguages[currentLanguage].length; i++) {
      float yPosBtn = this.yOffset + (height / 8) * i;

      settingsMenuButtons[i] = new Button(i, true, this.btnTextLanguages[currentLanguage][i], xPosBtn, yPosBtn, this.btnColor, this.btnBorderColor);
    }
  }


  /*
   * Moves all animated objects that are part of the settings menu
   *
   * @return None
   */
  void moveMenu() {
    for (int i = 0; i < settingsMenuButtons.length; ++i) {
      if (settingsMenuButtons[i] != null) {
        settingsMenuButtons[i].moveMe();
      }
    }
  }

  void useSmallLayout() {
    this.yOffset = height/12;
    this.xOffset = width * 2.1/3;

    float xPosBtn = width/30;
    float btnWidth = width/2;
    float btnHeight = height/6;

    int settingsBtnsLength = this.settingsMenuButtons.length;

    //Resize settings buttons
    for (int i = 0; i < settingsBtnsLength; ++i) {
      Button btn = this.settingsMenuButtons[i];
      float yPosBtn = this.yOffset + (height / 4.5) * i; //height/25;

      btn.setBtnDimensions(btnWidth, btnHeight);
      btn.setBtnPosition(xPosBtn, yPosBtn);
      btn.setQuadOffset(btn.getQuadOffset()/1.75);
      btn.setAnimation(false);
      btn.setBtnTextFont(createFont("data/fonts/good times rg.ttf", floor(height/15), true));
    }

    this.title = "Parkour\nScroll";
    this.titleTextPos[0] = width * (4.0/5);
    updateMenuTextFontSizes(floor(height/9));
  }

  void useBigLayout() {
    this.yOffset = floor(height/3.33);
    this.xOffset = (width/5) * 4;

    float xPosBtn = width / 15;
    float btnWidth = width / 3;
    float btnHeight = height / 12;

    int settingsBtnsLength = this.settingsMenuButtons.length;

    //Resize settings buttons
    for (int i = 0; i < settingsBtnsLength; ++i) {
      Button btn = this.settingsMenuButtons[i];
      float yPosBtn = this.yOffset + (height / 8) * i;

      btn.setBtnDimensions(btnWidth, btnHeight);
      btn.setBtnPosition(xPosBtn, yPosBtn);
      btn.setQuadOffset(btn.getQuadOffset()*1.75);
      btn.setAnimation(true);
      btn.setBtnTextFont(createFont("data/fonts/good times rg.ttf", floor(height/25), true));
    }

    this.title = "Parkour Scroll";
    this.titleTextPos[0] = width * (4.0/5);
    updateMenuTextFontSizes(floor(height/9));
  }

  void updateMenuTextFontSizes(float titleFontSize) {
    this.titleFont = createFont("data/fonts/good times rg.ttf", titleFontSize, true);
  }


  /*
     * Changes the menu button's text to the current language
   *
   * @return None
   */
  void updateBtnLanguage() {
    for (int i = 0; i < this.btnTextLanguages[currentLanguage].length; i++) {
      settingsMenuButtons[i].setBtnText(btnTextLanguages[currentLanguage][i]);
    }
  }



  /*
   * Click while in the menu. Event will depend on which button is clicked
   *
   *
   *
   * @return None
   */
  void settingsMenuClick() {
    for (Button button : settingsMenuButtons) {
      if (button.isInside()) {
        if (button.ID == this.BACK) {
          navigation = NavType.INMAINMENU;
        } else if (button.ID == this.RESOLUTION) {
          resolutionIndex = (resolutionIndex + 1) % (resolutions.length);
          surface.setSize(resolutions[resolutionIndex][0], resolutions[resolutionIndex][1]);
            if (width <= 600) {
              this.useSmallLayout();
              mainMenu.useSmallLayout();
            }
            else{
              this.useBigLayout();
              mainMenu.useBigLayout();
            }
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
     * Draws up all objects that are part of the settings menu, including menu background.
   *
   * @return None
   */
  void drawMenu() {
    pushStyle();
    background(this.menuBackground);

    textAlign(CENTER);

    //Draw settings menu buttons
    for (int i = 0; i < settingsMenuButtons.length; ++i) {
      if (settingsMenuButtons[i] != null) {
        settingsMenuButtons[i].drawMe();
      }
    }
    //Draw menu text
    this.drawTextElements();

    popStyle();
  }

  /*
     * Draws up text elements in the settings menu
   *
   * @return None
   */
  void drawTextElements() {
    this.drawGameTitle();
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

}
