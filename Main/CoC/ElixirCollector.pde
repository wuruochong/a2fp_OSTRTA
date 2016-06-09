import java.util.ArrayList;
// represents a defense tower
public class ElixirCollector extends Resource{
  
    // constructor
    public ElixirCollector(int x, int y) {
      super(x,y);
      _isGold = false;   
    }

    void draw() {
      icon = loadImage("elixircollector.png");
      image(icon, _xcor + icon.width/2, _ycor + icon.height/2, 60, 60); 
    }


}