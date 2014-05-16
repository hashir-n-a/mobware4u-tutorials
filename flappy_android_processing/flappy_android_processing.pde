/**
  A tutorial on How to create a flappy bird style game on android ( or other platforms )
  using processing
  
  This is game is not perfect, but just an example to show how a game can built using processing
  that runs on an android phone
  
  By : Hashir N A, hashir@mobware4u.com
**/

// holds the flappy bird image
PImage img; 

// the x position of the bird at any time
int xPosition;

// the y position of the bird at any time
int yPosition;

void setup() {
  // set the size of the display to be full screen
  size(displayWidth, displayHeight);
  
  // we load the image
  img = loadImage("flappy.png");
  
  // initialize position of the bird
  xPosition = 0;
  yPosition = height/2;
  
  // set speed of the game
  frameRate(1000);
}

void draw() {
  
  drawWorld();
  
  // display the flappy bird at xPosition, yPosition
  image(img, xPosition, yPosition);
  
  // only change the position of the bird if its within
  // the screen
  if(yPosition < height - img.height) {
    if(xPosition < width - img.width) {
      
      // moves the bird forward
      xPosition = xPosition + 5;
      
      // moves the bird down
      yPosition = yPosition + 10;
    } 
  } 
  
  // checks if game is over
  checkWinWin();
}

/**
  Draw the background world for the game
**/
void drawWorld() {
  fill(255);
  rect(0,0,width,height);
  line(width-50, height/2, width, height/2);
}

/**
  Checks whether the game is over and status
**/  
void checkWinWin() {
  // are we at the right most end of the screen
  if(xPosition > width - img.width) { 
    
    // are we above the line
    if(yPosition < height/2) {
      writeMessage("WON");
    } else {
      writeMessage("LOST");
   }
  } else if( yPosition >= height - img.height) {
    // are we at the bottom most position of the screen
    writeMessage("LOST");
  }
}

/**
  Displays a text message on screen with black color, size 50
**/  
void writeMessage(String message) {
    fill(0);
    textSize(50);
    text(message ,width/2, 50);
}

/**
 Handle taps on the screen, tap moves the bird up
**/ 
void mousePressed() {
  yPosition = yPosition - 30;
}

