/*
 * A class for the map
 */
class Map {
  float gravity;
  float friction;
  float offset = 0;
  //how far to the right the player can go before the world moves instead of player as a fraction of width
  float playerBoundry = 0.7;
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
      background(137, 209, 254);
    }




}
