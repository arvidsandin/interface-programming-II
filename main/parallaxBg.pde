/*
 * A class for drawing up the parallax backgound
 */
class ParallaxBg{
  PImage sky;
  float bx=0, bx2 = 1200;

  PImage img2;
  float mx=0, mx2 = 1200;

  PImage ground;
  float fx=0, fx2 = 1200;

  PImage clouds1;
  float ffx=0, ffx2 = 1200;

  PImage clouds2;
  float fffx=0, fffx2 = 1200;

  /***************************************************************************************************************************************************
   *  MODEL
   ***************************************************************************************************************************************************
   */
  /*
   * Constructor with images for ParallaxBg class.
   *
   * @return A new ParallaxBg object
   */
  ParallaxBg(){
   sky  =  loadImage( "data/parallax_images/sky.png");
   sky.resize(1203,600);

   img2  =  loadImage( "data/parallax_images/rocks.png");
   img2.resize(1203,600);

   ground  =  loadImage( "data/parallax_images/ground.png");
   ground.resize(1203,600);

   clouds1  =  loadImage( "data/parallax_images/clouds_2.png");
   clouds1.resize(1203,600);

   clouds2  =  loadImage( "data/parallax_images/clouds_1.png");
   clouds2.resize(1203,600);

  }

  /*
   * Helper function
   *
   * @return x modulo y
   */
  private int mod(int x, int y)
  {
      int result = x % y;
      if (result < 0)
      {
          result += y;
      }
      return result;
  }
  /*
   * Updates the movement of the parallax images
   *
   * @param x the offset
   * @return None
   */
   void updateOffset(float x){
     // Different speeds for the different backgrounds
     float speed1 = 0.2;
     float speed2 = 0.4;
     float speed3 = 0.6;
     bx=mod(round(bx+x*speed1+1200), 2401)-1200; bx2=mod(round(bx2+x*speed1+1200), 2401)-1200;
     mx=mod(round(mx+x*speed2+1200), 2401)-1200; mx2=mod(round(mx2+x*speed2+1200), 2401)-1200;
     fx=mod(round(fx+x*speed2+1200), 2401)-1200; fx2=mod(round(fx2+x*speed2+1200), 2401)-1200;
     ffx=mod(round(ffx+x*speed2+1200), 2401)-1200; ffx2=mod(round(ffx2+x*speed2+1200), 2401)-1200;
     fffx=mod(round(fffx+x*speed3+1200), 2401)-1200; fffx2=mod(round(fffx2+x*speed3+1200), 2401)-1200;
   }
   
   /*
   * Updates the movement of some parallax images, as an independent animation
   *
   * @return None
   */
   void animate(){
     ffx += 1;
     ffx2 += 1;
     
     fffx += 0.6;
     fffx2 += 0.6;
   }


  /***************************************************************************************************************************************************
   *  VIEW
   ***************************************************************************************************************************************************
   */

  /*
   * Draws up the parallax backgound
   *
   * @return None
   */
  void drawParallax(){
      pushStyle();

      image(sky, bx, 0); image(sky, bx2, 0);
      image(img2, mx, 0); image(img2, mx2, 0);
      image(ground, fx, 0); image(ground, fx2, 0);
      image(clouds1, ffx, 0); image(clouds1, ffx2, 0);
      image(clouds2, fffx, 0); image(clouds2, fffx2, 0);

      popStyle();
    }

}
