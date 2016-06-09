// represents a sniper tower
/* Properties:
   - one enemy at a time
   - relatively slow attack rate
   - semi-high attack power
   - high crit chance
   - high range
   - can attack air
   - medium hp
*/

public class Sniper extends Defense {
  
      PImage icon;
      
    public Sniper(int x, int y) {
	super(x, y); 
	_hp = 250;
	_attackPower = 50;
	_critChance = .1;
	_range = 200;
	_attackAir = true;
	_attackRate = 120; // once per 2 seconds
    }

    public void upgrade() {
	_attackPower = (int) (_attackPower * 1.2);
	_range = (int) (_range * 1.2);
	_hp = (int) (_hp * 1.1);
	_upgradeState += 1;
    }
    
    
    void draw(){
      icon = loadImage("sniper.gif");
    image(icon, _xcor + icon.width/2, _ycor + icon.height/2, 50, 50); 
        fill(0); 
   text(_hp + " ", _xcor+70,  _ycor+40 ); 
    
    }
}
	
