public class Calendar {

  Day _head;
  Day _tail;
  int _size;
  int _year;
  int _month;
  int[] daysinMonth = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
  
  Calendar(){}
  
  Calendar(int mon, int day, int year){
   _head = null;
   _tail =null;
   _size = 0;
   _year = year;
   _month = mon;
  }

void addLast(int newDay){
    Day d = new Day(newDay,null);
    if(_head==null)
    {
       _head=d;
    }
    else
    {
      _tail.setNext(d);
    }
    _tail=d;
    _size++;
}

}