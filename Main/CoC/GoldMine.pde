import java.util.ArrayList;
// represents a defense tower
public class GoldMine extends Resource{
  
    // constructor
    public GoldMine(int x, int y) {
      super(x,y);
      _isGold = true;   
    }

    void draw() {
      icon = loadImage("goldmine.png");
      image(icon, _xcor + icon.width/2, _ycor + icon.height/2, 60, 60); 
    }
    
    void draw(int xcor, int ycor) {
      icon = loadImage("goldmine.png");
      image(icon, mouseX + icon.width/2, mouseY + icon.height/2, 60, 60);
    }


}