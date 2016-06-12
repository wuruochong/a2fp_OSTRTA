import java.util.ArrayList;
// represents a defense tower
public class TownHall extends Tower{
  int _maxBuildings;
PImage icon;
    // constructor
    public TownHall(int x, int y) {
  _hp = 450;
  _maxHP = 450;
  _xcor = x;
  _ycor = y;
  _upgradeState = 0;
  _mp = 100; //subject to change
  _maxBuildings = 14; 
    }


    void draw() {
    icon = loadImage("townhall.png");
    image(icon, _xcor, _ycor, 70, 70); 
    text(_hp + " ", _xcor+50,  _ycor+20 );
    }



    public void upgrade() {

    }


}