public class Monster extends Unit implements Comparable{

    boolean isFlying = false;
    int _range;
    int _trainingTime;
    int _moveSpeed;
    double _attackRange;
    int _dmgPerAttack;
    int _level;
    int _houseSpace;
    ArrayPriorityQueue _towersToShoot;
    

    public Monster(){

    }

    public Monster(int xcor, int ycor){
	_xcor = xcor;
	_ycor = ycor;
	_hp = 10;
	_mp = 10;
  _towersToShoot = new ArrayPriorityQueue<Tower>();
    }



    // deals damage to tower
    public boolean attack(Tower tower) {
  return tower.takeDamage( _dmgPerAttack);
    }
    
  public int levelup(){
      _level++;  
      _dmgPerAttack = (int) (_dmgPerAttack*1.3) ;
      _hp = (int) (_hp * 1.3);
      _mp = (int) (_mp * 1.5);
      
      return _level;

    }
    
  public int getAttackRange() {
    return (int)_attackRange;
  }
  
  public int getCost() {
    return _mp;
  }

  // determines exactly how to shoot towers
    public void shoot() {
    	while ( ! ((Tower)(_towersToShoot.peekTop())).isAlive() )
    	    _towersToShoot.removeTop();

    	Tower tower = (Tower)_towersToShoot.peekTop();
    	attack(tower);
    	    }



        // queues Towers into things to attack
        public void queueTowers(ArrayList<Tower> towerList) {
    	for ( Tower tower : towerList ) {
    	    if ( inRadius(tower) && ! towerList.contains(tower) )
    		    _towersToShoot.add(tower);
    	}
        }

        // returns true if tower is in attack radius of the monster
        public boolean inRadius(Tower tower) {
    	double dist = Math.hypot(this._xcor - tower._xcor, this._ycor - tower._ycor);
    	return dist <= (_range * this.getAttackRange() );
        }


    public int compareTo(Object o){return 0;}

    void draw(){
	rect(_xcor, _ycor , 10, 10);
    }
}