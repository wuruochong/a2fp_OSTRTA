public class Clock {
  
  int cx, cy, radius;
  float secondsRadius, minutesRadius, hoursRadius, clockDiameter;
  PFont font;
  PImage hImg;
  ArrayPriorityQueue alarm;
  Button addA;
  Button hourSwitch;
  Button minSwitch;
  Button select;
  int state; //0 - viewing, 1-adding alarm
  
  int hour;
  int min;
  boolean currH = true; //editing hour
  
  public Clock(){
   cx= width/2;
   cy=height/2;
   radius = min(width, height) / 2;
   secondsRadius = radius * 0.72;
   minutesRadius= radius * 0.60;
   hoursRadius= radius * 0.50;
   clockDiameter= radius * 1.8;
  
  alarm = new ArrayPriorityQueue();
  addA = new Button(new int[] {780,600}, new int[] {1000, 760}, "addA", "add alarm", 0, new int[]{255, 255, 255}, new int[]{0,0,0}) ;
  hourSwitch = new Button(new int[] {200,500}, new int[] {400, 760}, "add", "12", 1, new int[]{255, 255, 255}, new int[]{0,0,0}) ;
  minSwitch = new Button(new int[] {580,500}, new int[] {1000, 760}, "sub", "0"), 1, new int[]{255, 255, 255}, new int[]{0,0,0}) ;

  select = new Button(new int[] {780,600}, new int[] {1000, 760}, "select", "submit", 1, new int[]{255, 255, 255}, new int[]{0,0,0}) ;
 
  }
  
  void draw() {
    if (state==0) {
    background(255);
    font = createFont ("Serif", 60);
    textFont (font);
    textAlign(LEFT);
    // Draw the clock background
    fill(225);
    noStroke();
    ellipse(cx, cy, clockDiameter, clockDiameter);

    // Angles for sin() and cos() start at 3 o'clock;
    // subtract HALF_PI to make them start at the top
    float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
    float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
    float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

    // Draw the hands of the clock
    stroke(249,25,25); // red second hand
    strokeWeight(1);
    line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
    
    stroke(0); // black minute and hour hands;
    strokeWeight(2);
    line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
    
    strokeWeight(5);
    line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);

    // Draw the minute ticks
    strokeWeight(2);
    beginShape(POINTS);
    for (int a = 0; a < 360; a+=6) {
      float angle = radians(a);
      float x = cx + cos(angle) * secondsRadius;
      float y = cy + sin(angle) * secondsRadius;
      vertex(x, y);
    }
    text(str(hour()) + ':' + str(minute()), 100, 100); 
    hImg = loadImage("home.jpg");
    image(hImg, 920, 370, 110, 110);
    // endShape();
    addA.draw();

  }
  
   if (state == 1) {
      background(0);
     hourSwitch.draw();
     minSwitch.draw();
     
     
    }
  }
 

 void keyPressed(){
   if (key == "a") {
    (if !currH){
    currH = true;
    }
   }
   
   if (key == "w") {
     if (currH) {
       hourSwitch.displayText = "" + ((Integer.parseInt(hourSwitch.displayText) + 1 ) % 12);
     }
     else {
       minSwitch.displayText = "" + ((Integer.parseInt(minSwitch.displayText) + 1 ) % 60);
     
     }
     
   }
   
   if (key == "s") {
     if (currH) {
       hourSwitch.displayText = "" + ((Integer.parseInt(hourSwitch.displayText) - 1 ) % 12);
     }
     else {
       minSwitch.displayText = "" + ((Integer.parseInt(minSwitch.displayText) - 1 ) % 60);
     
     }
   }
   
   if (key == "d") {
     if (currH) {
       currH = false;
     }
   }
 }
  
  void mousePressed() {
  
      if (addA.buttonPressed(0)){
      state = 1;
    }
    if (select.buttonPressed(1)) {
    `  alarm.add(Integer.parseInt(hourSwitch.displayText) * 60 + Integer.parseInt(minSwitch.displayText) - //current Time);
    }
//     println(mouseX mouseY);
    }
  }
}