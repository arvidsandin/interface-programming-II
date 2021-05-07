/*
 * A class for the game map.
 */
class Map {
  float gravity;
  float friction;
  float xOffset = 0;
  float yOffset = 0;
  //how far to the sides the player can go before the world moves instead of player, as a fraction of width
  float playerBoundryX = 0.6;
  //how far up or down the player can go before the world moves instead of player, as a fraction of height
  float playerBoundryY = 0.6;
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


  void updateXOffset(float x){
    xOffset = x;
  }

  void updateYOffset(float y){
    yOffset = y;
  }

  
  void moveMe(){
   for (GameObject object : objects) {
     object.moveMe(xOffset, yOffset);
   }
  }
  
  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */
  /*
   * Draws up the map
   *
   * @return None
   */
    void drawMe(){
      push();
      background(137, 209, 254);
      for (GameObject object : objects) {
        if (object.isVisible()){
          object.drawMe();
        }
      }
      pop();
    }




}
