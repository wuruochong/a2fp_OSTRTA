/*
TestBase class is a test level of an enemy base. Accessed by clicking the attack button from HomeBase.
TestBase constructer takes an ArrayList of Queued monsters (by the player at homebase, to be implemented) and also player gold
for purchasing items during attack.
Attack succeeds if ArrayList of enmey owned buildings reaches 0
Fails if player runs out of monsters (to be implemented)
*/
import java.util.ArrayList;
public class TestBase{
  int maxGold;
  PImage bImg;
  ArrayList<Button> _buttons;
  LList<Monster> _monstersOwned;
  //ArrayList<Monster> _monsterChoices;
  LList<Tower> _enemyTowers;
  Button win;
  boolean cont;
  
  int state;  // 0 = attacking, 1 = shopping
  
  public TestBase(Homebase player){
    _monstersOwned = player.getMonsters();;
    maxGold = (int) (Math.random() * 1000);
    
  //  _enemyTowers.add(new Canon(3,3));
    bImg = loadImage("grass.jpg");
    image(bImg,0,0, 1280, 720);
    _buttons = new ArrayList<Button>();
   
    _enemyTowers = new LList<Tower>();
    _enemyTowers.add(new Canon(250,300));
    _enemyTowers.add(new Canon(150,250));
    _enemyTowers.add(new Canon(600, 250));
    
    //_enemyTowers.add (new TownHall(500, 270));
    win  = new Button(new int[] {300, 200}, new int[] {400,250}, "win", "return", 0);
    cont = true;
  }
  
  void draw(){
      println(_enemyTowers.size());
      if (_enemyTowers.size()==0){ // fix later
        text("Attack Successful!", 500, 500);
        win.draw();
        if (win.buttonPressed(0)){
          cont = false;
        }
      
      }
      
      else{
       
        image(bImg,0,0, 1280, 720);
        // draw enemy towers, delete if dead
        Iterator<Tower> iter = _enemyTowers.iterator();
        while ( iter.hasNext() ) {
          Tower enemyT = (Tower)(iter.next());
          if ( enemyT.isAlive() ) {
            if ( enemyT instanceof Defense )
              ((Defense) enemyT).draw(_monstersOwned);
             else
               enemyT.draw();
          }
          else // if enemyT is dead, just remove it from list
            iter.remove();
        }
            
        /*
        for (Tower enemy : _enemyTowers){
          if ( enemy instanceof Defense ) {
            if (enemy.isAlive())   
              ((Defense)enemy).draw(_monstersOwned);
          }
        }
        */
        // draw monsters, delte if dead
        Iterator<Monster> it = _monstersOwned.iterator();
        while ( it.hasNext() ) {
          Monster mon = (Monster) (it.next());
          if ( mon.isAlive() )
            mon.draw(true, _enemyTowers);
          else
            it.remove();
        }
        /*
        for ( Monster m : _monstersOwned ) {
          if (m.isAlive())
            m.draw(true, _enemyTowers);
        } */
        /*
        int tmpX = 0; //for panels
    for (Monster m : base._monstersOwned){
      m.setCoor(tmpX, 600);
      m.draw(); // replace with m.drawSprite() and make this into a button
      tmpX+=50;
    } */
      }
  }
    }

      
  