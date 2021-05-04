/*
 * A class for the map
 */
class Map {
  float gravity;
  float friction;
  /*
   * Constructor to set all attributes of Map class
   *
   * @param g    Gravity, the downward constant acceleration
   * @param f    Friction, how much speed is countered
   * @return A new Map object
   */
  Map(float g, float f){
    this.gravity = g;
    this.friction = f;
  }

  /*
   * Draws up the map
   *
   * @return None
   */
    void drawMe(){
      
      parallaxBg.drawParallax();
      
    }




}
