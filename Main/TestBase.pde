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
  String[] _towerChoices = {"Canon", "Sniper", "Tesla", "Wall", "Gold", "Elixir"};
  LList<Tower> _enemyTowers;
  int numTowers;
  Button win;
  Button lose;
  boolean cont;
  int tier; //1, 2, 3
  int state;  // 0 = placing, 1 = attacking
  
  PImage maze;

  
  public TestBase(Homebase player, int t) {
    _monsterList = player._attackMonsters;
    maxGold = (int) (Math.random() * 1000);
    
  //  _enemyTowers_monsterList.add(new Canon(3,3));
    bImg = loadImage("grass.jpg");
    //bImg = loadImage("maze3.jpg");
    image(bImg,0,0, 1280, 720);
    _buttons = new ArrayList<Button>();
   
    _enemyTowers = new LList<Tower>();
    //_enemyTowers.add(new Canon(250,300));
    //_enemyTowers.add(new Canon(150,250));
    //_enemyTowers.add(new Canon(600, 250));
    tier =t;
    loadTowers(player.exp, tier);
    
    //_enemyTowers.add (new TownHall(500, 270));
    win  = new Button(new int[] {300, 200}, new int[] {400,250}, "win", "return", 0);
    lose  = new Button(new int[] {300, 200}, new int[] {400,250}, "lose", "return", 0);

    state = 0;
    cont = true;
    

  }
  
  
  void mousePressed() {
    if ( state == 0 ) { // only place monsters in state 0
      if ( ! placeMonsters() ) return; // if monsters unsuccesfully placed, remain at state one
      state = 1;
    }
  }
  
  /*
  AI BASE
  TIER I STRUCTURE
  adds number of towers to enemyTowers depending on use level/exp
  in scattered positions
  */
  void loadTowers(int level, int tier) {
    this.tier = tier;
    //println(level);
    //int numTowers;
    if (level<= 50)
    {
    numTowers = 3 + (int) (Math.random() * 3);
    }
    else if (level <=100) {
    numTowers = 3 + (int) (Math.random() * 5);
    }
    else if (level <=200) {
    numTowers = 3 + (int) (Math.random() * 7);
    }
    
    else if (level<= 400) {
    numTowers = 3 + (int) (Math.random() * 9);
    }
    
    else{
    numTowers = 3 + (int) (Math.random() * 12);
    }
    //println(numTowers);
    
    if (tier == 1) {
      for (int i = 0; i < numTowers; i ++){
      int rand = (int) (Math.random() * 4);
      if (_towerChoices[rand].equals("Canon"))
        _enemyTowers.add(new Canon( (int) (Math.random() * 1200),  (int) (Math.random() * 500)) );
        
      if (_towerChoices[rand].equals("Tesla"))
        _enemyTowers.add(new Tesla( (int) (Math.random() * 1200), (int) (Math.random() * 500)));
      
      if (_towerChoices[rand].equals("Sniper"))
        _enemyTowers.add(new Sniper( (int) (Math.random() * 1200), (int) (Math.random() * 500)));
      
   // if (_towerChoices[i].equals("Wall"))
     //  _enemyTowers.add(new Wall( (int) (Math.random() * 1200), (int) (Math.random() * 700)));
    }
    }

   /*
     AI BASE
  TIER II STRUCTURE
  adds number of towers to enemyTowers depending on use level/exp
  in circular structure to surround resources
   
   */
  if (tier == 2) {
    int centerX = 500;
    double t = Math.random()*Math.PI*2;
    int tx;
    int ty;
    for (int i = 0; i < numTowers; i ++){
    
      tx = (int)(120*Math.cos(t) + 500);
      ty = (int)(120*Math.sin(t) + 200);
      int rand = (int) (Math.random() * 4);
        if (_towerChoices[rand].equals("Canon"))
          _enemyTowers.add(new Canon( tx, ty)) ;
          
        if (_towerChoices[rand].equals("Tesla"))
          _enemyTowers.add(new Tesla( tx, ty));
        
        if (_towerChoices[rand].equals("Sniper"))
          _enemyTowers.add(new Sniper( tx, ty));
        
      t+= (120);
      }
      
     tx = (int)(10*Math.cos(t) + 500);
     ty = (int)(10*Math.sin(t) + 200);
     _enemyTowers.add(new GoldMine(tx, ty));
     tx+=50;
     ty+=50;
     _enemyTowers.add(new ElixirCollector(tx,ty));
  }  


   /*
     AI BASE
  TIER III STRUCTURE
  adds number of towers to enemyTowers depending on use level/exp
  in circular structure to surround resources
  implements usage of walls 
   */
   
  if (tier == 3) {

  for (int i = 100; i < 900; i += 100) {
    for (int j = 100; j < 500; j +=100) {
      if (i == 100 || i == 800 || j == 100 || j == 400)
          _enemyTowers.add( new Wall(i, j) );
      else 
      {  
         int rand = (int) (Math.random() * 6);
        if (_towerChoices[rand].equals("Canon"))
          _enemyTowers.add(new Canon( i, j)) ;
          
        if (_towerChoices[rand].equals("Tesla"))
          _enemyTowers.add(new Tesla( i, j));
        
        if (_towerChoices[rand].equals("Sniper"))
          _enemyTowers.add(new Sniper( i, j));
        if (_towerChoices[rand].equals("Gold"))
          _enemyTowers.add(new GoldMine( i, j));
        if (_towerChoices[rand].equals("Elixir"))
          _enemyTowers.add(new ElixirCollector( i, j));
        
      }
    }
  }
    
  }


   /*
     AI BASE
  TIER VI STRUCTURE
  adds number of towers to enemyTowers depending on use level/exp
  in circular structure to surround resources
   implements DOUBLE wall usage to secure resources
   */
  if (tier == 4) {
    QueensTour qBoard = new QueensTour(8);
    qBoard.solve();
    int tmpX = 213;
    int tmpY = 200;
    for (int r = 0; r < 8; r ++) {
      tmpX = 213;
      
      for (int c = 0; c < 8; c ++) {
        if (qBoard.board[r][c]==1) {
          
        int rand = (int) (Math.random() * 6);
        if (_towerChoices[rand].equals("Canon"))
          _enemyTowers.add(new Canon( tmpX, tmpY)) ;
          
        if (_towerChoices[rand].equals("Tesla"))
          _enemyTowers.add(new Tesla( tmpX, tmpY));
        
        if (_towerChoices[rand].equals("Sniper"))
          _enemyTowers.add(new Sniper( tmpX, tmpY));
        if (_towerChoices[rand].equals("Gold"))
          _enemyTowers.add(new GoldMine( tmpX, tmpY));
        if (_towerChoices[rand].equals("Elixir"))
          _enemyTowers.add(new ElixirCollector( tmpX, tmpY));
          
        }
      tmpX+=87;
      println(tmpX + " " + tmpY);
      println(qBoard.board[r][c] + " BOARD");
      }
      tmpY+=43;
    }
  qBoard.printSolution();
  
  }
  
     /*
     AI BASE
  TIER V STRUCTURE
  adds number of towers to enemyTowers in a RECURSIVE fashion 
   */
  if (tier == 5) {
  
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
        text("Attack Successful! The spoils of war go to you!", 500, 500);
        win.draw();
        if (win.buttonPressed(0)){
          cont = false;
          // give user spoils for winning war
          coc.base.exp += 150;
          coc.base._gold += tier * numTowers * 30;
          coc.base._elixir += tier * numTowers * 20;
        }
      }
      
      else if ( _monsterList.size() == 0 ) {
        text("Attack failed! But you still get some resources though", 500, 500);
        lose.draw();
        if (lose.buttonPressed(0)){
          cont = false;
          // give user some resources
          coc.base._gold +=  (int) ((tier / 2.0) * (numTowers - _enemyTowers.size()) * 15);
          coc.base._elixir += (int) ((tier / 2.0) * (numTowers - _enemyTowers.size()) * 10);

        }
      }
      
      else{

        image(bImg,0,0, 1280, 720);

        for (Button b: _buttons)
          {
          b.draw();
        }
        
     int[] monRects = new int[5];
      String[] monChoices = {"Barbarian", "Archer", "Giant", "Goblin", "Wizard"};
     int tmpX = 200;
    for (Monster m: _monsterList) {
      if (m._name.equals("Barbarian")) 
        monRects[0]+=1;
      if (m._name.equals("Archer") )
        monRects[1]+=1;
      if (m._name.equals("Giant") )
        monRects[2]+=1;
      if (m._name.equals("Goblin") )
        monRects[3]+=1;
      if (m._name.equals("Wizard") )
        monRects[4]+=1;    
    }
    for (int i = 0; i < monRects.length; i ++ ){
      //int numMon = ;
      if (monRects[i] > 0){
    _buttons.add(new Button(new int[] {tmpX, 600}, new int[] {tmpX + 100, 700}, monChoices[i] , monChoices[i] +  " : " + monRects[i], 0));
    //tmpX+=150;
    }
    else
       _buttons.add(new Button(new int[] {tmpX, 600}, new int[] {tmpX + 100, 700}, monChoices[i] , monChoices[i] +  " : " + 0, 0));
    tmpX+=150;
    }
          
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
            mon.drawAttack(true, _enemyTowers);
          else {
            it.remove();
          //  _monsterList.remove(mon);
        }
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

      
  