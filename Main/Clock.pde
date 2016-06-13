import javax.swing.JOptionPane;

  int tmpX;
  
public class Clock {
  
  int cx, cy, radius;
  float secondsRadius, minutesRadius, hoursRadius, clockDiameter;
  PFont font;
  PImage hImg;
  ArrayPriorityQueue<Time> alarm;
  Button addA;
  ArrayList<Button> _buttons = new ArrayList<Button>();
  
  public Clock(){
   cx= width/2;
   cy=height/2;
   radius = min(width, height) / 2;
   secondsRadius = radius * 0.36;
   minutesRadius= radius * 0.30;
   hoursRadius= radius * 0.25;
   clockDiameter= radius * 0.8;
   
  tmpX = 100;
  
  alarm = new ArrayPriorityQueue<Time>();
  addA = new Button(new int[] {780,200}, new int[] {1000, 360}, "addA", "add alarm", 0, new int[]{255, 255, 255}, new int[]{0,0,0}) ;
 
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
  
 /* for (Object t: alarm) {
    rect(tmpX, 600, 100, 100);
    fill(0);
    text(( (Time)t).hour + " : " +  ((Time)t).min,tmpX+ 20, 800);
    println( ((Time)t).hour + " : " +  ((Time)t).min);
  }*/
  
  for (Button b: _buttons) {
    b.draw();
  }
  }
 

 void keyPressed(){
  
 }
  
  void mousePressed() {
  
      if (addA.buttonPressed(0)){
        
      String time =  JOptionPane.showInputDialog("hour: ");
      String time2 =  JOptionPane.showInputDialog("min: ");
      
      Time newAlarm = new Time(Integer.parseInt(time), Integer.parseInt(time2));
      alarm.add (newAlarm); //implementation to add to queue
      _buttons.add(new Button(new int[] {tmpX, 600}, new int[] {tmpX + 140, 700}, "time", newAlarm.hour + " : " + newAlarm.min, 0));
      tmpX+= 160;
      //(int[] coor1, int[] coor2, String tag, String text, int screen)
    }
    }
  }
