// represents a canon tower
/* Properties:
   - hits multiple at once
   - medium attack rate
   - low attack power
   - low crit chance
   - low range
   - can't attack air
   - medium hp
*/

public class Wall extends Tower {
    
  PImage icon;
  
    public Wall(int x, int y) {
_xcor = x;
_ycor = y;
  _hp = 150;
  _maxHP = 150;
  _mp = 100;
   icon = loadImage("walls.png");
   
    }

    public void upgrade() {
  _hp = (int) (_hp * 1.3);
  _upgradeState += 1;
    }
    
    void draw(){
      super.draw();
    imageMode(CENTER);
    image(icon, _xcor, _ycor, 25, 25);
    imageMode(CORNER);
     //image(icon, _xcor + icon.width/2, _ycor + icon.height/2, 50, 50);
      fill(0); 
     text(_hp + " wall ", _xcor+50,  _ycor+35 ); 
    
    }
    
    

}
  