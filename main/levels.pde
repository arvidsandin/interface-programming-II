/*
 * A class for holding game levels made from GameObjects 
 */
class Level{
  
  GameObject[] level;

  /*
   * Creates a level
   *
   * @return A new level object
   */
  Level(){
    this.level = new GameObject[]{
      new GameObject("rectangle", 800, 450, 2895, 200, 0, 0, color(123, 132, 123)),
      new GameObject("rectangle", 200, 275, 120, 600, 0,0, color(123, 132, 123), "data/texture/building_liver.png"),
      new GameObject("rectangle", 800, 265, 40, 180, 0, 0, color(123, 132, 123), "data/texture/piskel_2.png"),
      new GameObject("rectangle", 2550, 250, 300, 100, 0, 0, color(200, 100, 240))
    };
  }
  
  /*
   * Returns the game level contained in the object
   *
   * @return The game level 
   */
  GameObject[] getLevel(){
    return this.level;
  }
}
