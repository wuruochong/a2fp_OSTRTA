import java.util.ArrayList;
// represents a defense tower
public class Defense extends Tower implements Comparable{
    int _attackPower;
    float _critChance;
    int _splashRadius;
    ArrayPriorityQueue<Monster> _monstersToShoot;
    boolean _attackAir;

    int _attackRate; // fires once per every _fireRate draw()
    int _drawTicks; // keeps track of how many draws
  double dir; //direction to shoot
  PImage cBall; //canon ball
  
    static final int cost = 100;

    // constructor
    public Defense(int x, int y) {
	_hp = 100;
  _maxHP = 100;
	_xcor = x;
	_ycor = y;
	_upgradeState = 0;
	_attackPower = 10;
	_critChance = 0.01;
	_range = 50;
	_splashRadius = 0;
	_monstersToShoot = new ArrayPriorityQueue<Monster>();
	_attackAir = false;
	_attackRate = 30; // once per second
  _id = (int) (Math.random() * 500);

   _mp = 100; //subject to change
    }

    void draw(LList<Monster> monsterList) {
          fill(0); 
          text(_hp + " ", _xcor+70,  _ycor+40 );
	        queueMonsters(monsterList);

	        if ( (! _monstersToShoot.isEmpty() ) && _drawTicks % _attackRate == 0 ){
  
	          shoot();
  
          }
	      _drawTicks += 1;
    }

    // determines exactly how to attack monsters (e.g. individual damage, collateral damage, etc.)
    // modify in subclasses to fit tower descriptions
    public void shoot() {
	    // remove left-over dead monsters from queue
	    while ( !_monstersToShoot.isEmpty() && ! ((Monster)(_monstersToShoot.peekTop())).isAlive() )
	        _monstersToShoot.removeTop();

       if ( !_monstersToShoot.isEmpty() ) {   
         Monster target = (Monster)_monstersToShoot.peekTop();
      Bullet b = new Bullet(_xcor, _ycor, target);
        b.display();         
         
	      attack(target, false);
        
	      if ( _splashRadius != 0 ) { // if there is splash damage
	        // find all monsters in splash radius
	        for ( Object monster : _monstersToShoot) {
		        if ( ((Monster)monster).isAlive() && inRadius((((Unit)target)),(Unit) monster, _splashRadius) )
		          attack((Monster)monster, true); // attack them w/ splash damage
	        }
	      } 
       }
    }
    

    // deals damage to enemy equal to damage instance var, with crit chance factored in, to enemy
    // if splash is true, that means this damage is due to splash damage
    // returns true if the enemy is dead after attack
    public boolean attack(Monster enemy, boolean splash){
	    int multiplier = 1;
	    if ( Math.random() < _critChance )
	      multiplier *= 10;
	    if ( splash )
	      multiplier /= 5;
      //println("hi");
	    return enemy.takeDamage( (int) multiplier * _attackPower);
    }

    // queues Monsters into things to shoot for this tower if not already in queue and in radius
    public void queueMonsters(LList<Monster> monsterList) {
      for ( Object monster : _monstersToShoot ){
        ((Monster)monster).setTower(this);
      }
      // remove out of range monsters
      Iterator<Comparable> iter = _monstersToShoot.iterator();
      while ( iter.hasNext() ) {
        Monster monster = (Monster)(iter.next());
        if ( ! inRadius(monster) )
          iter.remove();
      }
      
      /*
      for ( Object monster : _monstersToShoot ) {
        if ( ! inRadius( (Monster) monster ) )
          _monstersToShoot.remove((Monster) monster);
      } */
      
	    for ( Monster monster : monsterList ) {
	      if ( (! _attackAir) && monster.isFlying ) // do not queue flying monsters if tower cannot attack them
		      ; // do nothing
	      else if ( ! _monstersToShoot.contains(monster) && inRadius(monster) ){
          monster.setTower(this);
		      _monstersToShoot.add(monster);
        }
    	}
    }	

    public void upgrade() {
	    _attackPower = (int) (_attackPower * 1.1);
	    _range = (int) (_range * 1.1);
	    _hp = (int) (_hp * 1.1);
	    _splashRadius = (int) (_splashRadius * 1.1);
	    _upgradeState += 1;
    }

    /** HELPER METHODS BELOW **/
    // returns true if enemy is in shoot radius of the tower
    public boolean inRadius(Monster enemy) {
	    double dist = Math.hypot(this._xcor - enemy._xcor, this._ycor - enemy._ycor);
	    return dist <= _range;
    }

    // returns true if enemy2 is in specified radius of enemy1
    private boolean inRadius(Unit enemy1, Unit enemy2, int radius) {
	    return radius >= (int) ( Math.hypot(enemy1._xcor - enemy2._xcor, enemy1._ycor - enemy2._ycor) );
    }
    
    // IMPLEMENT LATER
    public int compareTo(Object o ) {
      return 0; 
    }

}