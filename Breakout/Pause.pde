void pause() {
  background(120);
  music.pause();

  fill(255);
  textFont(FakeHope, 120);
  text("PAUSE", width/2, 300);
  textFont(Plain, 80);
  text("Click again to resume", width/2, 600);
}

void pauseClicks() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mode = GAME;
  }
}
