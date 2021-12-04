
//making array list
//number list array
int [] numList = {1, 2, 5, 8, 10};

//squared list array
int [] squaredList = new int[numList.length];

//add list array
int [] addList = new int[numList.length - 1];

//total number of bubbles
int numBubbles = 17;

//make bubble array
Bubble[] bubbleArray = new Bubble[numBubbles];

//make background images
PImage OceanBg;
PImage StartBg;
PImage LoserBg;
PImage WinnerBg;

//importing the sound
import processing.sound.*;
SoundFile bubbleSound;
SoundFile backgroundMusic;

//declaring player score variable
int playerScore;

//declaring my state variables
int state;

boolean isPlaying;

//make maze walls
Wall Wall1;
Wall Wall2;
Wall Wall3;
Wall Wall4;
Wall Wall5;
Wall Wall6;
Wall Wall7;
Wall Wall8;
Wall Wall9;
Wall Wall10;
Wall Wall11;
Wall Wall12;
Wall Wall13;
Wall Wall14;
Wall Wall15;
Wall Wall16;

//initialize dori animation
Animation doriAnimation;
//initialize nemo animation
nemoAnimation nemoAnimation;
//initialize seashell animations
shellAnimation shellAnimation1;
shellAnimation shellAnimation2;
shellAnimation shellAnimation3;
//initialize bruce animation
bruceAnimation bruceAnimation1;
bruceAnimation bruceAnimation2;

//make dori images
PImage[] doriImages = new PImage[2];
//make dori images
PImage[] nemoImages = new PImage[2];
//make seashell images
PImage[] shellImages = new PImage[3];
//make bruce images
PImage[] bruceImages = new PImage[2];


void setup() {
  size(1200, 750);

  //initialize bubble array
  for (int i = 0; i < bubbleArray.length; i++) {
    bubbleArray[i] = new Bubble();
  }
  //for loop to fill squared list
  for (int i = 0; i < squaredList.length; i ++) {
    squaredList[i] = numList[i]*numList[i];
  }
  //for loop to fill add list
  for (int i = 0; i < addList.length; i ++) {
    addList[i] = numList[i] + numList[i + 1];
  }

  //initializing player score variable
  playerScore = 0;

  //adding bubble sound
  bubbleSound = new SoundFile (this, "bubble.wav");
  //change bubble volume
  bubbleSound.amp(0.7);
  //change speed of bubble sound
  bubbleSound.rate(0.6);
  
  //adding background music
  backgroundMusic = new SoundFile (this, "FriendsNotFood.wav");
  //change background music volume
  backgroundMusic.amp(0.1);

  //setting ocean background
  OceanBg = loadImage("ocean.jpg");
  OceanBg.resize(1200, 750);

  //setting start screen background
  StartBg = loadImage("ocean2.jpg");
  StartBg.resize(1200, 750);

  //setting loser screen background
  LoserBg = loadImage("anglerfish.jpg");
  LoserBg.resize(1200, 750);

  //setting winner screen background
  WinnerBg = loadImage("peach.jpg");
  WinnerBg.resize(1200, 750);

  //load and create dori images
  for (int i = 0; i< doriImages.length; i++) {
    doriImages[i] = loadImage("dori"+i+".png");
  }
  doriAnimation = new Animation(doriImages, 0.02, 3.75, 45, 665);

  //load and create nemo images
  for (int i = 0; i< nemoImages.length; i++) {
    nemoImages[i] = loadImage("nemo"+i+".png");
  }
  nemoAnimation = new nemoAnimation(nemoImages, 0.01, 3.5, width - 60, 285);

  //load and create seashell images
  for (int i = 0; i< shellImages.length; i++) {
    shellImages[i] = loadImage("seashell"+i+".png");
  }
  shellAnimation1 = new shellAnimation(shellImages, 0.02, 3.5, 230, 310);
  shellAnimation2 = new shellAnimation(shellImages, 0.03, 3.5, width - 70, 180);
  shellAnimation3 = new shellAnimation(shellImages, 0.025, 3.5, 635, 325);

  //load and create bruce image
  for (int i = 0; i< bruceImages.length; i++) {
    bruceImages[i] = loadImage("bruce"+i+".png");
  }
  bruceAnimation1 = new bruceAnimation(bruceImages, 0.032, 5.5, 1050, 200);
  bruceAnimation2 = new bruceAnimation(bruceImages, 0.032, 5.5, 1050, 400);

  //making new walls
  Wall1 = new Wall(0, 100, 20, 525);
  Wall2 = new Wall(0, 100, width, 20);
  Wall3 = new Wall(0, 725, width, 20);
  Wall4 = new Wall(width - 20, 120, 20, 145);
  Wall5 = new Wall(width - 20, 400, 20, 330);
  Wall6 = new Wall(20, 605, 375, 20);
  Wall7 = new Wall(150, 230, 20, 275);
  Wall8 = new Wall(170, 363, 150, 20);
  Wall9 = new Wall(300, 120, 20, 243);
  Wall10 = new Wall(width/2 - 50, 245, 20, 480);
  Wall11 = new Wall(300, 485, 250, 20);
  Wall12 = new Wall(450, 245, 250, 20);
  Wall13 = new Wall(850, 245, 400, 20);
  Wall14 = new Wall(700, 245, 20, 380);
  Wall15 = new Wall(850, 370, 20, 360);
  Wall16 = new Wall(1000, 245, 20, 380);

  //setting initial state
  state = 0;
}

