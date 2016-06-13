public class Event implements Comparable{
  int hour;
  int minute;
  String event;

  
  public Event(){
    hour = Integer.parseInt(JOptionPane.showInputDialog("Enter a hour"));
    minute = Integer.parseInt(JOptionPane.showInputDialog("Enter a minute"));
    event = JOptionPane.showInputDialog("Enter Event Name");
  }
  
  void draw(int xcor, int ycor){
    textSize(20);
    text(hour + ":" + minute + ":     " + event, xcor, ycor);
  }
  public int compareTo(Object e){
    
    return ((((Event)e).hour)*60+((Event)e).minute) - ((this.hour)*60+this.minute);
}
}