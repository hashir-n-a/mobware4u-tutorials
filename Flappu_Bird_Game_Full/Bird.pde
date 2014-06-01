
class Bird {
 
  // step by which bird moves forward
  int step = 5;
  
  // step by when the bird moves up when a key is tapped
  int fly_step = 20;
  
  PImage img;
   
  int birdY;
  int startX = width/2;
  boolean isCrashed = false;
   
   
   public Bird() {
      img = loadImage("flappy_medium.png");
      birdY = height/2;
   } 
   
   public void drawBird() {
      checkCrashed();
      image(img, startX, birdY);
      birdY += step; 
   }
  
  private void checkCrashed() {
      // a circle around the bird is checked for colour 
      // to identify a crash
      for(int i=0; i<360; i++) {
        float x = 18*cos((float)i) + startX+img.width/2;
        float y = 18*sin((float)i) + birdY+img.height/2;
        int colour = get((int)x, (int)y);
        if(colour != -1) {
           this.isCrashed = true;
           return;
        } 
      }
  }
  
  public void fly() {
    if(!this.isCrashed) {
      birdY -= fly_step;
    }
  }
  
}
