public class Day {
  String _day;
  ArrayPriorityQueue<Event> _events;
  Day _nextDay;
  Day _prevDay;
  Button addEvent;
  
  
  public Day(String day){
    _day = day;
 //   _events = new ArrayPriorityQueue<Event>;
    _nextDay = null;
    _prevDay = null;
    addEvent = new Button(new int[]{800,600}, new int[]{1000, 700}, "newE", "Add Event", 0);
    _events = new ArrayPriorityQueue<Event>();
  }
  public Day(String day, Day prevDay, Day nextDay){
    _day = day;
    _prevDay = prevDay;
    _nextDay = nextDay;
    addEvent = new Button(new int[]{800,600}, new int[]{1000, 700}, "newE", "Add Event", 0);
    _events = new ArrayPriorityQueue<Event>();
  }
  
  Day getPrev(){
    return _prevDay;
  }
  
  Day getNext(){
    return _nextDay;
  }
  
  void mousePressed(){
     if (addEvent.buttonPressed(0)){
      Event temp = new Event();
      _events.add(temp);
     }
  }
      
  
  void draw(){
    fill(0);
    textSize(30);
    text(_day, 550, 100);
    addEvent.draw();
    int yTemp = 150;
    for (Object e : _events){
      ((Event)e).draw(300,yTemp);
      yTemp+=50;
    }
  }
}