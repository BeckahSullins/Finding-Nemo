//making my new class bubble
class Bubble {
  //class variables
  int x;
  int y;
  int d;
  
  int xSpeed;
  int ySpeed;
  
  int c;
  
  //make my constructor function (goal to give every class variable a value)
  Bubble(){
    x = int(random(d/2, width - d/2));
    y = int(random(d/2, height - d/2));
    d = int(random(20, 80));
    ySpeed = int(random(2, 8));
    c = color(random(8, 10), random(30, 190), random(254, 255));
  }
  
  //FUNCTIONS!!
  
  //draws the bubble
  void render(){
    fill(c);
    circle(x, y, d);
  }
  
  //moves the bubble
  void move(){
    y = y - ySpeed;
  }
  
  //makes the bubble detect walls
  void wallDetect() {
    // wall detection for top wall
    if (y-d/2 <= 0) {
      y = height;
    }
  }
}
