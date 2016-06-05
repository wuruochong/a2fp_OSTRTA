
import java.util.ArrayList;
public class TestBase{
  String name;
  int gold;
  PImage bImg;
  ArrayList<Button> _buttons;
  ArrayList<Monster> _monstersOwned;
  ArrayList<Monster> _monsterChoices;
  ArrayList<Tower> _enemyTowers;
  
  int state;  // 0 = attacking, 1 = shopping
  
  public TestBase(ArrayList<Monster> pMonsters, int pGold){
    _monsterChoices = pMonsters;
    gold = pGold;
  //  _enemyTowers.add(new Canon(3,3));
    bImg = loadImage("grass.jpg");
    image(bImg,0,0);
    _buttons = new ArrayList<Button>();
    _monstersOwned = new ArrayList<Monster>();
    _enemyTowers = new ArrayList<Tower>();
    _enemyTowers.add(new Canon(3,3));
  }
  void draw(){
    if (state == 0){
      if (_enemyTowers.size()==0){
        text("Attack Successful!", 500, 500);
      }
      else{
        image(bImg,0,0);
        for (Tower enemy : _enemyTowers){
          enemy.draw();
        }
      }
    }
  }

      
}
  