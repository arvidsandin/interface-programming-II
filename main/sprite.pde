/*
 * A class for animated or static sprites to be visualized
 */
class Sprite{
  // We use some "global variables" for the main class (i.e., this tab). 
  float x, y, w, speed, index;
   
  // The length of this sprite. 
  //
  int len;
  
  // A list of small images containing the separate frames. 
  //
  ArrayList<PImage> animation;
  
  // The Constructor. One trick to avoid the problem of finding good names of 
  // variables in the constructor is to use a trailing "_" (underscore) for the
  // input variables.
  //
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
    index = 0.0;
  }
  
}
