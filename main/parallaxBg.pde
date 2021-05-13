class ParallaxBg{
  PImage img1;
  int bx=0, bx2 = 1200;
  
  PImage img2;
  int mx=0, mx2 = 1200;
  
  PImage img3;
  int fx=0, fx2 = 1200;
  
  PImage img4;
  int ffx=0, ffx2 = 1200;
  
  PImage img5;
  int fffx=0, fffx2 = 1200;
   

  /*
   * Constructor with images for ParallaxBg class.
   */ 
  ParallaxBg(){
   img1  =  loadImage( "data/parallax_images/1.png");
   img1.resize(1203,600); 
   
   img2  =  loadImage( "data/parallax_images/2.png");
   img2.resize(1203,600); 
   
   img3  =  loadImage( "data/parallax_images/3.png");
   img3.resize(1203,600);
   
   img4  =  loadImage( "data/parallax_images/4.png");
   img4.resize(1203,600); 
   
   img5  =  loadImage( "data/parallax_images/5.png");
   img5.resize(1203,600); 
   
  }
  
  
      
  /*
   * Draws up the parallax backgound
   */ 
  void drawParallax(){
      pushStyle();
     
      image(img1, bx, 0); image(img1, bx2, 0);
      image(img2, mx, 0); image(img2, mx2, 0);
      image(img3, fx, 0); image(img3, fx2, 0);
      image(img4, ffx, 0); image(img4, ffx2, 0);
      image(img5, fffx, 0); image(img5, fffx2, 0);
      
      // Different speeds for the different backgrounds
      bx--; bx2--;
      mx-=2; mx2-=2;
      fx-=3; fx2-=3;
      ffx-=3; ffx2-=3;
      fffx-=3; fffx2-=3;
      
      // each image jumps back to it's previous position 
      if(bx <-1200){ bx = 1200;} if(bx2 <-1200){bx2 = 1200;}
      if(mx <-1200){ mx = 1200;} if(mx2 <-1200){mx2 = 1200;}
      if(fx <-1200){ fx = 1200;} if(fx2 <-1200){fx2 = 1200;}
      if(ffx <-1200){ ffx = 1200;} if(ffx2 <-1200){ffx2 = 1200;}
      if(fffx <-1200){ fffx = 1200;} if(fffx2 <-1200){fffx2 = 1200;}
      
      popStyle();
    }
 
}
