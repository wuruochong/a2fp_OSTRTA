// represents a defense tower
public class Defense{
    int _attackPower;
    float _critChance;
    int _range;
    int _splashRadius;
    ArrayPriorityQueue _monstersToShoot;
    boolean _attackAir;

    int _fireRate; // fires once per every _fireRate draw()
    int _drawTicks; // keeps track of how many draws
    
    // constructor
    public Defense(int x, int y) {
	_hp = 100;
	_xcor = x;
	_ycor = y;
	_upgradeState = 0;
	_attackPower = 10;
	_critChance = 0.01;
	_range = 50;
	_splashRadius = 0;
	_monstersToShoot = new ArrayPriorityQueue<Monsters>();
	_attackAir = false;
    }

    void draw(List<Monsters> monsterList) {
	queueMonsters(monsterList);
	if ( _drawTicks % _fireRate == 0 )
	    shoot();
	_drawTicks += 1;
    }

    // determines exactly how to attack monsters (e.g. individual damage, collateral damage, etc.)
    // modify in subclasses to fit tower descriptions
    public void shoot() {
	// remove left-over dead monsters from queue
	while ( ! _monstersToShoot.peekTop().isAlive() )
	    _monstersToShoot.removeTop();

	Monster target = _monstersToShoot.peekTop();
	attack(target, false);
	if ( _splash != 0 ) { // if there is splash damage
	    // find all monsters in splash radius
	    for ( Monster monster : _monstersToShoot ) {
		if ( monster.isAlive() && inRadius(target, monster, _splash) )
		    attack(monster, true); // attack them w/ splash damage
	    }
	}
    }
	
    // deals damage to enemy equal to damage instance var, with crit chance factored in, to enemy
    // if splash is true, that means this damage is due to splash damage
    // returns true if the enemy is dead after attack
    public boolean attack(Monster enemy, boolean splash){
	int mulitplier = 1;
	if ( Math.random() < _critChance )
	    multiplier *= 10;
	if ( splash )
	    multiplier /= 5;

	return enemy.takeDamage( (int) multiplier * _attackPower);
    }
    
    // queues Monsters into things to shoot for this tower if not already in queue and in radius
    public void queueMonsters(List<Monster> monsterList) {
	for ( Monster monster : monsterList ) {
	    if ( (! _attackAir) && monster.isFlying() ) // do not queue flying monsters if tower cannot attack them
		; // do nothing
	    else if ( inRadius(monster) && ! monsterList.contains(monster) )
		_monstersToShoot.add(monster);
	}
    }
    
    /** HELPER METHODS BELOW **/
    // returns true if enemy is in shoot radius of the tower
    public boolean inRadius(Monster enemy) {
	float dist = Math.hypot(this._xcor - enemy._xcor, this._ycor - enemy._ycor);
	return dist <= _range;
    }

    // returns true if enemy2 is in specified radius of enemy1
    private boolean inRadius(Monster enemy1, Monster enemy2, int radius) {
	return radius >= (int) ( Math.hypot(enemy1._xcor - enemy2._xcor, enemy1._ycor - enemy2._ycor) );
    }
    
}
