import java.util.ArrayList;
// represents a defense tower
public class TownHall extends Tower{
  int _maxBuildings;

    // constructor
    public TownHall(int x, int y) {
  _hp = 450;
  _xcor = x;
  _ycor = y;
  _upgradeState = 0;
  _mp = 100; //subject to change
  _maxBuildings = 14; 
    }

    void draw() {

    }


    public void upgrade() {

    }


}