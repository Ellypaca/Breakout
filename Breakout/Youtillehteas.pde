void reset() {
  //colors = new color[n];

  //bricks
  tempx = 175;
  tempy = 100;
  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 75;
    i++;
    if (tempx == 925) {
      tempx = 175;
      tempy = tempy + 100;
    }
  } 

  //score
  timer = 100;
  score = 0;
  lives = 3;

  //ball
  ballx = width/2;
  bally = height - height/4;
  balld = 30;
  vx = random(-7, -3);
  vy = random(-7, -3);

  //paddle
  paddlex = width/2;
}

void smallreset() {
  //ball
  ballx = width/2;
  bally = height - height/4;
  balld = 30;
  vx = random(-7, -3);
  vy = random(-7, -3);

  //paddle
  paddlex = width/2;

  //score
  timer = 100;
}

void music () {
  if (music.isPlaying() == false) { 
    music.rewind();
  }
  music.play();
}
