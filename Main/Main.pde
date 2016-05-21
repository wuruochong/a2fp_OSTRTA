//import processing.sound.*;
//SoundFile file;
PImage cImg, hImg, wImg, caImg, camImg; //clock, home, wallpaper, calculator, camera

Clock clock;
Calendar calen;
Calculator calc;
PFont font;
boolean showClock;
boolean home;

void setup() {
  //size(560, 720);
  size(1024, 760);
  background(255);
  clock = new Clock();
  calen = new Calendar();
  calc = new Calculator();
  showClock = false;
  home = false;
  
  //icon images
  wImg = loadImage("wall.jpg");
  cImg = loadImage("clock.png");
  hImg = loadImage("home.jpg");
  caImg = loadImage("calc.png");
  camImg = loadImage("cam.jpg"); 
  reset();
  //file = new SoundFile(this, "adele.mp3");
}

void reset() {
  image(wImg, 35, 20, 910, 720);
  image(camImg, 15, 350, 40, 40);
  image(cImg, 450, 550, 70, 70);
  image(hImg, 920, 370, 110, 110);
  image(caImg, 560, 550, 70, 70);
}

void draw() {
  if (showClock)
    clock.draw();
  if (home) {
    background(255);
    reset();
  }
}

void keyPressed() {
  showClock = true;
  //file.loop();
}

void mousePressed() {
  if (mouseX >= 440 && mouseX <= 500 && mouseY >= 540 && mouseY <=600) {
    showClock =true;
    home=false;
    //file.stop();
  }
  if (mouseX >= 910 && mouseX <=1024 && mouseY >= 360 && mouseY <= 480 ) {
    home = true;
    showClock=false;
  }
}
