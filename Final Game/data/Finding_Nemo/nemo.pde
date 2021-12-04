class nemoAnimation {
  // variables
  PImage[] images;
  float speed;
  float scale;

  float index;
  boolean isAnimating;
  
  int nx;
  int ny;
  int nh;
  int nw;
  
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;

  // constructor
  nemoAnimation(PImage[] tempImages, float tempSpeed, float tempScale, int x0, int y0) {
    images = tempImages;
    speed = tempSpeed;
    scale = tempScale;
    nx = x0;
    ny = y0;
    nh = 54;
    nw = 75;

    index = 0;
    isAnimating = false;
    
    topBound = ny;
    bottomBound = ny + nh;
    rightBound = nx + nw;
    leftBound = nx;
  }

  // updates the index which image to display for
  // the animation
  void next() {
    println(index);
    index += speed;

    // resets the index if it is too big
    if (index >= images.length) {
      index=0;
      isAnimating=false;
    }
  }

  // display an image of the animation
  void display(int x, int y) {
    imageMode(CENTER);
    if (isAnimating) {
      int imageIndex = int(index);
      PImage img = images[imageIndex];
      image(img, x, y, img.width*scale, img.height*scale);

      // increment the index of the images to display
      next();
    } else {
      PImage img = images[0];
      image(img, x, y, img.width*scale, img.height*scale);
    }
  }
  
  void collisionDetection(Animation dori, nemoAnimation nemoAnimation) {
    if (dori.topBound <= nemoAnimation.bottomBound && dori.bottomBound >= nemoAnimation.topBound && dori.leftBound <= nemoAnimation.rightBound && dori.rightBound >= nemoAnimation.leftBound) {
      if (dori.rightBound < nemoAnimation.rightBound) {
        println("coming from left");
        dori.isMovingRight = false;
        state = 2;
      } else if (dori.leftBound > nemoAnimation.leftBound) {
        println("coming from right");
        dori.isMovingLeft = false;
        state = 2;
      }
      
      if (dori.topBound > nemoAnimation.topBound) {
        println("coming from bottom");
        dori.isMovingUp = false;
        state = 2;
      } else if (dori.bottomBound < nemoAnimation.bottomBound) {
        println("coming from top");
        dori.isMovingDown = false;
        state = 2;
      }
    }
  }
}
