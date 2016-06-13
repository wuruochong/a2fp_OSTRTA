public class Event implements Comparable{
  int hour;
  int minute;
  String event;

  
  public Event(){
    try{
      hour = Integer.parseInt(JOptionPane.showInputDialog("Enter a hour"));
    }
    catch (Exception e){
      hour = 0;
    }
    try{
      minute = Integer.parseInt(JOptionPane.showInputDialog("Enter a minute"));
    }
    catch (Exception e){
      minute = 0;
    }
    event = JOptionPane.showInputDialog("Enter Event Name");
  }
  
  void draw(int xcor, int ycor){
    textSize(20);
    if ( minute < 10 && hour < 10 )
      text("0"+ hour + ":0" + minute + ":   " + event, xcor, ycor);
    else if ( minute < 10 )
      text(hour + ":0" + minute + ":   " + event, xcor, ycor);
    else if ( hour < 10 )
      text("0"+ hour + ":" + minute + ":   " + event, xcor, ycor);
    else
      text(hour + ":" + minute + ":     " + event, xcor, ycor);
  }
  
  public int compareTo(Object e){
    
    return ((((Event)e).hour)*60+((Event)e).minute) - ((this.hour)*60+this.minute);
}
}