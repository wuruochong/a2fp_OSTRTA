public class Monster extends Unit implements Comparable{
    int  _hp;
    int _mp;
    int _xcor;
    int _ycor;

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

    // reduces HP by n, returns true if monster is now dead
    public boolean takeDamage(int n) {
	_hp -= n;
	return ! isAlive();
    }

    // deals damage to tower
    public boolean attack(Tower tower) {
  return enemy.takeDamage( _dmgPerAttack);
    }

  public  int levelup(){
      _level++;
      return _level;

    }

  public int getAttackRange() {
    return _attackRange;
  }

  // determines exactly how to shoot towers
    public void shoot() {
    	while ( ! _towersToShoot.peekTop().isAlive() )
    	    _towersToShoot.removeTop();

    	Tower tower = _monstersToShoot.peekTop();
    	attack(tower);
    	    }



        // queues Towers into things to attack
        public void queueTowers(List<Tower> towerList) {
    	for ( Tower tower : towerList ) {
    	    if ( inRadius(tower) && ! towerList.contains(tower) )
    		    _towersToShoot.add(tower);
    	}
        }

        // returns true if tower is in attack radius of the monster
        public boolean inRadius(Tower tower) {
    	float dist = Math.hypot(this._xcor - tower._xcor, this._ycor - tower._ycor);
    	return dist <= (_range * this.getAttackRange() );
        }


    public int compareTo(Object o){return 0;}

    //void draw(){
	//rect(_xcor*100, _ycor*100 , 10, 10);
  //  }
}
