import javax.swing.JOptionPane;

  int tmpX;
  
public class Clock {
  
  int cx, cy, radius;
  float secondsRadius, minutesRadius, hoursRadius, clockDiameter;
  PFont font;
  PImage hImg;
  ArrayPriorityQueue<Time> alarm;
  Button addA;
  
  public Clock(){
   cx= width/2;
   cy=height/2;
   radius = min(width, height) / 2;
   secondsRadius = radius * 0.36;
   minutesRadius= radius * 0.30;
   hoursRadius= radius * 0.25;
   clockDiameter= radius * 0.8;
    hImg = loadImage("home.jpg");
   
  tmpX = 100;
  
  alarm = new ArrayPriorityQueue<Time>();
  addA = new Button(new int[] {980,100}, new int[] {1100, 200}, "addA", "add alarm", 0, new int[]{255, 255, 255}, new int[]{0,0,0}) ;
 
  }
  
  void draw() {
    background(255);
    //font = createFont ("Serif", 20);
    //textFont (font);
    textSize(60);
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
    String m;
    if (minute()< 10) m = "0" + min;
    else m = minute() + m
    text(str(hour()) + ':' + m), 100, 100); 
   textSize(20);
  
    // endShape();
    addA.draw();
  
  int tmpX = 50;
  for (int i = alarm._queue.size(); i > 0; i --) {
    ((Time)alarm._queue.get(i-1)).draw(tmpX);
    tmpX+=100;
  }
//  for (Object t: alarm) {
    //fill(0);
    //text((Time)t).hour, tmpY, 
  //  ((Time)t).draw(tmpX);
    //println( ((Time)t).hour + " : " +  ((Time)t).min);
   // tmpX+=100;
 // }
  
  }
 

 void keyPressed(){
  
 }
  
  void mousePressed() {
  
      if (addA.buttonPressed(0)){
        
      String time =  JOptionPane.showInputDialog("hour: ");
      String time2 =  JOptionPane.showInputDialog("min: ");
      
      try{
        Integer.parseInt(time);
        Integer.parseInt(time2);
      }
      catch (Exception e) {
        time = "0";
        time2 = "0";
      }
      
      Time newAlarm = new Time(Integer.parseInt(time), Integer.parseInt(time2));
      alarm.add (newAlarm); //implementation to add to queue
      //_buttons.add(new Button(new int[] {tmpX, 600}, new int[] {tmpX + 140, 700}, "time", newAlarm.hour + " : " + newAlarm.min, 0));
      //tmpX+= 160;
      //(int[] coor1, int[] coor2, String tag, String text, int screen)
    }
    
      //if (mouseX >= 950 && mouseX <=1000 && mouseY >= 400 && mouseY <= 440 ) {
    //state = 0;
  //}
    
    
    }
  }