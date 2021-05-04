GameObject[] getLevel1(){
  GameObject[] level = {
    new GameObject("rectangle", width*2/3, height*3/4, width-5, height/3, 0, 0, color(123, 132, 123)),
    new GameObject("rectangle", 200, 275, width/10, height, 0,0, color(123, 132, 123)),
    new GameObject("rectangle", 800, 265, 40, 180, 0, 0, color(123, 132, 123)),
    new GameObject("triangle", 1300, 200, 1300, 400, 1000, 400, 0, 0, color(123, 132, 123))
  };
  return level;
}
