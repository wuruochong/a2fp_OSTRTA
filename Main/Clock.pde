import javax.swing.JOptionPane;

public class Clock {
  
  int cx, cy, radius;
  float secondsRadius, minutesRadius, hoursRadius, clockDiameter;
  PFont font;
  PImage hImg;
  ArrayPriorityQueue alarm;
  Button addA;
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
 
  }
  
  void draw() {

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
      String time =  JOptionPane.showInputDialog("hour: ");
  
  }
 

 void keyPressed(){
  
 }
  
  void mousePressed() {
  
      if (addA.buttonPressed(0)){
        
      String time =  JOptionPane.showInputDialog("hour: ");
      
      String time2 =  JOptionPane.showInputDialog("min: ");
      
     // alarm.add (); //implementation to add to queue

    }
    }
  }