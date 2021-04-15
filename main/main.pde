import java.util.*;
void setup(){
 size(1200, 600); 
 background(137, 209, 254);
 setupMenu(); 
}

boolean inMainMenu = true;


/*

*/
void draw(){
  if (inMainMenu){
    drawMenu();
  }
}
