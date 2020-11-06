void keyPressed() {
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == SHIFT) speed = 15;
  if (key == 'q') score = score + 20;
  if (key == 'o') mode = GAMEOVER;
  if (key == ' ') AutoOn = true;


  //  if (key == ' ' && mode == GAME) mode = PAUSE;
  //else if (key == ' ' && mode == PAUSE) mode = GAME;
}

void keyReleased() {
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == SHIFT) speed = 7;
  if (key == ' ') AutoOn = false;
}
