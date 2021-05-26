

class ArrowButtons{
  Button LeftButton;
  Button RightButton;
  
  
  ArrowButtons(int ID, boolean withLine, boolean animateBtn, String btnText, color btnTextColor, PFont textFont, float xPos, float yPos, float btnWidth, float btnHeight, color btnColor, color btnBorderColor, float quadOffset){
   
    LeftButton = new Button(ID, withLine, animateBtn, "<", xPos, yPos, btnWidth, btnHeight, btnColor, btnBorderColor, quadOffset);
    RightButton =  new Button(ID +1, withLine, animateBtn, ">", xPos *2, yPos, btnWidth, btnHeight, btnColor, btnBorderColor, quadOffset);
    }
    //if(i != BACK){
    //    println(xPosBtn + ", " + yPosBtn);
    //    settingsMenuButtons[i] = new Button(i, withLine, animate, "<", xPosBtn, yPosBtn, btnWidth, btnHeight, this.btnColor, this.btnBorderColor, quadOffset);
    //    settingsMenuButtons[i + 1] = new Button(i +1, withLine, animate, ">", xPosBtn *2, yPosBtn, btnWidth, btnHeight, this.btnColor, this.btnBorderColor, quadOffset);
    //  }
    //  else{
    //    settingsMenuButtons[i] = new Button(i, true, this.btnTexts[currentLanguage][BACK], xPosBtn, yPosBtn, this.btnColor, this.btnBorderColor);
    //  }
  
//SMALL
//    float btnWidth = width / 12;
//    float btnHeight = height / 18;
//   float newXStartPos = width / 80;
//float newQuadOffset = 20;

// LARGE
//
//float btnWidth = width / 12;
//    float btnHeight = height / 18;
//float newXStartPos = width / 100;
//float newQuadOffset = 22;


// use in constructor
    //float quadOffset = 22;
    
    //boolean withLine = false;
    //boolean animate = false;
    
    //    float btnWidth = width / 12;
    //float btnHeight = height / 18;
    
    
    // When resizing
    //if(i != BACK){
    //    btn.setBtnDimensions(btnWidth, btnHeight);
    //  }
    //  else{
    //    btn.setBtnDimensions(width /3.0, height /12.0);
    //  }

    
}
