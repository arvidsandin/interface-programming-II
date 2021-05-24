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
      new GameObject("rectangle", 200, 275, 120, 600, 0,0, color(123, 132, 123)),
      new GameObject("rectangle", 800, 265, 40, 180, 0, 0, color(123, 132, 123)),
      new GameObject("rectangle", 2550, 250, 300, 100, 0, 0, color(200, 100, 240))
    };
  }


 void level1(){
   this.level = new GameObject[]{
     new GameObject("rectangle", 800, 450, 2895, 200, 0, 0, color(123, 132, 123)),
     new GameObject("rectangle", 200, 275, 120, 600, 0,0, color(123, 132, 123)),
     new GameObject("rectangle", 800, 265, 40, 180, 0, 0, color(123, 132, 123)),
     new GameObject("rectangle", 2550, 250, 300, 100, 0, 0, color(200, 100, 240))
   };
 }

  void tutorialLevel(){
    this.level = new GameObject[]{
      new GameObject("rectangle", 2000, 650, 6000, 600, 0, 0, color(123, 132, 123)),
      new GameObject("rectangle", 0, 275, 500, 1000, 0,0, color(123, 132, 123)),
      new GameObject("rectangle", 800, 865, 40, 180, 0, 0, color(123, 132, 123)),
      new TextObject(800, 200, 0, 0, color(255), new String[] {"Use WASD to move", "Använd WASD för att röra dig"}),
      new GameObject("rectangle", 1800, 340, 40, 40, 0, 0, color(123, 132, 123)),
      new TextObject(1600, 200, 0, 0, color(255), new String[] {"Use Space to jump", "Använd mellanslag för att hoppa"}),
      new GameObject("rectangle", 3400, 300, 50, 100, 0, 0, color(123, 132, 123)),
      new TextObject(2800, 200, 0, 0, color(255), new String[] {"Keep moving against a wall while jumping \nto climb a short distance", "Fortsätt röra dig mot en vägg under ett hopp \nför att klättra en kort sträcka"}),
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
