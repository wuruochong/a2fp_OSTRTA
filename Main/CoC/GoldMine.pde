import java.util.ArrayList;
// represents a defense tower
public class GoldMine extends Tower{
  int _goldCollected = 1;
  int _maxGold;
  long startTime;
  long endTime;
  
    // constructor
    public GoldMine(int x, int y) {
  _hp = 400;
  _xcor = x;
  _ycor = y;
  _upgradeState = 0;
  _mp = 150; //subject to change
  _maxGold = 500;
  startTime = System.nanoTime();
  }

    void draw() {

    }

  int collectGold(){
    if (mousePressed && _goldCollected >= 1) {
      endTime = System.nanoTime() - startTime;
      _goldCollected = (int) (endTime / 1000000000.0 * .5);
      startTime = System.nanoTime();
      return _goldCollected;
      
    }
    return 0;
  }

    public void upgrade() {
  _maxGold+=500;
  _hp += 40;
  }
    
    //dump into gold storage when user clicks on mine
    void dump(){
    }


}
