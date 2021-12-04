class bruceAnimation {
  // variables
  PImage[] images;
  float speed;
  float scale;

  float index;
  boolean isAnimating;
  
  float x;
  float y;
  int xSpeed;
  
  int bx;
  int by;
  int bh;
  int bw;
  
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;

  // constructor
  bruceAnimation(PImage[] tempImages, float tempSpeed, float tempScale, int x0, int y0) {
    images = tempImages;
    speed = tempSpeed;
    scale = tempScale;
    bx = x0;
    by = y0;
    xSpeed = int(random(4,8));

    index = 0;
    isAnimating = false;
    
    bh = 54;
    bw = 75;

    topBound = by;
    bottomBound = by + bh;
    rightBound = bx + bw;
    leftBound = bx;
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
  void display() {
    imageMode(CENTER);
    if (isAnimating) {
      int imageIndex = int(index);
      PImage img = images[imageIndex];
      image(img, bx, by, img.width*scale, img.height*scale);

      // increment the index of the images to display
      next();
    } else {
      PImage img = images[0];
      image(img, bx, by, img.width*scale, img.height*scale);
    }
  }
  
  //moves the bubble
  void move(){
    bx = bx - xSpeed;
    topBound = by;
    bottomBound = by + bh;
    rightBound = bx + bw;
    leftBound = bx;
  }
  
  //makes the bubble detect walls
  void wallDetect() {
    // wall detection for top wall
    if (bx - images.length/2 <= 0) {
      bx = width;
      by = int(random(120, height - 50));
    }
  }
  
  void collisionDetection(Animation dori, bruceAnimation bruceAnimation) {
    if (dori.topBound <= bruceAnimation.bottomBound && dori.bottomBound >= bruceAnimation.topBound && dori.leftBound <= bruceAnimation.rightBound && dori.rightBound >= bruceAnimation.leftBound) {
      if (dori.rightBound < nemoAnimation.rightBound) {
        println("coming from left");
        dori.isMovingRight = false;
        state = 3;
      } else if (dori.leftBound > bruceAnimation.leftBound) {
        println("coming from right");
        dori.isMovingLeft = false;
        state = 3;
      }
      
      if (dori.topBound > bruceAnimation.topBound) {
        println("coming from bottom");
        dori.isMovingUp = false;
        state = 3;
      } else if (dori.bottomBound < bruceAnimation.bottomBound) {
        println("coming from top");
        dori.isMovingDown = false;
        state = 3;
      }
    }
  }
}
