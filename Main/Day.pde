public class Day {
  int _currDay;
  Day _nextDay;
  
//Constructor 
  Day( int value, Day next ){
    _currDay = value;
    _nextDay = next; }
  
  Day getNext() {return _nextDay;}
   
  int getDay() {
    return _currDay;
  }
  
  void setDay(int newCurr) {
    _currDay = newCurr; 
  }
  
  void setNext (Day next) {
    _nextDay = next;
  }
}