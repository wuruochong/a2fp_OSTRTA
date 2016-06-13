public class Time implements Comparable{

  int hour;
  int min;

  public Time(int a, int b) {
    hour = a;
    min = b;
  }

  public int compareTo(Object e){

      return ((((Time)e).hour)*60+((Time)e).min) - ((this.hour)*60+this.min);
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