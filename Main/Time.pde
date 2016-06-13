public class Time implements Comparable{

  int hour;
  int min;

  public Time(int a, int b) {
    hour = a;
    min = b;
  }

  int compareTo(Object o) {

     int timeOne = (int) (((hour * 60) + min) * 60) / 1000000000;
     int timeTwo = (int) (((
     ((Time)o).hour * 60) + ((Time)o).min) * 60) / 1000000000;
     return timeTwo - timeOne;
  }

  void draw(int x) {
  rect(x, 600, 100, 100);
  textSize(12);
  fill(0);
  text(hour + " : " +  min, x+ 50, 650);
  fill(255);
  //println( ((Time)t).hour + " : " +  ((Time)t).min);

  }





}