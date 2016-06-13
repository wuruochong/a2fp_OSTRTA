public class Time implements Comparable{

  int hour;
  int min;

  public Time(int a, int b) {
    hour = a;
    min = b;
  }

  public int compareTo(Object e){

      // if returns positive number, lower priority
      int tNow = hour() * 60 + minute();
      int oTime = (( ((Time)e).hour)*60+((Time)e).min);
      int myTime = ((this.hour)*60+this.min);
      
      if ( tNow > myTime && tNow > oTime ) {
        return (tNow - oTime) - (tNow - myTime);
      }
      else if ( tNow > myTime )
        return 1;
      else if ( tNow > oTime )
        return -1;
      else {
        return (myTime - tNow) - (oTime - tNow);
      }
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