/*
 *  A class for handling the animation sprites of a Player object.
 */

class PlayerSprite{
  
  // The dimensions of each sprite
  int spriteHeight = 500;
  int spriteWidth = 400;
  
  int[] spriteSize;
  // The direction of movement for each sprite: -1 is left, 1 is right
  int[] spriteDir;
  
  ArrayList<Sprite> animations;
  
  int currentSequence = 0;
  
  boolean isFacingLeft = false;
  int STAND = 0;
  int RUN = 1;
  int CLIMB = 2;
  int JUMP = 3;
  int LEFTMOVE;
  int RIGHTMOVE;
  
  PlayerSprite(Player p, String spriteSheetPath){
    PImage spriteSheet = loadImage(spriteSheetPath);
    ArrayList<PImage> animation = new ArrayList<PImage>();
    this.animations = new ArrayList<Sprite>();
    
    for  (int i = 0; i < this.spriteSize.length; i++) {
    // Selecting the row coordinate for animation sequence. 
    
    
    int y = i * this.spriteHeight ;
    // Separating the images of each row. 
    //
    for (int j = 0; j < spriteSize[i]; j++) {
       // Find the coordinates and sizes of each individual image in the row. 
       // 
      int x = j * this.spriteWidth;
      
      // We pick the img from the spritesheet at position x, y and w wide, and h high.
      //
      PImage img = spriteSheet.get(x, y, this.spriteWidth, this.spriteHeight);
      img.resize((int) p.getWidth() + 30, (int) p.getHeight());
      // We add this to the animation sequence.
      // 
      animation.add(img);
    }
    
    float climbanim = 0.0;
    // Each animation sequence of a separate sprite is stored in spriteAnimations, for use in the 
    // draw method.
    if(i >= 3){
      climbanim = 0.12 * - this.spriteDir[i];
    }
    //SpriteDir's index corresponds to the sprite sheet's animation direction. Stationary, right or left.
    this.animations.add(new Sprite(animation, p.getXPos(), p.getYPos(), climbanim + this.spriteDir[i] * 0.25));
    
    //Then we reset the animation variable, for a new sequence.
    // 
    animation = new ArrayList<PImage>();
    }
    
  }
}
