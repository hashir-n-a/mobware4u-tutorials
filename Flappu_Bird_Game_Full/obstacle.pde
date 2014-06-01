// The height and length of bars change randomly
class Obstacle {
 
 int x;
 int y; 
 float barWidth   = 20;
 float barHeight  = 80;
 int moveBackStep = 20;
 
 public Obstacle() {
   x = width + 10;
   y = (int) random(height);
 }
 
 public Obstacle(int position) {
   x = position + width/2;
   y = (int) random(height);
 }
 
 public void drawObstacle() {
   if(y < height/2) {
      fill(0x82, 0xCA, 0xFF);
   } else {
      fill(0x7F, 0x52, 0x17);
   }
   rect(x, y, barWidth, barHeight);
   move();
 }
 
 private void move() {
   x -= moveBackStep;
   if(x <= 0) {
      x = width + 10; 
      y = (int) random(height*0.1, height*0.72);
      barHeight = (int) random(70, height*0.3);
   }
 }
}
