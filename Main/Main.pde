import processing.sound.*;
SoundFile file;
PImage cImg, hImg, wImg; //clock, home, wallpaper

Clock clock;
Calendar calen;
Calculator calc;
PFont font;
boolean showClock;
boolean home;

void setup() {
  size(560, 720);
  background(0);
  clock = new Clock();
  calen = new Calendar();
  calc = new Calculator();
  showClock = false;
  home = false;
  
  //icon images
  wImg = loadImage("wall.jpg");
  image(wImg, 20, 60, 520, 590);
  cImg = loadImage("clock.png");
  image(cImg, 450, 550, 70, 70);
  hImg = loadImage("home.png");
  image(hImg, 250, 640, 60, 60);
  file = new SoundFile(this, "adele.mp3");
}

void reset() {
  image(wImg, 20, 60, 520, 590);
  image(cImg, 450, 550, 70, 70);
  image(hImg, 250, 640, 60, 60);
}

void draw() {
  if (showClock)
    clock.draw();
  if (home) {
    background(0);
    reset();
  }
}

void keyPressed() {
  showClock = true;
  file.loop();
}

void mousePressed() {
  if (mouseX >= 440 && mouseX <= 500 && mouseY >= 540 && mouseY <=600) {
    showClock = !showClock;
    home=false;
    file.stop();
  }
  if (mouseX >= 240 && mouseX <=310 && mouseY >= 620 && mouseY <= 660 ) {
    home = !home;
  }
}