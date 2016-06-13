public class Time implements Comparable{

  int hour;
  int min;

  public Time(int a, int b) {
    hour = a;
    min = b;
  }

  public int compareTo(Object e){
     // int tNow = hour() * 60 + min();
      return ((((Time)e).hour)*60+((Time)e).min) - ((this.hour)*60+this.min);
  }

  void draw(int x) {
  rect(x, 600, 100, 100);
  textSize(12);
  fill(0);

  String m = "";
  if (min < 10) {
  m = "0" + min;
}
else m = min + " ";
textSize(10);

  text(hour + " : " +  m , x+ 50, 650);
//  textSize(60);

  fill(255);
  //println( ((Time)t).hour + " : " +  ((Time)t).min);

  }





}