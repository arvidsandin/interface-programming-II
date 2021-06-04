/*
 * A class for handling the 2D settings menu; buttons and their respective actions
 */
class SettingsMenu implements Menu {
  Button[] settingsMenuButtons;

  PImage menuBackground = loadImage("data/menu_images/MenuGradient.png");

  color btnColor = color(170, 183, 249);
  color btnBorderColor = color(110, 123, 189);
  String[][] btnTexts = new String[][]{{"RESOLUTION", "MUSIC", "SOUND", "BACK"}, {"UPPLÖSNING", "MUSIK", "LJUD", "TILLBAKA"}, {"RESOLUCIÓN", "MUSICA", "SONIDO", "REGRESA"}};

  float yOffset = floor(height/3.33);
  float xOffset = (width/5) * 4;

  int[][] resolutions = new int[][]{{1920, 1080}, {1280, 720}, {854, 480}, {640, 360}};
  int resolutionIndex = 1;
  // Determine where to write current resolution
  float resolutionXPos = width/20;
  float resolutionYPos = height/15;

  int settingsFontSize = ceil(height/15);
  PFont settingsTextFont = createFont("data/fonts/good times rg.ttf", this.settingsFontSize, true);

  // Either song title or audio off is shown
  float musicXPos = width/20;;
  float musicYPos = resolutionYPos * 2;
  String[] songTitles = {"House", "Boundless Energy"};
  
  // Song controls in settingsMenu
  MusicPlayer musicPlayer;
  
  float muteXPos = width/20;;
  float muteYPos = musicYPos * 2;
  String[][] noAudioText = {{"OFF", "ON"}, {"AV", "PÅ"}, {"APAGADO", "PUESTO"}};
  float[] noAudioTextPos;

   // Previously used for "looping settings" buttons 
  int RESOLUTIONTEXT = 0;
  int MUSICTEXT = 1;
  int MUTETEXT = 2;
  int BACKTEXT = 3;
  
  // Used with arrow buttons
  // 7 in total
  int RESOLUTION = 0;
  int MUSIC = RESOLUTION + 2;
  int MUTE = MUSIC + 2;
  int BACK = MUTE + 2;
  
  int BACKWARD = 0;
  int FORWARD = 1;

  /***************************************************************************************************************************************************
   *  MODEL
   ***************************************************************************************************************************************************
   */

