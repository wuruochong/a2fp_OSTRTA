import java.util.ArrayList;
// represents a defense tower
public class GoldMine extends Resource{
  
    // constructor
    public GoldMine(int x, int y) {
      super(x,y);
      _isGold = true;   
      
      _gold = 50; // to give out during battle
  
    }
    
    public GoldMine(int x, int y, int gold) {
    
    this(x, y);
    _gold = gold;
    
    }

    void draw() {
      icon = loadImage("goldmine.png");
    imageMode(CENTER);
    image(icon, _xcor, _ycor, 60, 60);
    imageMode(CORNER);
     // image(icon, _xcor + icon.width/2, _ycor + icon.height/2, 60, 60); 
    }
    
    void draw(int xcor, int ycor) {
      //icon = loadImage("goldmine.png");
          imageMode(CENTER);
    image(icon, mouseX,mouseY, 60, 60);
    imageMode(CORNER);
      //image(icon, mouseX + icon.width/2, mouseY + icon.height/2, 60, 60);
    }


}
