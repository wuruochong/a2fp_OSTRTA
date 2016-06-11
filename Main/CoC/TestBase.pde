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
  LList<Monster> _monsterList;
  String[] _towerChoices = {"Canon", "Sniper", "Tesla", "Wall"};
  LList<Tower> _enemyTowers;
  Button win;
  Button lose;
  boolean cont;
  int tier; //1, 2, 3
  int state;  // 0 = placing, 1 = attacking
  
  public TestBase(Homebase player) {
    _monsterList = player.getMonsters();
    maxGold = (int) (Math.random() * 1000);
    
  //  _enemyTowers_monsterList.add(new Canon(3,3));
    bImg = loadImage("grass.jpg");
    image(bImg,0,0, 1280, 720);
    _buttons = new ArrayList<Button>();
   
    _enemyTowers = new LList<Tower>();
    //_enemyTowers.add(new Canon(250,300));
    //_enemyTowers.add(new Canon(150,250));
    //_enemyTowers.add(new Canon(600, 250));
    
    loadTowers(player.exp);
    
    //_enemyTowers.add (new TownHall(500, 270));
    win  = new Button(new int[] {300, 200}, new int[] {400,250}, "win", "return", 0);
    lose  = new Button(new int[] {300, 200}, new int[] {400,250}, "lose", "return", 0);

    state = 0;
    cont = true;
    
     int tmpX = 200;
    for (Monster m: _monsterList) {
    _buttons.add(new Button(new int[] {tmpX, 600}, new int[] {tmpX + 100, 700}, m._name, m.getName() + "", 0));
    tmpX+=150;
    }
  }
  
  void mousePressed() {
    if ( state == 0 ) { // only place monsters in state 0
      if ( ! placeMonsters() ) return; // if monsters unsuccesfully placed, remain at state one
      state = 1;
    }
  }
  
  /*
  adds tower to enemyTowers depending on use level/exp
  */
  void loadTowers(int level){
    if (level<= 50)
    {
    int numTowers = 3 + (int) (Math.random() * 5);
    for (int i = 0; i < numTowers; i ++){
      int rand = (int) (Math.random() * 4);
      if (_towerChoices[rand].equals("Canon"))
        _enemyTowers.add(new Canon( (int) (Math.random() * 1200), -100 + (int) (Math.random() * 700)) );
        
      if (_towerChoices[rand].equals("Tesla"))
        _enemyTowers.add(new Tesla( (int) (Math.random() * 1200), -100 +(int) (Math.random() * 700)));
      
      if (_towerChoices[rand].equals("Sniper"))
        _enemyTowers.add(new Sniper( (int) (Math.random() * 1200), -100 +(int) (Math.random() * 700)));
    }
     
      //if (_towerChoices[i].equals("Wall")
       // _enemyTowers.add(new Wall( (int) (Math.random() * 1200), (int) (Math.random() * 700)));
    }
    else if (level <=100) {
    
    }
    else if (level <=200) {
    
    }
    
    else if (level<= 400) {
    
    }
    
    else if (level >= 600){
    
    }
    
  
  }
  
  public boolean placeMonsters() {
    int rad = 100;
    // if player places monsters to close to a tower, do nothing
    for ( Tower t : _enemyTowers ) {
      if ( inMouseRadius(t, rad) )
        return false;
    }
    // position monstes within a radius of click point
    for ( Monster m : _monsterList ) {
      int[] coor = genRandomPointWithinClickRadius(rad);
      m._xcor = coor[0];
      m._ycor = coor[1];
      println(m._xcor + ":" + m._ycor);
    }
    return true;
  }
  
  public boolean inMouseRadius(Unit item, int radius) {
    return radius >= Math.hypot(item._xcor - mouseX, item._ycor - mouseY);
  }
  
  public int[] genRandomPointWithinClickRadius(int radius) {
    double randDist = Math.random() * radius;
    double randAngle = Math.random() * 2 * Math.PI; // measured in radians
    
    int[] retCoor = new int[2];
    retCoor[0] = (int) (randDist * Math.cos(randAngle)) + mouseX;
    retCoor[1] = (int) (randDist * Math.sin(randAngle)) + mouseY;
    return retCoor;
  }
    
  void draw(){
      
      if (_enemyTowers.size()==0){ // fix later
        text("Attack Successful!", 500, 500);
        win.draw();
        base.exp+=50;
        if (win.buttonPressed(0)){
          cont = false;
        }
      }
      else if ( _monsterList.size() == 0 ) {
        text("Attack failed!", 500, 500);
        lose.draw();
        if (lose.buttonPressed(0)){
          cont = false;
        }
      }
      
      else{
       
        image(bImg,0,0, 1280, 720);
        
        for (Button b: _buttons)
          {b.draw();}
          
        // draw enemy towers, delete if dead
        Iterator<Tower> iter = _enemyTowers.iterator();
        while ( iter.hasNext() ) {
          Tower enemyT = (Tower)(iter.next());
          if ( enemyT.isAlive() ) {
            if ( enemyT instanceof Defense )
              ((Defense) enemyT).draw(_monsterList);
             else
               enemyT.draw();
          }
          else // if enemyT is dead, just remove it from list
            iter.remove();
        }
  
      if ( state == 1 ) { // only draw monsters if already placed
        // draw monsters, delete if dead
        Iterator<Monster> it = _monsterList.iterator();
        while ( it.hasNext() ) {
          Monster mon = (Monster) (it.next());
          if ( mon.isAlive() )
            mon.draw(true, _enemyTowers);
          else
            it.remove();
        }
      }
       /* 
        int tmpX = 0; //for panels
    for (Monster m : base._monsterList){
      m.setCoor(tmpX, 600);
      m.draw(); // replace with m.drawSprite() and make this into a button
      tmpX+=50;
    } */
      }
  }
  
  
}

      
  
