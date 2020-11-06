void game() {
  //if (frameCount % 2 > 0 {
  //  println(frameCount);
  //}

  music();

  colorMode(HSB);
  background(h, S, b);
  h = h + 0.1;
  // if (h == 351) h = 0;
  S = S + 0.1;
  //if (s == 66) s = 0;
  b = b + 0.1;

  if (h > 255 && S > 255 && b > 255) {
    h = random(0, 350);
    S = random(0, 65);
    b =  random(66, 98);
  }
  //if (b == 99) b = 66;
  //failed experiment
  //if (increasing == true) {
  //} else {
  //  h = h - 0.1;
  //  S = S - 0.1;
  //  b = b - 0.1;
  //}
  //if (h > 254 && S > 66 && b > 99) {
  //  increasing = false;
  //} else if (h < 50 && S < 50){
  //  increasing = true;
  //}

  colorMode(RGB);

  //timer
  timer--;
  fill(255);
  textFont(Plain, 50);
  if (timer > 0) {
    text("Click anywhere to Pause!", 450, 630);
  }

  //ending the game/score
  fill(255);
  square(100, 730, 90);
  fill(0);
  textFont(FakeHope, 90);
  text(score, 100, 730);
  textFont(Plain, 60);
  text("score", 100, 620);
  if (score == 40) {
    mode = GAMEOVER;
  }

  //losing the game/lives
  fill(255);
  square(810, 730, 90);
  fill(0);
  textFont(FakeHope, 90);
  text(lives, 810, 730);
  textFont(Plain, 60);
  text("lives", 810, 620);
  if (bally >= height) {
    lives = lives - 1;
    smallreset();
  } 
  if (lives == 0) {
    mode = GAMEOVER;
  }



  //paddle
  strokeWeight(3);
  stroke(0);
  fill(#FFEE88);
  circle(paddlex, paddley, paddled);

  //move poodle
  if (akey == true && paddlex > paddled/2) paddlex = paddlex - speed;
  if (dkey == true && paddlex < width-paddled/2) paddlex = paddlex + speed;

  if (AutoOn == true) {
    paddlex = ballx;
  }

  //ball
  fill(0);
  circle(ballx, bally, balld);
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }

  //bouncing
  if (bally <= balld/2) { //|| bally >= height - balld/2
    vy = vy * -1;
    wall.rewind();
    wall.play();
  }  
  if (ballx <= balld/2 || ballx >= width - balld/2) {
    vx = vx * -1;
    wall.rewind();
    wall.play();
  }

  if (dist(ballx, bally, paddlex, paddley) <= balld/2 + paddled/2) {
    vx = (ballx - paddlex)/15;
    vy = (bally - paddley)/15;
    boop.rewind();
    boop.play();
  }

  //argiheoikjrntagoj
  //if (vx > 7) {
  //  vx = 7;
  //} else if (vx < -7) {
  //  vx = -7;
  //}

  //if (vy > 7) {
  //  vy = 7;
  //} else if (vy < -7) {
  //  vy = -7;
  //}




  //limits
  if (bally < balld/2) {
    bally = balld/2;
  }

  if (ballx < balld/2) {
    ballx = balld/2;
  }

  if (ballx > width - balld/2) {
    ballx = width - balld/2;
  }

  //brick
  int i = 0;
  while (i < n) {
    if (alive[i]  == true) {
      manageBrick(i);
    } 
    i++;
  }



  //gif
  //  gif = new PImage[bonk.gif];
  //  int j = 0;
  //  while (j < 11) {
  //    gif[j] = loadImage("bonk.gif");
  //    j = j+1;
  //  }
}




void gameClicks() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mode = PAUSE;
  }
}

void manageBrick(int i) {
  if (y[i] == 100) fill(row1); 
  if (y[i] == 200) fill(row2); 
  if (y[i] == 300) fill(row3);
  if (y[i] == 400) fill(row4); 
  //if (y[i] == 500) fill(row5); 
  circle(x[i]-25, y[i], brickd); // -25
  if (dist(ballx, bally, x[i]-25, y[i]) <= balld/2 + brickd/2) {
    vx = (ballx - x[i])/5;
    vy = (bally - y[i])/5;
    beep.rewind();
    beep.play();
    score++;
    alive[i] = false;
  }
}
