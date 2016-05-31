// represents a defense tower
public class Defense{
    int _attackPower;
    float _critChance;
    int _range;
    ArrayPriorityQueue _monstersToShoot;

    // constructor
    public Defense(int x, int y) {
	_hp = 100;
	_xcor = x;
	_ycor = y;
	_upgradeState = 0;
	_attackPower = 10;
	_critChance = 0.01;
	_range = 50;
	_monstersToShoot = new ArrayPriorityQueue<Monsters>();
    }
    
    // deals damage to enemy equal to damage instance var, with crit chance factored in
    // returns true if the enemy is dead after attack
    public boolean attack(Monster enemy){
	if ( Math.random() < _critChance )
	    return enemy.takeDamage(10 * _attackPower);
	else
	    return enemy.takeDamage(_attackPower);
    }
    
    
    // returns true if enemy is in shoot radius of the tower
    public boolean inRadius(Monster enemy) {
	float dist = Math.hypot(this._xcor - enemy._xcor, this._ycor - enemy._ycor);
	return dist <= _range;
    }
    
}
