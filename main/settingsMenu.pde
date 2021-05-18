/*
 * A class for handling the 2D settings menu; buttons and their respective actions
 */
class SettingsMenu implements Menu {
  Button[] settingsMenuButtons;

  color menuBackground = color(137, 209, 254);

  color btnColor = color(170, 183, 249);
  color btnBorderColor = color(110, 123, 189);

  float yOffset = floor(height/3.33);
  float xOffset = (width/5) * 4;

 int[][] resolutions = new int[][]{{1920, 1080}, {1280, 720}, {720, 480}, {480, 320}, {500, 200}};
 int resolutionIndex = 1;

  //TODO: MOVE OUT LANGUAGE HANDLING TO SEPARATE MODULE
  String[][] btnTexts = new String[][]{{"RESOLUTION", "MUTE", "BACK"}, {"UPPLÖSNING", "STÄNG AV LJUD", "TILLBAKA"}};

  int RESOLUTION= 0;
  int MUTE= 1;
  int BACK= 2;

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
    this.settingsMenuButtons = new Button[this.btnTexts[currentLanguage].length];

    float xPosBtn = width / 15;
    for (int i = 0; i < this.btnTexts[currentLanguage].length; i++) {
      float yPosBtn = this.yOffset + (height / 8) * i;

      settingsMenuButtons[i] = new Button(i, true, this.btnTexts[currentLanguage][i], xPosBtn, yPosBtn, this.btnColor, this.btnBorderColor);
    }

    // "Global" varaible. Resize created menu and buttons if necessary
     if(useSmallLayout){
        this.resize();
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

  /*
   * Changes the menu's text to the current language
   *
   * @return None
   */
  void updateMenuLanguage() {
    for (int i = 0; i < this.btnTexts[currentLanguage].length; i++) {
      settingsMenuButtons[i].setBtnText(btnTexts[currentLanguage][i]);
    }
  }

  /*
   * Click while in the menu. Event will depend on which button is clicked
   *
   * @return None
   */
  void menuClick() {
    for (Button button : settingsMenuButtons) {
      if (button.isInside()) {
        if (button.ID == this.BACK) {
          if(inGame){
            navigation = NavType.INGAME;
          }
          else{
            navigation = NavType.INMAINMENU;
          }

        } else if (button.ID == this.MUTE) {
          if (muteGame){
            musicPlayer.loopCurrent();
          }else{
            musicPlayer.pause();
          }
          muteGame = !muteGame;
        } else if (button.ID == this.RESOLUTION) {
          resolutionIndex = (resolutionIndex + 1) % (resolutions.length);
          surface.setSize(resolutions[resolutionIndex][0], resolutions[resolutionIndex][1]);
            if (width <= 600) {
              useSmallLayout = true;
            }
            else{
              useSmallLayout = false;
            }
            resizeProgram();
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
  void useSmallLayout() {
    this.yOffset = height / 12;
    this.xOffset = width * 2.1/3;

    float btnWidth = width / 2;
    float btnHeight = height / 6;

    float newXStartPos = width / 30;
    float ySpacing = (height / 4.5);

    int btnFontSize = floor(height/15);
    float newQuadOffset = 35;
    boolean useBtnAnimation = false;

    this.resizeButtons(btnWidth, btnHeight, newXStartPos, ySpacing, btnFontSize, useBtnAnimation, newQuadOffset);
    this.resizeMenuTextElements();
  }


  /*
   * Resizes menu elements according to a larger screen.
   *
   * @return None
   */
  void useBigLayout() {
    this.yOffset = floor(height/3.33);
    this.xOffset = (width/5) * 4;

    float newXStartPos = width / 15;
    float ySpacing = (height / 8);

    float btnWidth = width / 3;
    float btnHeight = height / 12;


    int btnFontSize = floor(height/25);
    float newQuadOffset = 60;
    boolean useBtnAnimation = true;

    this.resizeButtons(btnWidth, btnHeight, newXStartPos, ySpacing, btnFontSize, useBtnAnimation, newQuadOffset);
    this.resizeMenuTextElements();
  }

  /*
   * Resizes the menu buttons to new dimensions and position. Adapted to a 2.5 ratio.
   *
   * @param btnWidth    The new width of the main button
   * @param btnHeight    The new height of the main button
   * @param xPosBtn   The x-coordinate to use for all main buttons
   * @param ySpacing    The space between buttons on the y-axis. Measured from the center of buttons.
   * @param btnFontSize   The new font size of the buttons
   * @param useBtnAnimation   Whether to use a button animation
   * @param newQuadOffset    The new quad offset to use on the buttons
   *
   * @return None
   */
  void resizeButtons(float btnWidth, float btnHeight, float xPosBtn, float ySpacing, int btnFontSize, boolean useBtnAnimation, float newQuadOffset){
    for (int i = 0; i < this.settingsMenuButtons.length; ++i) {
      Button btn = this.settingsMenuButtons[i];
      float yPosBtn = this.yOffset + ySpacing * i;


      btn.setBtnDimensions(btnWidth, btnHeight);
      btn.setBtnPosition(xPosBtn, yPosBtn);

      btn.setQuadOffset(newQuadOffset);
      btn.setAnimation(useBtnAnimation);

      btn.setBtnTextFont(createFont("data/fonts/good times rg.ttf", btnFontSize, true));
    }
  }

  /*
   * Resizes the menu text elements that aren't buttons, according to current window dimensions.
   *
   * @return None
   */
  void resizeMenuTextElements() {
    //TBD: Implement so that e.g. screen resolution text is resized.
    if(useSmallLayout){

    }
    else{

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
  }
}
