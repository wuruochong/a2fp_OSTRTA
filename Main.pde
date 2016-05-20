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
}

void draw() {
  if (showClock)
    clock.draw();
  else {background(0);}
}

void keyPressed() {
  showClock = true;
  file = new SoundFile(this, "adele.mp3");
  file.play();
}

void mousePressed() {
  showClock = !showClock;
}