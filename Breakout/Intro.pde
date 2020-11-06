void intro() { 
  background(#05017C);
  music();

  fill(255);
  textFont(Chopsic, 100);
  text("BREAKOUT", width/2, 250);

  textFont(FakeHope, 80);
  text("Click anywhere to begin!", width/2, 600);
}

void introClicks() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mode = GAME;
  }
}
