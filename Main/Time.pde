public class Time implements Comparable{
  
  int hour;
  int min;
  
  public Time(int a, int b) {
    hour = a;
    min = b;  
  }
  
  int compareTo(Object o) {
    
     double timeOne = (double) (((hour * 60) + min) * 60) / 1000000000.0;
     double timeTwo = (double) (((  
     ((Time)o).hour * 60) + ((Time)o).min) * 60) / 1000000000.0;
     long timeNow = System.nanoTime();
     if (timeNow - timeOne > timeNow - timeTwo) {
       return 1;  
     }
     else return -1; 
  }
  




}
