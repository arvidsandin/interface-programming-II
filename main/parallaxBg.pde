/*
 * A class for drawing up the parallax backgound
 */
class ParallaxBg{
  float defaultWidth = 1280;
  float defaultHeight = 720;
  float defaultDoubleOne = defaultWidth*2 + 1;
  
  PImage sky;
  float bx=0, bx2 = defaultWidth;

  PImage img2;
  float mx=0, mx2 = defaultWidth;

  PImage ground;
  float fx=0, fx2 = defaultWidth;

  PImage clouds1;
  float ffx=0, ffx2 = defaultWidth;

  PImage clouds2;
  float fffx=0, fffx2 = defaultWidth;

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
   sky.resize((int)defaultWidth+3, (int)defaultHeight);

   img2  =  loadImage( "data/parallax_images/rocks.png");
   img2.resize((int)defaultWidth+3, (int)defaultHeight);

   ground  =  loadImage( "data/parallax_images/ground.png");
   ground.resize((int)defaultWidth +3, (int)defaultHeight);

   clouds1  =  loadImage( "data/parallax_images/clouds_2.png");
   clouds1.resize((int)defaultWidth+3, (int)defaultHeight);

   clouds2  =  loadImage( "data/parallax_images/clouds_1.png");
   clouds2.resize((int)defaultWidth+3, (int)defaultHeight);

  }

  /*
   * Helper function
   *
   * @return x modulo y
   */
  private float mod(float x, float y)
  {
      float result = x % y;
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
     bx=mod(bx+x*speed1+defaultWidth, defaultDoubleOne)-defaultWidth; bx2=mod((bx2+x*speed1+defaultWidth), defaultDoubleOne)-defaultWidth;
     
     mx=mod(mx+x*speed2+defaultWidth, defaultDoubleOne)-defaultWidth; mx2=mod((mx2+x*speed2+defaultWidth), defaultDoubleOne)-defaultWidth;
     
     fx=mod(fx+x*speed2+defaultWidth, defaultDoubleOne)-defaultWidth; fx2=mod((fx2+x*speed2+defaultWidth), defaultDoubleOne)-defaultWidth;
     
     ffx=mod(ffx+x*speed2+defaultWidth, defaultDoubleOne)-defaultWidth; ffx2=mod((ffx2+x*speed2+defaultWidth), defaultDoubleOne)-defaultWidth;
     
     fffx=mod((fffx+x*speed3+defaultWidth), defaultDoubleOne)-defaultWidth; fffx2=mod((fffx2+x*speed3+defaultWidth), defaultDoubleOne)-defaultWidth;
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
