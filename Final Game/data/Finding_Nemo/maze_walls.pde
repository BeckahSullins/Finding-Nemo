class Wall {
  //class variables
  int x;
  int y;
  int w;
  int h;
  int c;

  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;

  Animation doriAnimation;

  Wall(int tempX, int tempY, int tempW, int tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c = color(27, 203, 28);

    topBound = y;
    bottomBound = y + h;
    rightBound = x + w;
    leftBound = x;
  }

  //FUNCTIONS!!

  //draws the bubble
  void render() {
    stroke(c);
    fill(c);
    rect(x, y, w, h);
  }

  void collisionDetection(Animation dori) {
    if (dori.topBound <= bottomBound && dori.bottomBound >= topBound && dori.leftBound <= rightBound && dori.rightBound >= leftBound) {
      if (dori.rightBound < rightBound) {
        println("coming from left");
        dori.isMovingRight = false;
      } else if (dori.leftBound > leftBound) {
        println("coming from right");
        dori.isMovingLeft = false;
      }
      
      if (dori.topBound > topBound) {
        println("coming from bottom");
        dori.isMovingUp = false;
      } else if (dori.bottomBound < bottomBound) {
        println("coming from top");
        dori.isMovingDown = false;
        
      }
    }
  }
}
