
/*
 * An interface for menus and their necessary functions they must implement
 */
interface Menu{
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

  void createMenuButtons();
  void drawMenu();
  void drawTextElements();
}
