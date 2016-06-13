public class Day {
  String _day;
//  ArrayPriorityQueue<Event> _events;
  Day _nextDay;
  Day _prevDay;
  
  public Day(String day){
    _day = day;
 //   _events = new ArrayPriorityQueue<Event>;
    _nextDay = null;
    _prevDay = null;
  }
  public Day(String day, prevDay, nextDay){
    _day = day;
    _prevDay = prevDay;
    _nextDay = nextDay;
  }
  void draw(){
    fill(0);
    textSize(30);
    text(_day, 550, 0);
  }
}