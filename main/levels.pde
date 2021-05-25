/*
 * A class for holding game levels made from GameObjects
 */
class Level{

  GameObject[] level;

  /*
   * Creates a basic level
   *
   * @return A new level object
   */
  Level(){
    // Objects in a level are created with the following parameters: x-y-position, width, height, x-y animation offsets, and the object's colour. Texture images are possible to add as a last argument
    this.level = new GameObject[]{
      new GameObject("rectangle", 800, 450, 2895, 200,  color(123, 132, 123)),
      new GameObject("rectangle", 200, 275, 120, 600, color(123, 132, 123)),
      new GameObject("rectangle", 800, 265, 40, 180, color(123, 132, 123)),
      new GameObject("rectangle", 2550, 245, 300, 100, color(200, 100, 240))
    };
  }

  /*
   * Sets the acitve level into level 1
   *
   * @return None
   */
 void level1(){
   this.level = new GameObject[]{
     new GameObject("rectangle", 800, 450, 2400, 200, color(123, 132, 123)),
     new GameObject("rectangle", 200, 275, 120, 600, color(123, 132, 123)), // Low wall
     new GameObject("rectangle", 800, 265, 40, 180, color(123, 132, 123)), // Base platform
     new GameObject("rectangle", 2300, 250, 300, 100, color(200, 100, 240)), // Floating platform
     new GameObject("rectangle", 2650, 450, 500, 300, color(123, 132, 183)), // Safe rectangular platform
     new GameObject("rectangle", 3100, 500, 500, 50, color(123, 132, 183)),  // Thin platform
     
     new GameObject("rectangle", 2900 + 1250, 450, 1700, 500, color(123, 132, 183)), // High, wide platform
     new GameObject("rectangle", 3350, 200, 600, 100, color(123, 132, 183)), // Thin, high up platform
     new GameObject("rectangle", 3700 + 260, 150, 150, 150, color(123, 132, 183)), // Rising platform
     new GameObject("rectangle", 3700 + 630, 100, 175, 210, color(123, 132, 183)),  // Higher rising platform
     new GameObject("rectangle", 3700 + 1050, 75, 200, 280, color(123, 132, 183)),  // Third highest rising platform
     new GameObject("rectangle", 3700 + 1200, 75, 200, 280, color(123, 132, 183)),  // Ground support
     new GameObject("rectangle", 5030, -175, 80, 900, color(123, 132, 213)),  // High pillar
     
     new GameObject("rectangle", 4650, -900, 80, 1000, color(123, 132, 183)),  // High pillar behind floating pillar
     new GameObject("rectangle", 4650, -350, 300, 200, color(123, 132, 213)), // Floating pillar
     new GameObject("rectangle", 4650 + 1200, -200, 1700, 500, color(123, 132, 213)), // High, wide platform
     
      //new GameObject("rectangle", , , , , ),
   };
 }

  /*
   * Sets the active level into the tutorial level
   *
   * @return None
   */
  void tutorialLevel(){
    this.level = new GameObject[]{
      new GameObject("rectangle", 2000, 650, 15000, 600, color(123, 132, 123)), // Lying pillar
      new GameObject("rectangle", 0, 275, 500, 1000, color(123, 132, 123)), // Standing pillar
      new GameObject("rectangle", 800, 865, 40, 180, color(123, 132, 123)),
      new TextObject(800, 200, color(255), new String[] {"Use WASD or arrow keys to move", "Använd WASD eller piltangenter för att röra dig"}),
      new GameObject("rectangle", 1800, 340, 40, 40, color(123, 132, 123)),  // Small bump
      new TextObject(1600, 200, color(255), new String[] {"Use Space, W, or Up to jump", "Använd mellanslag, W eller uppåtpilen för att hoppa"}),
      new GameObject("rectangle", 3400, 300, 50, 100, color(123, 132, 123)),
      new TextObject(2800, 200, color(255), new String[] {"Keep moving against a wall while jumping \nto climb a short distance", "Fortsätt röra dig mot en vägg under ett hopp \nför att klättra en kort sträcka"}),
      new GameObject("rectangle", 4900, 280, 150, 140, color(123, 132, 123)), // Low rectangle
      new GameObject("rectangle", 5400, -425, 600, 1200, color(123, 132, 183)), // Floating platform
      new TextObject(4300, 200, color(255), new String[] {"Jump to climb and reach higher up", "Hoppa för att klättra och nå högre upp"}),
      new GameObject("rectangle", 6400, 200, 1150, 395, color(123, 132, 183)),  // High pillar
      new TextObject(5200, 100, color(255), new String[] {"Press spacebar while climbing to wall jump", "Tryck på mellanslag medan du klättrar för \natt göra ett vägghopp"}),

      new GameObject("rectangle", 6800, -90, 80, 200, color(123, 132, 183)),  // High pillar
      new TextObject(6600, -330, color(255),new String[] {"Be careful with high falls\nFall too far and you'll lose", "Var försiktig vid höga fall\nRamlar du för långt förlorar du"}),
      new GameObject("rectangle", 7000, 200, 100, 60, color(183, 132, 183)),  // Small Cushion
      new GameObject("rectangle", 7100, 325, 600, 60, color(183, 132, 183)),  // Wide cushion
      new TextObject(7100, 250, color(255), new String[] {"About this height is how far you can fall", "Ungefär så här långt kan du falla"}),

      new GameObject("rectangle", 9000, 200, 600, 1200, color(123, 132, 123)),   // Final blocking wall
      new TextObject(8100, 200, color(255), new String[] {"You've finished the tutorial!\nPress ESC to bring up the game menu", "Du är nu klar med hjälpinstruktionerna!\nTryck på ESC för att få upp spelmeny"}),
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
