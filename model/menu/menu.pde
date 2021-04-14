float xpos = 300;
float ypos = 100;
float btnWidth = 200;
float btnHeight = 75;
int btnRounding = 8;
color btnColor = color(170,183,249);
color btnBorder = color(110,123,189);




int  windowWidth = 1200;
int  windowHeight = 600;
/*

*/
void setup(){
 size(1200, 600); 
 background(137, 209, 254); 
 rectMode(CENTER);
}

/*

*/
void draw(){
  
  Button startBtn = new Button(windowWidth/5, windowHeight/5, btnWidth, btnHeight, btnRounding, btnColor, btnBorder);
  Button settingsBtn = new Button(windowWidth/5, (windowHeight/5) * 2, btnWidth, btnHeight, btnRounding, btnColor, btnBorder);
  Button tutorialBtn = new Button(windowWidth/5, (windowHeight/5) * 3, btnWidth, btnHeight, btnRounding, btnColor, btnBorder);
  Button quitBtn = new Button(windowWidth/5, (windowHeight/5) * 4, btnWidth, btnHeight, btnRounding, btnColor, btnBorder);
  
  
  startBtn.drawMe();
  settingsBtn.drawMe();
  tutorialBtn.drawMe();
  quitBtn.drawMe();
}
