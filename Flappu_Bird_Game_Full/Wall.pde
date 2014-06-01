class Wall {
  int barWidth  = 20;
  int blockSize = 10;
  int[] wall;
  int heightOfWall = height/4;
  
  public Wall() {
    wall = new int[2*__DISPLAY_SIZE/barWidth];
    // init
    for(int i=0; i<wall.length; i++) {
        wall[i] = 10;
    }
  }

  public void drawWall() {
    // move the walls one step back
    for(int i=0; i<wall.length-1; i++) {
        wall[i] = wall[i+1];
    } 
      
    fill(0);
    // draws a new rect bar if this is true
    if(__GAME_SCORE % blockSize == 0) {
      // adjust height of wall based on difficult (level)
      heightOfWall +=  __GAME_DIFFICULTY;
      int lengthOfWall = (int)random(heightOfWall);
      if(lengthOfWall > height*0.45) {
        lengthOfWall = (int)random(height/3);;
      }
      // fill the end of wall with the new rectangle length
      wall[wall.length-1] = lengthOfWall;
    } else {
      // fill the end of wall with value same as previous length
      wall[wall.length-1] = wall[wall.length-2];
    }
    
    // draw the rectangle bars for walls  
    for(int i=0,j=0; j<wall.length; i+=barWidth,j++) {
       // top
       fill(0x82, 0xCA, 0xFF);
       rect(i, 0, barWidth, wall[j]);
       // bottom
       fill(0x7F, 0x52, 0x17);
       rect(i, height-wall[j], barWidth, wall[j]);
    }
  }
}
