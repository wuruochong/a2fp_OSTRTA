public class Planner{
  //CLList<Day> _container;
  Day mon;
  Day tue;
  Day wed;
  Day thu;
  Day fri;
  Day sat;
  Day sun;
  Day currDay;
  Button prevDay;
  Button nextDay;
  PImage bImg;
  Button addEvent;
  
  public Planner(){
    Day mon = new Day("Monday",sun,tue);
    Day tue = new Day("Tuesday",mon,wed);
    Day wed = new Day("Wednesday",tue,thu);
    Day thu = new Day("Thursday",wed,fri);
    Day fri = new Day("Friday",thu,sat);
    Day sat = new Day("Saturday",fri,sun);
    Day sun = new Day("Sunday", sat, mon);
    mon._prevDay = sun;
    mon._nextDay = tue;
    tue._nextDay = wed;
    wed._nextDay = thu;
    thu._nextDay = fri;
    fri._nextDay = sat;
    sat._nextDay = sun;
    currDay = mon;
    prevDay = new Button(new int[] {0, 300}, new int[] {150, 420},"prevDay", "Previous", 0);
    nextDay = new Button(new int[]{800,300}, new int[] {1000, 420}, "nextDay", "Next", 0);
    bImg = loadImage("wall.jpg");
    //addEvent = new Button(new int[]{800, 600}, new int[1000, 700}, "newE" "Add Event", 0);
    addEvent = new Button(new int[]{800,600}, new int[]{1000, 700}, "newE", "Add Event", 0);
  }
  
  void mousePressed(){
    currDay.mousePressed();
    if (prevDay.buttonPressed(0)){
      currDay = currDay.getPrev();
    }
    else if (nextDay.buttonPressed(0)){
      currDay = currDay.getNext();
    }

  }
  
  void draw(){
    image(bImg, 35, 20, 910, 720);
    currDay.draw();
    prevDay.draw();
    nextDay.draw();
  }
    
}