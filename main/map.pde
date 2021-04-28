/*
 * A class for the map
 */
class Map {
  float gravity;
  float friction;
  float offset = 0;
  //how far to the right the player can go before the world moves instead of player as a fraction of width
  float playerBoundry = 0.7;
  GameObject[] objects;
  /*
   * Constructor to set all attributes of Map class
   *
   * @param g    Gravity, the downward constant acceleration
   * @param f    Friction, how much speed is countered
   * @param o    All the objects in the map
   * @return A new Map object
   */
  Map(float g, float f, GameObject[] o){
    this.gravity = g;
    this.friction = f;
    this.objects = o;
  }

  /*
   * Draws up the map
   *
   * @return None
   */
    void drawMe(){
      background(137, 209, 254);
      for (GameObject object : objects) {
        if (object.isVisible()){
          object.drawMe();
        }
      }
    }




}
