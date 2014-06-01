import ddf.minim.*;

// window width will be 2*DISPLAY_SIZE and 
// height will be DISPLAY_SIZE
int __DISPLAY_SIZE               = 300;

// rate at which the window should refresh
int __FRAME_RATE                 = 8;

// level change when score is a multiple of
int __LEVEL_CHANGE_AT            = 100;

// game score
int     __GAME_SCORE             = 0;

// game difficulty current
float   __GAME_DIFFICULTY        = 0;


Wall backgroundWall;
Obstacle obstacle1;
Obstacle obstacle2;
Bird flappuBird;
boolean isRunning;

// AUDIO Effects
AudioPlayer flySoundPlayer;
AudioPlayer crashSoundPlayer;
Minim minim;


void setup() {
  
  size(2*__DISPLAY_SIZE, __DISPLAY_SIZE);
  
  backgroundWall = new Wall();
  flappuBird     = new Bird();
  obstacle1      = new Obstacle();
  obstacle2      = new Obstacle(obstacle1.x);
  
  minim            = new Minim(this);
  flySoundPlayer   = minim.loadFile("sfx_wing.wav");
  crashSoundPlayer = minim.loadFile("sfx_hit.wav");
  
  frameRate(__FRAME_RATE);
  noStroke();
  
  showWelcomeScreen();
  
  isRunning = false;
  
  __GAME_SCORE       = 0;
  __GAME_DIFFICULTY  = 0;
}

void draw() {
  if(isRunning && !flappuBird.isCrashed) {
      clearScreen();
      
      backgroundWall.drawWall();
      
      obstacle1.drawObstacle();
      obstacle2.drawObstacle();
      
      flappuBird.drawBird();
  
      handleScore();
      
      handleLevel();
  } 
  
  if(flappuBird.isCrashed){
    displayGameOverMessage();
    playDieSound();
  }
}

void mousePressed() {
  if(!flappuBird.isCrashed) {
    isRunning = true;
    flappuBird.fly();
    playWingSound();
  } else {
    // restart game is replay button is tapped
    if(mouseX >= (width/2-50) && mouseX <= (width/2+50)
        && mouseY >= (height/2-50) && (mouseY <= height/2+50)) {
         setup(); 
        }
  }
}

void keyPressed() {
  if(!flappuBird.isCrashed) {
    isRunning = true;
    flappuBird.fly();
    playWingSound();
  } 
}

void playDieSound() {
  crashSoundPlayer.play(); 
}

void playWingSound() {
  flySoundPlayer.rewind();
  flySoundPlayer.play();
}

void handleLevel() {
  if(__GAME_SCORE % __LEVEL_CHANGE_AT == 0) {
    __GAME_DIFFICULTY ++;
    frameRate(__FRAME_RATE + __GAME_DIFFICULTY);
  } 
}

void showWelcomeScreen() {
  clearScreen();
  
  backgroundWall.drawWall();
  
  flappuBird.drawBird();
  
  obstacle1.drawObstacle();
  obstacle2.drawObstacle();
  
  displayWelcomeMessage();
}

void clearScreen() {
  fill(255);
  rect(0,0,width,height);
}

void handleScore() {
  textSize(30);
  fill(0);
  text("" + __GAME_SCORE, width-100, 40);
  __GAME_SCORE++;
}

void displayWelcomeMessage() {
    textSize(20);
    fill(0);
    text("Press a key or tap screen to start game", 30, 50);
}

void displayGameOverMessage() {
    PImage img = loadImage("play.png");
    image(img, width/2-img.width/2, height/2);
}
