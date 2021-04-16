

class Menu{
  int ID;
  
  Button[] menuButtons;
  String[] menuTextElements;
  
  
  Menu(int ID, Button[] menuButtons, String[] menuTextElements){
    
    
  }
  
}

/*
 * Click while in the menu
 * 
 * @param x  x-value of the point to click at
 * @param y  y-value of the point to click at
 * @return None
*/
void mainMenuClick(int x, int y){
  for (Button button:mainMenuButtons){
    if (button.isInside(x, y)){
      //button.doSomething
      break;
    }
  }
}
