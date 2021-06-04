
/*
 * An interface for menus and the necessary functions they must implement
 */
interface Menu{
  
  // ENUMS NOT ACTUALLY IN USE - PROCESSING DISALLOWING IT
  
   //Enum for each main menu button
  enum mainMenuButtonType{
    START,
    SETTINGS,
    TUTORIAL,
    QUIT,
  }
  
  //Enum for each game menu button
  enum gameMenuButtonType{
  GAME_RETURN,
  GAME_SETTINGS,
  GAME_LEVEL,
  EXIT_BUTTON,
  }
  
  //Enum for each tutorial menu button
  enum tutorialMenuButtonType{
    MOVE_TUTORIAL,
    JUMP_TUTORIAL,
    GRAB_TUTORIAL,
    EXIT_BUTTON,
  }

  void drawMenu();
  void menuClick();
  void resize();
  void updateMenuLanguage();
}
