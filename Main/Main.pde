//import processing.sound.*;
//SoundFile file;
PImage cImg, hImg, wImg, caImg, camImg, CoCImg; //clock, home, wallpaper, calculator, camera

Clock clock;
Calendar calen;
Calculator calc;
CoC CoC;
boolean showClock;
boolean home;
boolean coc;
boolean cal;

int state = 0; // 0 - VIEW, 1- CLOCK, 

void setup() {
  //size(560, 720);
  size(1024, 760);
  //size(1000,1000);
  background(255);
  clock = new Clock();
  calen = new Calendar();
  calc = new Calculator();
  CoC = new CoC();
  showClock = false;
  home = false;
  coc = false;
  cal = false;
  
  //icon images
  wImg = loadImage("wall.jpg");
  cImg = loadImage("clock.png");
  hImg = loadImage("home.jpg");
  caImg = loadImage("calc.png");
  camImg = loadImage("cam.jpg");
  CoCImg = loadImage("CoC.jpg");
  reset();
  //file = new SoundFile(this, "adele.mp3");
}

void reset() {
  image(wImg, 35, 20, 910, 720);
  image(camImg, 15, 350, 40, 40);
  image(cImg, 450, 550, 70, 70);
  image(hImg, 920, 370, 110, 110);
  image(caImg, 560, 550, 70, 70);
  image(CoCImg, 670, 550, 70, 70);
}

void draw() {
  if (state == 1)
    {clock.draw();
   }
  else if (coc){
    CoC.setup();
    CoC.draw();
  }
  else if (cal) {
    calc.draw();}
  if (home) {
    background(255);
    reset();
     fill(0);
  text(mouseX + " : " + mouseY, mouseX + 2, mouseY+2);
  }
}

void keyPressed() {
  showClock = true;
  //file.loop();
}

void mousePressed() {
  if (state == 1){
  
     clock.mousePressed();
  }
  if (mouseX >= 440 && mouseX <= 500 && mouseY >= 540 && mouseY <=600) {
    showClock =true;
    home=false;
    state = 1;
    //file.stop();
  }
  if (mouseX >= 660 && mouseX <= 720 && mouseY >= 540 && mouseY <=600) {
    coc = true;
    home=false;
  }
  if (mouseX >= 550 && mouseX <= 620 && mouseY >= 540 && mouseY <=610) {
    cal = true;
    home=false;
  }
  if (mouseX >= 910 && mouseX <=1024 && mouseY >= 360 && mouseY <= 480 ) {
    home = true;
    showClock=false;
    coc = false;
  }
 
}
