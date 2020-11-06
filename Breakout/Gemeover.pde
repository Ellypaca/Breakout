void gameover() {
  background(255);

  music.pause();

  //stuff
  if (score == 40) {
    win.play();
    image(senko[s], 0, 0, 477, 553);
    println(frameCount);
    if (frameCount % 4 == 0) s++; 
    if (s == numberOfFramesSenko) s = 0;
    fill(255);

    //to cover up a few pixels that are bothering me
    stroke(255);
    rect(500, 500, 50, 50);

    fill(255, 139, 23);
    textFont(FakeHope);
    text("Congratulations,", 700, 300);
    fill(#FF7605);
    text("you won!", 700, 380);

    fill(0);
    textFont(Plain);
    text("Click anywhere to continue!", width/2, 700);
  } else {
    lose.play();
    image(illusion[f], 0, 0, width, 900);
    println(frameCount);
    if (frameCount % 1 == 0) f++; 
    if (f == numberOfFrames) f = 0;

    fill(255);
    textFont(FakeHope, 100);
    text("You Lost!,", width/2, 300);

    textFont(Plain);
    text("Click anywhere to continue!", width/2, 700);
  }
}

void gameoverClicks() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    reset();
    win.pause();
    lose.pause();
    win.rewind();
    lose.rewind();

    mode = INTRO;
  }
}
