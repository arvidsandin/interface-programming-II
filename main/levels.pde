GameObject[] getLevel1(){
  GameObject[] level = {
    new GameObject("rectangle", 800, 450, 2895, 200, 0, 0, color(123, 132, 123)),
    new GameObject("rectangle", 200, 275, 120, 600, 0,0, color(123, 132, 123)),
    new GameObject("rectangle", 800, 265, 40, 180, 0, 0, color(123, 132, 123)),
    new GameObject("triangle", 1300, 200, 1300, 400, 1000, 400, 0, 0, color(123, 132, 123)),
    new GameObject("rectangle", 2550, 250, 300, 100, 0, 0, color(200, 100, 240))
  };
  return level;
}
