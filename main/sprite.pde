/*
 * A class for animated or static sprites to be visualized. 
 * Code adapted from Lars Oestricher in the course Interface Programming II, at Uppsala University.
 */
class Sprite {
  // x, y correspond to index position of  
  float x, y, w, speed, index;

  // The length of this sprite. 
  int len;

  // A list of image lists; animation sequences of small images containing the separate frames. 
  ArrayList<PImage> animation;


/***************************************************************************************************************************************************
 *  MODEL
 ***************************************************************************************************************************************************
 */
  // The Constructor. One trick to avoid the problem of finding good names of 
  // variables in the constructor is to use a trailing "_" (underscore) for the
  // input variables.
  Sprite(ArrayList<PImage> animation_, float x_, float y_, float speed_) {
    this.x = x_;
    this.y = y_;

    // Making a copy of the animated list. 
    // 
    animation = new ArrayList<PImage>();

    for (PImage img : animation_) { 
      animation.add(img);
    }

    // A small calculation of the width of each animation.
    //
    w = animation.get(0).width;

    // The length of the animation sequence (the number of images) 
    len = animation.size();

    // The movement speed. 
    //
    speed = speed_;

    // The index is the basic counter, which is used to select the right 
    // image in the sequence. Note that it is a floating point number,
    // which is turned into an integer, through the modulo operation (below)
    // when it is used as an selector. 
    //
    // Animations that go toward the negative x-axis expected to start from the left
    index = 0.0;

    // Animations that go toward the negative x-axis expected to start from the right
    if (speed_ < 0) {
      index = len;
    }
  }

  // This function performs the movement in terms of calculations
  // 
  void animate(float xPos, float yPos) {

    // The index number is updated with the speed. Note that speed
    // is a floating point number. 
    // 
    if (this.speed < 0.0 && index <= 0.0) {
      index = len;
    }
    
    // If the speed is set to zero, we have a sprite that is stationary
    this.index += this.speed;
    this.x = xPos;
    this.y = yPos;


    // The new x-position is calculated using an accelerator on the speed. 
    // Remember that there is a framerate setting that will change the overall speed
    // of the animation. 
    // 
    x += this.speed * 5;

    // We need to check for the border cases. This is similar to checking for 
    // collisions in other animations. 
    //
  }

  void resetIndex() {
    if (this.speed < 0) {
      index = len -1;
    } else {
      index = 0.0;
    }
  }
  
/***************************************************************************************************************************************************
 *  VIEW
 ***************************************************************************************************************************************************
 */
 
  // This function performs the selection of the sprite, 
  // and draws the image on the screen.
  //
  void show() {

    // The current sprite is addressed by a simple calculation 
    // with the modulo operator over the index number.
    int ix = abs(floor(this.index) % len);   

    pushStyle();
    // Draw the current image on the right place on the screen. 
    // 
    image(animation.get(ix), this.x, this.y);

    popStyle();
  }
}