void draw() {
  //my finite state machine
  switch(state) {
  case 0:
    //backgroundMusic.play();
    
    //making title screen
    //setting text
    fill(color(255, 181, 21));
    background (StartBg);
    textSize(70);
    text("Click Mouse to Start", 300, 400);

    textSize(150);
    text("FINDING NEMO", 145, 275);
    //making instruction buttons
    //square "UP"
    square(1000, 500, 60);
    //square "DOWN"
    square(1000, 650, 60);
    //square "LEFT"
    square(925, 575, 60);
    //square "RIGHT"
    square(1075, 575, 60);
    fill(color(0));
    textSize(20);
    text("UP", 1020, 540);
    text("DOWN", 1005, 690);
    text("LEFT", 935, 615);
    text("RIGHT", 1080, 615);
    fill(color(255));
    textSize(35);
    text("INSTRUCTIONS:", 925, 475);
    text("Press the ARROW KEYS to navigate Dori", 210, 550);
    text("through the seaweed maze to help find Nemo!", 175, 600);

    //bubble for loop
    //initialize my ball array
    for (int i = 0; i < bubbleArray.length; i++) {
      Bubble aBubble = bubbleArray[i];

      aBubble.render();
      aBubble.move();
      aBubble.wallDetect();
    }
    break;

  case 1:
    //load ocean background
    background(OceanBg);

    fill(color(255));
    text(playerScore, width - 130, 75);
    textSize(70);

    fill(color(255));
    text("SCORE", 800, 75);
    textSize(70);

    //draw dori animation
    doriAnimation.display();
    doriAnimation.keyPressed();
    doriAnimation.resetBoundaries();
    
    //call wall detection function
    Wall1.collisionDetection(doriAnimation);
    Wall2.collisionDetection(doriAnimation);
    Wall3.collisionDetection(doriAnimation);
    Wall4.collisionDetection(doriAnimation);
    Wall5.collisionDetection(doriAnimation);
    Wall6.collisionDetection(doriAnimation);
    Wall7.collisionDetection(doriAnimation);
    Wall8.collisionDetection(doriAnimation);
    Wall9.collisionDetection(doriAnimation);
    Wall10.collisionDetection(doriAnimation);
    Wall11.collisionDetection(doriAnimation);
    Wall12.collisionDetection(doriAnimation);
    Wall13.collisionDetection(doriAnimation);
    Wall14.collisionDetection(doriAnimation);
    Wall15.collisionDetection(doriAnimation);
    Wall16.collisionDetection(doriAnimation);
    
    nemoAnimation.collisionDetection(doriAnimation, nemoAnimation);
    
    bruceAnimation1.collisionDetection(doriAnimation, bruceAnimation1);
    bruceAnimation2.collisionDetection(doriAnimation, bruceAnimation2);
    
    doriAnimation.move();
    doriAnimation.keyReleased();

    //draw nemo animation
    nemoAnimation.display(width - 60, 330);

    
    if(shellAnimation1.isAlive == true){
      shellAnimation1.display(shellAnimation1.sx, shellAnimation1.sy);
      shellAnimation1.collisionDetection(doriAnimation, shellAnimation1);
       if(shellAnimation1.isAlive == false && bubbleSound.isPlaying() == false){
          //play bubble sound
          bubbleSound.play();
      }
    }
    
    if(shellAnimation2.isAlive == true){
      shellAnimation2.display(shellAnimation2.sx, shellAnimation2.sy);
      shellAnimation2.collisionDetection(doriAnimation, shellAnimation2);
       if(shellAnimation2.isAlive == false && bubbleSound.isPlaying() == false){
          //play bubble sound
          bubbleSound.play();
      }
    }
    
    if(shellAnimation3.isAlive == true){
      shellAnimation3.display(shellAnimation3.sx, shellAnimation3.sy);
      shellAnimation3.collisionDetection(doriAnimation, shellAnimation3);
       if(shellAnimation3.isAlive == false && bubbleSound.isPlaying() == false){
          //play bubble sound
          bubbleSound.play();
      }
    }

    //render walls
    Wall1.render();
    Wall2.render();
    Wall3.render();
    Wall4.render();
    Wall5.render();
    Wall6.render();
    Wall7.render();
    Wall8.render();    
    Wall9.render();    
    Wall10.render();   
    Wall11.render();    
    Wall12.render();    
    Wall13.render();    
    Wall14.render();
    Wall15.render();
    Wall16.render();
    
    //draw bruce animation
    bruceAnimation1.display();
    bruceAnimation1.move();
    bruceAnimation1.wallDetect();
    
    bruceAnimation2.display();
    bruceAnimation2.move();
    bruceAnimation2.wallDetect();

    break;

  case 2:
    background (WinnerBg);
    fill(color(53, 205, 250));
    text("YOU JUST KEPT SWIMMING", 550, 350);
    text("AND YOU FOUND NEMO!", 575, 450);
    textSize(55);
    break;

  case 3:
    background (LoserBg);
    fill(color(255, 0, 0));
    text("YOU LOST", 400, 350);
    text("FISH ARE FRIENDS NOT FOOD!", 150, 450);
    textSize(75);
    break;

  }
  //making background music
  if(backgroundMusic.isPlaying()== false){
    backgroundMusic.play();
  }
}
void mousePressed() {
  setup();
  state = 1;
  //play bubble sound
  bubbleSound.play();
}
