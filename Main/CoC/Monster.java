public class Monster extends Unit implements Comparable{
    int  _hp;
    int _mp;
    int _xcor;
    int _ycor;

    int _trainingTime;
    int _moveSpeed;
    //int _attackSpeed;
    double _attackRange;
    int _dmgPerAttack;
    int _level;
    int _houseSpace;

    public Monster(){

    }

    public Monster(int xcor, int ycor){
	_xcor = xcor;
	_ycor = ycor;
	_hp = 10;
	_mp = 10;
    }

    // reduces HP by n, returns true if monster is now dead
    public boolean takeDamage(int n) {
	_hp -= n;
	return ! isAlive();
    }

    public int attack(){
	return _dmgPerAttack;
    }

  public  int levelup(){
      _level++;
      return _level;

    }

  public void subtractHP(int dmg) {
      _hp -= dmg;
    }

  public void priorityAttackList() {

    //needs implementation

  }

  public boolean isAlive(){
    return _hp >= 0;
  }

    public int compareTo(Object o){return 0;}

    //void draw(){
	//rect(_xcor*100, _ycor*100 , 10, 10);
  //  }
}
