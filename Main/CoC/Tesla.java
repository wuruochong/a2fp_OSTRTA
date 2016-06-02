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

    static int cost = 300;
    int _timesPerShoot = 3;

    public Tesla(int x, int y) {
	super(x, y); 
	_hp = 350;
	_attackPower = 100;
	_critChance = .1;
	_range = 150;
	_attackRate = 180; // 3 times per second
    }

    // override shoot()
    public void shoot() {
	for ( int i = 0; i < _timesPerShoot; i++ )
	    super.shoot(); // shoot three times
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
	