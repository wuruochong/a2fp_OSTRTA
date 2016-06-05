/*
TestBase class is a test level of an enemy base. Accessed by clicking the attack button from HomeBase.
TestBase constructer takes an ArrayList of Queued monsters (by the player at homebase, to be implemented) and also player gold
for purchasing items during attack.
Attack succeeds if ArrayList of enmey owned buildings reaches 0
Fails if player runs out of monsters (to be implemented)
*/
import java.util.ArrayList;
public class TestBase{
  String name;
  int gold;
  PImage bImg;
  ArrayList<Button> _buttons;
  ArrayList<Monster> _monstersOwned;
  ArrayList<Monster> _monsterChoices;
  ArrayList<Tower> _enemyTowers;
  Button win;
  boolean cont;
  
  int state;  // 0 = attacking, 1 = shopping
  
  public TestBase(ArrayList<Monster> pMonsters, int pGold){
    _monsterChoices = pMonsters;
    gold = pGold;
  //  _enemyTowers.add(new Canon(3,3));
    bImg = loadImage("grass.jpg");
    image(bImg,0,0, 1280, 720);
    _buttons = new ArrayList<Button>();
 
    _monstersOwned = new ArrayList<Monster>();
      
    _enemyTowers = new ArrayList<Tower>();
    _enemyTowers.add(new Canon(250,300));
    _enemyTowers.add (new TownHall(500, 270));
    win  = new Button(new int[] {300, 200}, new int[] {400,250},"win", "return");
    cont = true;
  }
  void draw(){
    if (state == 0){
      
      if (_enemyTowers.size()==0){
        text("Attack Successful!", 500, 500);
        win.draw();
        if (win.buttonPressed()){
          cont = false;
        }
      
      }
      else{
        image(bImg,0,0, 1280, 720);
        for (Tower enemy : _enemyTowers){
          enemy.draw();
        }
        int tmpX = 0; //for panels
    for (Monster m : base._monstersOwned){
      m.setCoor(tmpX, 600);
      m.draw(); // replace with m.drawSprite() and make this into a button
      tmpX+=50;
    }
      }

    }
  }

      
}
  