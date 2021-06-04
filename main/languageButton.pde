
/*
 * A class which defines a button as being associated with a language and its flag
 * 
 */
class LanguageButton extends Button{
  boolean isSelected = false;
  int language;

/***************************************************************************************************************************************************
 *  MODEL
 ***************************************************************************************************************************************************
 */
  
  /*
     * Constructor with for a button associated with a language. Defines buttons dimensions, text, color, and animation or line for the LanguageButton object, plus a background image and quadOffset
     *
     * @param language    The button's associated language, defined by an integer
     * @param ID    The button's ID. Not guaranteed to be unique
     * @param withLine          Whether the button should have a line to the edge of the screen's left side
     * @param animateBtn    States whether the button should have animated height
     * @param btnText    The button's text
     * @param xPos    The button's x position, relative to its upper left corner
     * @param yPos    The button's y position, relative to its upper left corner
     * @param btnWidth    The button's width
     * @param btnHeight    The button's height
     * @param btnColor    The button's color
     * @param btnBorderColor    The button border's color
     * @param quadOffset      Amount of right-sided slant on the button
     * @param flagImage    Path to the flag image of the button, relative to the sketch
     *
     * @return A new Button object
     */
  LanguageButton(int language, int ID, boolean withLine, boolean animateBtn, String btnText, float xPos, float yPos, float btnWidth, float btnHeight, color btnColor, color btnBorderColor, float quadOffset, String backgroundImage){
   super(ID, withLine, animateBtn, btnText, xPos, yPos, btnWidth, btnHeight, btnColor, btnBorderColor,  quadOffset, backgroundImage); 
    
   // ID of language button should correspond to index used for languages in the "main" sketch
   this.language = language;
  }

/***************************************************************************************************************************************************
 *  VIEW
 ***************************************************************************************************************************************************
 */

  /*
   *  Draws the language button, with an optional border highlight if it is currently selected in the program
   *
   */
  @Override
  void drawBackgroundImage(){
    pushStyle();
      if(language == currentLanguage){
        rectMode(CORNER);
        strokeWeight(6);
        stroke(this.btnBorderColor);
        
        rect(this.xPos, this.yPos, this.btnWidth, this.btnHeight);
      }
      
    super.drawBackgroundImage();
    popStyle();
  }
}
