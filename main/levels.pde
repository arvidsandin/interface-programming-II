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
      new GameObject("rectangle", 2550, 245, 300, 100, color(200, 100, 240)),
      new GameObject("rectangle", 800, 450, 2895, 200, color(123, 132, 123)),
      new GameObject("rectangle", 200, 275, 120, 600, color(123, 132, 123), "data/texture/building_liver.png"),
      new GameObject("rectangle", 800, 265, 40, 180, color(123, 132, 123), "data/texture/piskel_2.png"),
      new GameObject("rectangle", 2550, 250, 300, 100,  color(200, 100, 240))
    };
  }

  /*
   * Sets the acitve level into level 1
   *
   * @return None
   */
 void level1(){
   this.level = new GameObject[]{
     new GameObject("rectangle", 200, 175, 120, 600, color(123, 132, 123), "data/texture/SquareBuildingTile.png"), // High wall
     new GameObject("rectangle", 800, 265, 40, 180, color(123, 132, 123), "data/texture/SquareBuildingTile.png"), // Low wall
     new GameObject("rectangle", 800, 450, 2400, 200, color(123, 132, 123)),  //Long platform
     
     
     new GameObject("rectangle", 2300, 250, 300, 100, color(200, 100, 240), "data/texture/horizontel.png"), // Floating platform
     new GameObject("rectangle", 2650, 450, 500, 300, color(123, 132, 183)), // Safe rectangular platform
     new GameObject("rectangle", 3100, 500, 500, 50, color(123, 132, 183)),  // Thin platform
     
     new GameObject("rectangle", 2900 + 1250, 450, 1700, 500, color(123, 132, 183)), // High, wide platform
     new GameObject("rectangle", 3350, 200, 600, 100, color(123, 132, 183), "data/texture/piskel_1.png"), // Thin, high up platform
     new GameObject("rectangle", 3700 + 210, 150, 150, 150, color(123, 132, 183)), // Rising platform
     new GameObject("rectangle", 3700 + 570, 100, 175, 210, color(123, 132, 183)),  // Higher rising platform
     new GameObject("rectangle", 3650 + 975, 75, 225, 280, color(123, 132, 183)),  // Third highest rising platform
     new GameObject("rectangle", 3650 + 1200, 75, 250, 280, color(123, 132, 183)),  // Ground support
     
     new GameObject("rectangle", 4650 + 1200, -200, 1700, 500, color(123, 132, 213)), // High, wide platform
     new GameObject("rectangle", 5000, -150, 80, 1000, color(123, 132, 213), "data/texture/piskel_2.png"),  // High pillar
     
     new GameObject("rectangle", 4650, -900, 80, 1000, color(123, 132, 183)),  // High pillar behind floating pillar
     new GameObject("rectangle", 4650, -350, 300, 200, color(123, 132, 213), "data/texture/horizontel.png"), // Floating pillar
     new TextObject(5600, -600, color(255), new String[] {"You've reached the end :)", "Du har n??tt slutet :)", "Alcanzaste el fin :)"}),
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
      new GameObject("rectangle", 2000, 650, 15000, 600, color(73, 73, 73)), // Lying pillar
      new GameObject("rectangle", 0, 275, 500, 1000, color(73, 73, 73)), // Standing pillar
     // new GameObject("rectangle", 800, 865, 40, 180, color(73, 73, 73)),
      new TextObject(500, 200, color(255), new String[] {"Use WASD or arrow keys to move", "Anv??nd WASD eller piltangenter f??r att r??ra dig", "Usa WASD o las teclas de flechas para moverte"}),
      new GameObject("rectangle", 1800, 340, 40, 40, color(73, 73, 73)),  // Small bump
      new TextObject(1650, 200, color(255), new String[] {"Use Space, W, or Up to jump", "Anv??nd mellanslag, W \neller upp??tpilen f??r att hoppa", "Usa espacio, W, o arriba \npara saltar"}),
      new GameObject("rectangle", 3400, 300, 50, 100, color(73, 73, 73)),
      new TextObject(2800, 200, color(255), new String[] {"Run against a wall while jumping \nto climb a short distance", "Spring mot en v??gg och hoppa \nf??r att kl??ttra en kort str??cka", "Corre hacia una pared y salta \npara escalar un pedaso"}),
      new GameObject("rectangle", 4800, 280, 150, 140, color(73, 73, 73)), // Low rectangle
      new GameObject("rectangle", 5400, -425, 650, 1200, color(123, 132, 183)), // Floating platform
      new TextObject(4250, 50, color(255), new String[] {"Jump to climb and reach higher up", "Hoppa f??r att kl??ttra och n?? h??gre upp", "Salta para correr y alcanzar mas alto"}),
      new GameObject("rectangle", 6400, 200, 1150, 395, color(123, 132, 183)),  // Wide pillar
      new TextObject(5100, 100, color(255), new String[] {"Press spacebar while climbing \nto wall jump", "Tryck p?? mellanslag medan du \nkl??ttrar f??r att g??ra ett v??gghopp", "Apreta espacio mientras escalar \n para hacer un salto de pared"}),
      new TextObject(5850, 250, color(255), new String[] {"Right, climb and hold right, \nspacebar", "H??ger, kl??ttra och h??ll h??ger, \nmellanslag", "Derecha, escala y \nmanten derecha, espacio"}),

      new GameObject("rectangle", 6800, -90, 80, 200, color(123, 132, 183)),  // High pillar
      new TextObject(6600, -330, color(255),new String[] {"Be careful with high falls\nFall too far and you'll lose", "Var f??rsiktig vid h??ga fall\nRamlar du f??r l??ngt f??rlorar du", "Ten cuidado de ca??das altas \nSi caes demasiado lejos perderas"}),
      new GameObject("rectangle", 7000, 200, 100, 60, color(183, 132, 183)),  // Small Cushion
      new GameObject("rectangle", 7100, 325, 600, 60, color(183, 132, 183)),  // Wide cushion
      new TextObject(7100, 250, color(255), new String[] {"About this height is how far you can survive", "Ungef??r s?? h??r l??ngt kan du kan ??verleva", "M??s o menos esta distanca puedes sobrevivir"}),

      new GameObject("rectangle", 8900, 200, 600, 1200, color(73, 73, 73)),   // Final blocking wall
      new TextObject(7900, 100, color(255), new String[] {"You've finished the tutorial!\nPress ESC or \nthe home symbol \nto bring up the game menu", "Du ??r nu klar med instroduktionen!\nTryck p?? ESC eller hemsymbolen \nf??r att f?? upp spelmenyn", "Haz terminado el tutorial! Apreta ESC o el simbolo \nde casa para ense??ar el menu de juego"}),
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
