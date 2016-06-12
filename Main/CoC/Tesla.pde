// represents a tesla tower
/* Properties:
   - attacks first priority monster multiple times per shoot
   - slow attack rate
   - high attack power
   - high crit chance
   - high range
   - can attack air
   - medium hp
*/

public class Tesla extends Defense {

    int _timesPerShoot = 3;
    PImage icon;
    
    public Tesla(int x, int y) {
	super(x, y); 
	_hp = 350;
  _maxHP = 350;
  _mp = 300;
	_attackPower = 100;
	_critChance = .1;
	_range = 150;
	_attackRate = 90; // 3 times per second
    }

    // override shoot()
    public void shoot() {
	for ( int i = 0; i < _timesPerShoot; i++ )
	    super.shoot(); // shoot three times
    }
    
    
    void draw(){
      icon = loadImage("tesla.png");
      imageMode(CENTER);
      image(icon, _xcor, _ycor, 50, 50); 
      imageMode(CORNER);
      fill(0);     
    }
    
    void draw(LList<Monster> monsterList) {
      super.draw(monsterList);
          imageMode(CENTER);
    image(icon, _xcor, _ycor, 50, 50);
    imageMode(CORNER);
    }
    
    public void upgrade() {
	_attackPower = (int) (_attackPower * 1.2);
	_range = (int) (_range * 1.2);
	_hp = (int) (_hp * 1.1);
	_upgradeState += 1;
	if ( _upgradeState % 2 == 0 )
	    _timesPerShoot += 1;
    }

}
	
