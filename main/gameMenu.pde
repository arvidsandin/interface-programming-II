public class GameMenu implements Menu{

color btnColor = color(170,183,249);
color btnBorderColor = color(110,123,189);

float btnWidth = windowWidth / 4;
float btnHeight = windowHeight / 15;

color textColor = color(255);
PFont textFont = createFont("Arial", 17, true);

int topOffset = 180;

Button[] gameMenuButtons = new Button[4];


  GameMenu(){
    
    createMenuButtons();
  }

  void createMenuButtons(){
    
    String[] btnText = new String[]{"CONTINUE", "SETTINGS", "CHOOSE LEVEL", "MAIN MENU"};
    
    float widthFrac = 2;
    float heightFrac = 12;
    
    color textColor = color(255);
        

    for(int i = 0; i < gameMenuButtons.length; i++){
      float xposBtn = (windowWidth + (this.btnWidth/2))/widthFrac;
      float yposBtn = topOffset + (windowHeight / heightFrac) * i;
      
      gameMenuButtons[i] = new Button(i, btnText[i], this.textColor, this.textFont, xposBtn, yposBtn, this.btnWidth, this.btnHeight, this.btnColor, this.btnBorderColor);
    }
  }
  
  void drawMenu(){
      pushStyle();
      textAlign(CENTER);
      
      //Draw game menu buttons
      for(int i = 0; i < gameMenuButtons.length; i++){
        gameMenuButtons[i].drawMe();
      }
      
      //Draw menu text
      this.drawTextElements();
      
      popStyle();
  }
  
  void drawTextElements(){
    
  }
}
