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

public class Canon extends Defense {
    
    public Canon(int x, int y) {
	super(x, y); 
	_hp = 350;
	_attackPower = 25;
	_critChance = .05;
	_range = 100;
	_splashRadius = 50;
	_attackAir = false;
	_attackRate = 60; // once per second
    }

    public void upgrade() {
	_attackPower = (int) (_attackPower * 1.1);
	_range = (int) (_range * 1.1);
	_hp = (int) (_hp * 1.1);
	_splashRadius = (int) (_splashRadius * 1.1);
	_upgradeState += 1;
    }

}
	