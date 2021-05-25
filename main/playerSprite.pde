/*
 * A class for handling the sprites of a Player object's sprite sheet. Acts as the animation controller.
 */
class PlayerSprite{
  // The dimensions of each sprite
  int spriteHeight = 500;
  int spriteWidth = 400;
  // The number of sprites in each row of the spritesheet.
  int[] spriteSize = {2, 13, 13, 3, 3};
  // The direction of movement for each sprite: -1 is left, 1 is right
  int[] spriteDir = {-1, 1};
  
  // We store sequences of images in an ArrayLists.
  ArrayList<Sprite> animationSequences = new ArrayList<Sprite>();
  
  int currentSequence = 0;

  int STAND = 0;
  int RUN = STAND + 2;
  int CLIMB = RUN + 2;
  // Jump animations currently not used
  int JUMP = CLIMB + 2;
  
  int RIGHTMOVE = 0;
  int LEFTMOVE = 1;
  
  boolean isFacingLeft = false;

/***************************************************************************************************************************************************
 *  MODEL
 ***************************************************************************************************************************************************
 */

  /*
   * Creates the sets of sprite animations that the Player will use.
   * Expects sprites in the following row order: right and left sprite sequences, with  standing, running, and climbing
   *
   * @param p   The player to which the animations belong to
   * @param spriteSheetPath   The folder path to the sprite sheet
   * @return A new PlayerSprite object
   */
  PlayerSprite(Player p, String spriteSheetPath){
    // Loads the sprite 
    PImage spriteSheet = loadImage(spriteSheetPath);
    
    // Temporary array list for each animation sequence
    ArrayList<PImage> animation = new ArrayList<PImage>();
    Sprite spriteSequence;
    
    for  (int i = 0; i < this.spriteSize.length; i++) {
    // Selecting the row coordinate for animation sequence. 
    int y = i * this.spriteHeight;
    
    // Separating the images of each row. 
    for (int j = 0; j < spriteSize[i]; j++) {
       // Find the coordinates and sizes of each individual image in the row. 
      int x = j * this.spriteWidth;
      
      // We pick the img from the spritesheet at position x, y and w wide, and h high.
      PImage img = spriteSheet.get(x, y, this.spriteWidth, this.spriteHeight);
      
      img.resize((int) p.getWidth() + 40, (int) p.getHeight());
      // We add this to the animation sequence.
      animation.add(img);
      
      // Special case for standing animation: two sprites on the same row separated into two animations
      // Split up by adding first animation sequence and then clearing the animation array
      if(i == STAND && j == RIGHTMOVE){
        spriteSequence = new Sprite(animation, p.getXPos(), p.getYPos(), this.spriteDir[1] * 0.25);
        this.animationSequences.add(spriteSequence);
        animation = new ArrayList<PImage>();
      }
    }
    float climbAnim = 0.0;
    // Each animation sequence of a separate sprite is stored in spriteAnimations, for use in the
    // draw method.
    if(i >= 3){
      climbAnim = 0.12 * - this.spriteDir[i % 2];
    }
    
    spriteSequence = new Sprite(animation, p.getXPos(), p.getYPos(), climbAnim + this.spriteDir[i % 2] * 0.25);
    //SpriteDir's index corresponds to the sprite sheet's animation direction. 
    // Can be stationary, right or left.
    this.animationSequences.add(spriteSequence);
    
    //Then we reset the animation variable, for a new sequence.
    animation = new ArrayList<PImage>();
    }
  }
  
  /*
   * Determines which animation the player should use in its current state
   *
   * @param p  The player for which to select an animation
   * @return None
   */
  void animate(Player p){
    // Sprite animations along x-axis
    // Selects correct sequence according to player state
    if (p.getXSpeed() == 0 && p.isClimbing()){
      // Reset animation sequences if not previously active
      if(currentSequence != CLIMB + LEFTMOVE && currentSequence != CLIMB + RIGHTMOVE){
        resetAnimationSequence(CLIMB + LEFTMOVE);
        resetAnimationSequence(CLIMB + RIGHTMOVE);
      }
      // Check which direction animation should run in
      if (this.isFacingLeft){
        currentSequence = CLIMB + LEFTMOVE;    //Climbing left
      }
      else{
        currentSequence = CLIMB + RIGHTMOVE;   //Climbing right
      }
    }
    else if (p.getXSpeed() == 0){
      // Reset animation sequences if not previously active
      // CURRENTLY 1 SPRITE. Can be extended to handle idle animations
      if(currentSequence != STAND + LEFTMOVE && currentSequence != STAND + RIGHTMOVE){
        resetAnimationSequence(STAND + LEFTMOVE);
        resetAnimationSequence(STAND + RIGHTMOVE);
      }
      // Check which direction animation should run in
      if (this.isFacingLeft){
        currentSequence = STAND + LEFTMOVE;  //Standing left
      }
      else{
        currentSequence = STAND + RIGHTMOVE; //Standing right
      }
      
    }
    else if (p.getXSpeed() > 0){
        this.isFacingLeft = false;
        // Reset animation sequence if not previously active
        if(currentSequence != RUN + RIGHTMOVE){
          resetAnimationSequence(RUN + RIGHTMOVE);
        }
        currentSequence = RUN + RIGHTMOVE;
      }
     else{
        this.isFacingLeft = true;
        if(currentSequence != RUN + LEFTMOVE){
          resetAnimationSequence(RUN + LEFTMOVE);
        }
        currentSequence = RUN + LEFTMOVE;
    }
    // Will animate the current sequence after selecting the right one
    this.animationSequences.get(currentSequence).animate(p.getXPos(), p.getYPos());
  }
  
  /*
   * Resets an animation sequence to the beginning
   *
   * @param sequenceToReset   The index of the animation to reset
   * @return None
   */
  void resetAnimationSequence(int sequenceToReset){
    animationSequences.get(sequenceToReset).resetIndex();
  }
  
/***************************************************************************************************************************************************
 *  VIEW
 ***************************************************************************************************************************************************
 */
   
  /*
   * Displays the current player sprite
   *
   * @return None
   */
  void showAnimation(){
    this.animationSequences.get(currentSequence).show();
  }
}