  /*
   * Sets up fonts and menu buttons to be included in the settings menu
   *
   * @param m   The sketch program that runs the setup and draw functions
   * @return A new SettingsMenu object
   */
  SettingsMenu(main m) {
    // Initialize length of empty button array
    this.settingsMenuButtons = new Button[BACK +1];
    
    float xPosBtn1 = width / 40;
    float xPosBtn2 = width / 20;
    float arrowBtnWidth = width / 8.0;
    float arrowBtnHeight = height / 18.0;
    
    for (int i = 0; i < this.settingsMenuButtons.length; i +=2) {
      float yPosBtn = this.yOffset + (height / 8) * i;
      
        // To avoid going out of array bounds
        if(i < BACK){
          settingsMenuButtons[i] = new Button(i, false, false, "<", xPosBtn1, yPosBtn, arrowBtnWidth, arrowBtnHeight, this.btnColor, this.btnBorderColor);
          settingsMenuButtons[i +1] = new Button(i +1, false, false, ">", xPosBtn2, yPosBtn, arrowBtnWidth, arrowBtnHeight, this.btnColor, this.btnBorderColor);
        }
        else{
          
          // Sets a normal button
         settingsMenuButtons[i] = new Button(i, true, this.btnTexts[currentLanguage][BACKTEXT], xPosBtn1, yPosBtn, this.btnColor, this.btnBorderColor);
       }
      }
      
    musicPlayer = new MusicPlayer(m);

    // "Global" variable. Resize created menu and buttons if necessary
    if (useSmallLayout) {
      this.resize();
    }

    // SetS position of all button texts
    resizeMenuTextElements();
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
   * load music files and starts playing the music if unmuted (and is quite slow)
   * @return None
   */
  public void loadMusicFiles(){
    musicPlayer.loadFiles();
    if(!muteGame){
      musicPlayer.loopTrack(selectedSong);
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
          if (inGame) {
            navigation = NavType.INGAMEMENU;
            returnToGame();
          } 
          else {
            navigation = NavType.INMAINMENU;
          }
        }
        else if(button.ID == this.MUTE + BACKWARD || button.ID == this.MUTE + FORWARD){
          muteGame = !muteGame;
          if(musicPlayer.isPlaying()){
            musicPlayer.pause();
          }
          if(!muteGame){
             musicPlayer.loopTrack(selectedSong);
          }
          
          String[] settings = loadStrings("data/settings/settings.txt");
          settings[0] = String.valueOf(muteGame);
          saveStrings("data/settings/settings.txt", settings);
        }
        else if (button.ID == this.MUSIC + BACKWARD || button.ID == this.MUSIC + FORWARD) {
          if(button.ID == this.MUSIC + BACKWARD){
            // Left arrow - go forward
            selectedSong = abs(selectedSong -1) % 2;
          }
          else{
            // Right arrow - go backward
            selectedSong = (selectedSong +1) % 2;
          }
          
          if(!muteGame){
            musicPlayer.loopTrack(selectedSong);
          }
        } 
        else if (button.ID == this.RESOLUTION + BACKWARD || button.ID == this.RESOLUTION + FORWARD) {
          if(button.ID == this.RESOLUTION + BACKWARD){
            // Left arrow - go backward
            resolutionIndex = resolutionIndex - 1;
            
          }
          else{
            // Right arrow - go forward
            resolutionIndex = resolutionIndex + 1;
          }
          
          resolutionIndex = abs(resolutionIndex) % (resolutions.length);
          
          surface.setSize(resolutions[resolutionIndex][0], resolutions[resolutionIndex][1]);
          if (width <= 700) {
            useSmallLayout = true;
          } 
          else {
            useSmallLayout = false;
          }
          resizeProgram();

          String[] settings = loadStrings("data/settings/settings.txt");
          settings[1] = String.valueOf(resolutionIndex);
          saveStrings("data/settings/settings.txt", settings);
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
  void resize() {
    if (useSmallLayout) {
      this.useSmallLayout();
    } else {
      this.useBigLayout();
    }
    reloadBackground();
  }

  /*
   * Resizes menu elements to be more visible on a small screen.
   *
   * @return None
   */
  void useSmallLayout() {
    this.yOffset = height / 12;
    this.xOffset = width * 2.1/3;


    float newXStartPos = width / 30;
    float ySpacing = (height / 4.5);
    
    // Button dimensions and position for back button
    float newXPosBackBtn = width / 100;
    float ySpacing = (height / 8);


    // Button dimensions and position for arrow buttons
    float newXPosArrowBtn = width / 3;
    float xPosBtn2 = width / 1.6;
    
    float arrowBtnWidth = width / 10.0;
    float arrowBtnHeight = height / 16.0;

    int btnFontSize = floor(height/15);
    float newQuadOffset = 25;
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

    // Button dimensions and position for back button
    float newXPosBackBtn = width / 100;
    float ySpacing = (height / 8);


    // Button dimensions and position for arrow buttons
    float newXPosArrowBtn = width / 3;
    float xPosBtn2 = width / 1.6;
    
    float arrowBtnWidth = width / 10.0;
    float arrowBtnHeight = height / 16.0;


    int btnFontSize = floor(height/25);
    float newQuadOffset = 35;
    boolean useBtnAnimation = true;

    this.resizeButtons(arrowBtnWidth, arrowBtnHeight, newXPosArrowBtn, newXPosBackBtn, ySpacing, btnFontSize, useBtnAnimation, newQuadOffset);
    this.resizeMenuTextElements();
  }

  /*
   * Resizes the menu buttons to new dimensions and position. Adapted to a 2.5 ratio.
   *
   * @param arrowBtnWidth    The new width of the main button
   * @param arrowBtnHeight    The new height of the main button
   * @param xPosBtnArrow   The x-coordinate to use for the arrow buttons
   * @param xPosBtnBack   The x-coordinate to use for the back button
   * @param ySpacing    The space between buttons on the y-axis. Measured from the center of buttons.
   * @param btnFontSize   The new font size of the buttons
   * @param useBtnAnimation   Whether to use a button animation
   * @param newQuadOffset    The new quad offset to use on the buttons
   *
   * @return None
   */
  void resizeButtons(float arrowBtnWidth, float arrowBtnHeight, float xPosBtnArrow, float xPosBtnBack, float ySpacing, int btnFontSize, boolean useBtnAnimation, float newQuadOffset) {

    for (int i = 0; i < this.settingsMenuButtons.length; i += 2) {
      Button btn = this.settingsMenuButtons[i];
      float yPosBtn = this.yOffset + ySpacing/2.0 * i;
      
      if(i < BACK){
        // A second button to resize at the same y-coordinate
        Button btn2 = this.settingsMenuButtons[i +1];
        
        btn.setBtnDimensions(arrowBtnWidth, arrowBtnHeight);
        btn2.setBtnDimensions(arrowBtnWidth, arrowBtnHeight);
        
        btn.setBtnPosition(xPosBtnArrow, yPosBtn);
        btn2.setBtnPosition(xPosBtnArrow /2.0, yPosBtn);
    
        btn.setQuadOffset(newQuadOffset);
        btn2.setQuadOffset(newQuadOffset);
        
        btn2.setBtnTextFont(createFont("data/fonts/good times rg.ttf", btnFontSize, true));
      }
      else{
        float btnWidth;
        float btnHeight;
        
        if(useSmallLayout){
          newQuadOffset = 35;
          
          btnWidth = width / 2;
          btnHeight = height / 6;
        }
        else{
          newQuadOffset = 60;
          btnWidth = width / 3.5;
          btnHeight = height / 12;
        }
        btn.setBtnDimensions(btnWidth, btnHeight);
        btn.setBtnPosition(xPosBtnBack, yPosBtn);
    
        btn.setQuadOffset(newQuadOffset);
        // May use animation
        btn.setAnimation(useBtnAnimation); 
      }

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
    if (useSmallLayout) {
      this.settingsFontSize = ceil(height/15);
    } else {
      this.settingsFontSize = ceil(height/25);
    }
    this.settingsTextFont = createFont("data/fonts/good times rg.ttf", this.settingsFontSize, true);

    // Update position of resolution option text
    resolutionXPos = settingsMenuButtons[RESOLUTION].getXPos() + settingsMenuButtons[RESOLUTION].getBtnWidth() + width/10.0;
    resolutionYPos = settingsMenuButtons[RESOLUTION].getYPos() + settingsMenuButtons[RESOLUTION].getBtnHeight()/2.0 + 8;

    // Update position of music option text
    musicXPos = settingsMenuButtons[MUSIC].getXPos() + settingsMenuButtons[MUSIC].getBtnWidth() + width/10.0;
    musicYPos = settingsMenuButtons[MUSIC].getYPos() + settingsMenuButtons[MUSIC].getBtnHeight()/2.0 + 8;

    // Set position of mute option text
    muteXPos = settingsMenuButtons[MUTE].getXPos() + settingsMenuButtons[MUTE].getBtnWidth() + width/10.0;
    muteYPos = settingsMenuButtons[MUTE].getYPos() + settingsMenuButtons[MUTE].getBtnHeight()/2.0 + 8;
  }

  /*
   * Ensures the background is only reloaded if window size changes
   *
   * @return None
   */
  void reloadBackground() {
    if (menuBackground.width != width ||  menuBackground.height != height) {
      menuBackground = loadImage("data/menu_images/MenuGradient.png");
      menuBackground.resize(width, height);
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
    // An image must be the same pixel size as the background
    reloadBackground();
    
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
    pushStyle();
    textFont(settingsTextFont);
    textAlign(CENTER);
    int mute = muteGame ? 0 : 1;

    text(String.valueOf(resolutions[resolutionIndex][0]) + " x " + String.valueOf(resolutions[resolutionIndex][1]), resolutionXPos, resolutionYPos);
    
    text(songTitles[selectedSong], musicXPos, musicYPos);

    text(noAudioText[currentLanguage][mute], muteXPos, muteYPos);
    

    // Puts out accompanying option description text
    text(btnTexts[currentLanguage][RESOLUTIONTEXT], settingsMenuButtons[RESOLUTION].getXPos() /2, settingsMenuButtons[RESOLUTION].getYPos() + settingsMenuButtons[RESOLUTION].getBtnWidth()/4);
    text(btnTexts[currentLanguage][MUSICTEXT], settingsMenuButtons[MUSIC].getXPos() /2, settingsMenuButtons[MUSIC].getYPos() + settingsMenuButtons[MUSIC].getBtnWidth()/4);
    text(btnTexts[currentLanguage][MUTETEXT], settingsMenuButtons[MUTE].getXPos() /2, settingsMenuButtons[MUTE].getYPos() + settingsMenuButtons[MUTE].getBtnWidth()/4);
    
    
    popStyle();
  }
}
