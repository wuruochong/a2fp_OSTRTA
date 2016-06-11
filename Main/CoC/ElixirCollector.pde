import java.util.ArrayList;
// represents a defense tower
public class ElixirCollector extends Resource{
  
    // constructor
    public ElixirCollector(int x, int y) {
      super(x,y);
      _isGold = false;
      
     _elixir = 50;   
    }
    
    public ElixirCollector(int x, int y, int e){
      this(x,y);
      
      _elixir = e;
    
    }

    void draw() {
      icon = loadImage("elixircollector.png");
          imageMode(CENTER);
    image(icon, _xcor, _ycor, 50, 50);
    imageMode(CORNER);
     // image(icon, _xcor + icon.width/2, _ycor + icon.height/2, 60, 60); 
    }


}
