import processing.sound.*;
SoundFile file;

Clock clock;
Calendar calen;
Calculator calc;
PFont font;
boolean showClock;


void setup() {
  size(560, 720);
  background(0);
  clock = new Clock();
  calen = new Calendar();
  calc = new Calculator();
  showClock = false;
  file = new SoundFile(this, "adele.mp3");
}

void draw() {
  if (showClock)
    clock.draw();
  else {
    background(0);
    calc.draw();
  }
}

void keyPressed() {
  showClock = true;
  file.loop();
}

void mousePressed() {
  showClock = !showClock;
  file.stop();
}