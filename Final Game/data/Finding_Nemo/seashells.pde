class shellAnimation {
  // variables
  PImage[] images;
  float speed;
  float scale;

  float index;
  boolean isAnimating;
  
  int sx;
  int sy;
  int sh;
  int sw;
  
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;
  
  boolean isAlive;

  // constructor
  shellAnimation(PImage[] tempImages, float tempSpeed, float tempScale, int x0, int y0) {
    images = tempImages;
    speed = tempSpeed;
    scale = tempScale;

    index = 0;
    isAnimating = false;
    
    sx = x0;
    sy = y0;
    sh = 54;
    sw = 75;
    
    topBound = sy;
    bottomBound = sy + sh;
    rightBound = sx + sw;
    leftBound = sx;
    
    isAlive = true;
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
  
  void collisionDetection(Animation dori, shellAnimation shellAnimation) {
    if (dori.topBound <= shellAnimation.bottomBound && dori.bottomBound >= shellAnimation.topBound && dori.leftBound <= shellAnimation.rightBound && dori.rightBound >= shellAnimation.leftBound) {
      if (dori.rightBound < shellAnimation.rightBound) {
        println("coming from left");
        dori.isMovingRight = false;
        playerScore = playerScore +100;
        isAlive = false;
      } else if (dori.leftBound > shellAnimation.leftBound) {
        println("coming from right");
        dori.isMovingLeft = false;
        playerScore = playerScore +100;
        isAlive = false;
      }
      
      if (dori.topBound > shellAnimation.topBound) {
        println("coming from bottom");
        dori.isMovingUp = false;
        playerScore = playerScore +100;
        isAlive = false;
      } else if (dori.bottomBound < shellAnimation.bottomBound) {
        println("coming from top");
        dori.isMovingDown = false;
        playerScore = playerScore +100;
        isAlive = false;
      }
    }
  }
}
