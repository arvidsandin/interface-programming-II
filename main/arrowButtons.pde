/*
 *
 *
 */

class ArrowButtons extends Button{
  Button rightButton;
  String textBeforeBtns;
  
  
  ArrowButtons(int ID, boolean withLine, boolean animateBtn, String btnText, float xPos, float yPos, float xSpace, float btnWidth, float btnHeight, color btnColor, color btnBorderColor, float quadOffset){
    
    super(ID, withLine, animateBtn, "<", xPos, yPos, btnWidth, btnHeight, btnColor, btnBorderColor, quadOffset);
    
    this.textBeforeBtns = btnText;
    this.rightButton =  new Button(ID +1, withLine, animateBtn, ">", xPos + xSpace, yPos, btnWidth, btnHeight, btnColor, btnBorderColor, quadOffset);
    }
    //if(i != BACK){
    //    println(xPosBtn + ", " + yPosBtn);
    //    settingsMenuButtons[i] = new Button(i, withLine, animate, "<", xPosBtn, yPosBtn, btnWidth, btnHeight, this.btnColor, this.btnBorderColor, quadOffset);
    //    settingsMenuButtons[i + 1] = new Button(i +1, withLine, animate, ">", xPosBtn *2, yPosBtn, btnWidth, btnHeight, this.btnColor, this.btnBorderColor, quadOffset);
    //  }
    //  else{
    //    settingsMenuButtons[i] = new Button(i, true, this.btnTexts[currentLanguage][BACK], xPosBtn, yPosBtn, this.btnColor, this.btnBorderColor);
    //  }
    
    
    //@Override
    //void setBtnDimensions(float btnWidth, float btnHeight){
    //  println("OVERFLOW?");
    //  this.setBtnDimensions(btnWidth, btnHeight);
    //  rightButton.setBtnDimensions(btnWidth, btnHeight);
    //}
    
    //@Override
    //void setBtnPosition(float xPos, float yPos){
    //  this.setBtnPosition(xPos, yPos);
    //  rightButton.setBtnPosition(xPos, yPos);
    //}
    
    
    boolean isInsideEither(){
      if(this.isInside() || rightButton.isInside()){
        return true;
      }
      else{
       return false; 
      }
    }
  
    boolean isInsideLeftArrow(){
      if(this.isInside()){
        return true;
      }
      else{
       return false; 
      }
      
    }
    
    boolean isInsideRightArrow(){
      if(rightButton.isInside()){
        return true;
      }
      else{
       return false; 
      }
    }
    
    //void setQuadOffset(float quadOffset){
    //  this.setQuadOffset(quadOffset);
      
    //  rightButton.setQuadOffset(quadOffset);
    //}
    
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


    
    // When resizing
    //if(i != BACK){
    //    btn.setBtnDimensions(btnWidth, btnHeight);
    //  }
    //  else{
    //    btn.setBtnDimensions(width /3.0, height /12.0);
    //  }

    
}
