import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//framework
int mode;
final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;

//entities
float paddlex, paddley, paddled;
int speed = 7;
float ballx, bally, balld, vx, vy;


//keyboard variables
boolean akey, dkey, leftkey, rightkey;

//bricks
int [] x;
int [] y;
boolean [] alive; 
int brickd;
int n;
int tempx, tempy;

//colors
int [] colors;
color row1 = #ffffff;
color row2 = #cccccc;
color row3 = #999999;
color row4 = #666666;
color row5 = #333333;

float h, S, b;
boolean increasing;



//scoring
int score;
int lives;
int timer;

//optical illusion gif
PImage [] illusion;
int numberOfFrames;
int f;

//senko gif
PImage [] senko;
int numberOfFramesSenko;
int s;

//cheats 
boolean AutoOn;

//fonts
PFont Chopsic, FakeHope, Plain;


//sounds
Minim minim;
AudioPlayer music, beep, boop, wall, win, lose;

void setup() {
  brickd = 50;
  n = 40;
  x = new int[n];
  y = new int[n];
  alive = new boolean [n];
  //colors = new color[n];

  tempx = 175;  //starting point for the brick pattern
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


  size(1000, 800);
  mode = INTRO;


  //initialize paddle
  rectMode(CENTER);
  paddlex = width/2;
  paddley = height - paddled/2;
  paddled = 170;

  //initialize ball 
  ballx = width/2;
  bally = height - height/4;
  balld = 30;
  vx = random(-7, -3);
  vy = random(-7, -3);


  //initialize score
  timer = 100;
  lives = 3;

  //initialize gif Illusion
  numberOfFrames = 10;
  illusion = new PImage [numberOfFrames];
  int j = 0;
  while (j < numberOfFrames) {
    illusion[j] = loadImage("frame_"+j+"_delay-0.06s.gif");
    j++;
  }

  //initialize gif Senko
  numberOfFramesSenko = 2;
  senko = new PImage [numberOfFramesSenko];
  int z = 0;
  while (z < numberOfFramesSenko) {
    senko[z] = loadImage("frame_"+z+"_delay-0.1s.gif");
    z++;
  }



  //text 
  textAlign(CENTER, CENTER);
  Chopsic = createFont("Chopsic-K6Dp.ttf", 50); //https://www.fontspace.com/chopsic-font-f34074
  FakeHope = createFont("FakeHope.ttf", 80);//https://www.dafont.com/fake-hope.font
  Plain = createFont("Louis George Cafe.ttf", 60); //https://www.dafont.com/louis-george-caf.font

  //colors
  h = random(0, 350);
  S = random(0, 65);
  b =  random(66, 98);
  increasing = true;

  //sounds
  minim = new Minim(this);
  music = minim.loadFile("intromusic.mp3");
  beep = minim.loadFile("beep.wav");
  boop = minim.loadFile("boop.wav");
  wall = minim.loadFile("wall.mp3");
  win = minim.loadFile("win.wav");
  lose = minim.loadFile("failure.wav");
}




void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    System.out.println("Mode error: " + mode);
  }
}
