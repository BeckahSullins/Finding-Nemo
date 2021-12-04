class Animation {
  // variables
  PImage[] images;
  float speed;
  float scale;

  float index;
  boolean isAnimating;

  int playerSpeed = 17;
  
  int dx;
  int dy;
  int dh;
  int dw;

  boolean isMovingUp = false;
  boolean isMovingDown = false;
  boolean isMovingLeft = false;
  boolean isMovingRight = false;
  
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;

  // constructor
  Animation(PImage[] tempImages, float tempSpeed, float tempScale, int x0, int y0) {
    images = tempImages;
    speed = tempSpeed;
    scale = tempScale;
    dx = x0 - dw;
    dy = y0 - dh;

    index = 0;
    isAnimating = false;
    
    dh = 45;
    dw = 50;
    
    topBound = dy;
    bottomBound = dy + dh;
    rightBound = dx + dw;
    leftBound = dx;
    
  }


  void move(){
   //player movement
  if (isMovingUp == true){
    dy = dy - playerSpeed;
  }
    if (isMovingDown == true){
    dy = dy + playerSpeed;
  }
    if (isMovingRight == true){
    dx = dx + playerSpeed;
  }
    if (isMovingLeft == true){
    dx = dx - playerSpeed;
  }   
   
}

  void resetBoundaries() {
    topBound = dy;
    bottomBound = dy + dh;
    rightBound = dx + dw;
    leftBound = dx;    
  }

  // updates the index which image to display for
  // the animation
  void next() {
    index += speed;

    // resets the index if it is too big
    if (index >= images.length) {
      index=0;
      isAnimating=false;
    }
  }

  void display(){
  display(dx, dy);
  
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

   void keyPressed(){
     if (key == CODED){
    if(keyCode == UP){
      isMovingUp = true;
    }
    
    if(keyCode == DOWN){
      isMovingDown = true;
    }
    
    if(keyCode == RIGHT){
      isMovingRight = true;
      display();
    }
    
    if(keyCode == LEFT){
      isMovingLeft = true;
    }
  }
   
   //make dori image animate
   doriAnimation.isAnimating = true;
  
   //make nemo image animate
   nemoAnimation.isAnimating = true;
   
   //make seashell image animate
   shellAnimation1.isAnimating = true;
   shellAnimation2.isAnimating = true;
   shellAnimation3.isAnimating = true;
   
   //make bruce image animate
   bruceAnimation1.isAnimating = true;
   bruceAnimation2.isAnimating = true;
}

void keyReleased(){
      isMovingUp = false;
      isMovingDown = false;
      isMovingRight = false;
      isMovingLeft = false;
   key = 0;
   keyCode = 0;
    }
  }

 
