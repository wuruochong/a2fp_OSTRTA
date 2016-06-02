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

}
	