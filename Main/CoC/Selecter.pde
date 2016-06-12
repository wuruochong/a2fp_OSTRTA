public class Selecter{

  LList<Monster> HBMonsters;
  LList<Monster> SMonsters;
  Button BarbarianButton;
  Button BarbarianButtonS;
  Button GiantButton;
  Button GiantButtonS;
  Button GoblinButton;
  Button GoblinButtonS;
  int BarbarianA = 0;
  int BarbarianS = 0;
  int GiantA = 0;
  int GiantS = 0;
  int GoblinA = 0;
  int GoblinS = 0;
  Button attackButtonS;
  boolean cont;
  PImage bImg;


  public Selecter(Homebase player){
    HBMonsters = player.getMonsters();
    println(HBMonsters);
    SMonsters = new LList<Monster>();
    Counter();
    BarbarianButton = new Button(new int[] {50,50}, new int[] {150, 150}, "Barbarian", "Avalible Barbarians: " + BarbarianA, 0);
    BarbarianButtonS = new Button(new int[] {200,50}, new int[] {300, 150}, "BarbarianS", "Selected Barbairans" + BarbarianS, 0);
    GiantButton = new Button(new int[] {50, 200}, new int[] {150,300}, "Giant", "Avalible Giants: " + GiantA, 0);
    GiantButtonS = new Button(new int[] {200, 200},new int[] {300, 300}, "GiantS", "Selected Giants: " + GiantS, 0);
    GoblinButton = new Button(new int[] {50, 350 }, new int[] {150, 450}, "Goblin", "Avalible Goblins: " + GoblinA, 0);
    GoblinButtonS = new Button(new int[] {200, 350},new int[] {300, 450}, "GoblinS", "Selected Goblins: " + GoblinS, 0);
    bImg = loadImage("grass.jpg");
    image(bImg,0,0, 1280, 720);
    attackButtonS =new Button(new int[] {0, 600}, "attack", 0, "attack.jpg");
    cont = true;
  }
  
  void buttonUpdater(){
    Counter();
    BarbarianButton = new Button(new int[] {50,50}, new int[] {150, 150}, "Barbarian", "Avalible Barbarians: " + BarbarianA, 0);
    BarbarianButtonS = new Button(new int[] {200,50}, new int[] {300, 150}, "BarbarianS", "Selected Barbairans" + BarbarianS, 0);
    GiantButton = new Button(new int[] {50, 200}, new int[] {150,300}, "Giant", "Avalible Giants: " + GiantA, 0);
    GiantButtonS = new Button(new int[] {200, 200},new int[] {300, 300}, "GiantS", "Selected Giants: " + GiantS, 0);
    GoblinButton = new Button(new int[] {50, 350 }, new int[] {150, 450}, "Goblin", "Avalible Goblins: " + GoblinA, 0);
    GoblinButtonS = new Button(new int[] {200, 350},new int[] {300, 450}, "GoblinS", "Selected Goblins: " + GoblinS, 0);
  }
  
  
  public void Counter(){
    BarbarianA = 0;
    BarbarianS = 0;
    GiantA = 0;
    GiantS = 0;
    GoblinA = 0;
    GoblinS = 0;
    for (Monster m : HBMonsters){
      if (m instanceof Barbarian){
        BarbarianA ++;
      }
      else if (m instanceof Giant){
        GiantA ++;
      }
      else if (m instanceof Goblin){
        GoblinA ++;
      }
    }
    for (Monster m : SMonsters){
     if (m instanceof Barbarian){
        BarbarianS ++;
      }
      else if (m instanceof Giant){
        GiantS ++;
      }
      else if (m instanceof Goblin){
        GoblinS ++;
      }
    }
  }
  
  void mousePressed(){
    if (BarbarianButton.buttonPressed(0)){
      for (Monster m : HBMonsters){
        if (m instanceof Barbarian){
          HBMonsters.remove(m);
          SMonsters.add(new Barbarian());
          buttonUpdater();
          break;
        }
      }
    }
    if (BarbarianButtonS.buttonPressed(0)){
      for (Monster m : SMonsters){
        if (m instanceof Barbarian){
          SMonsters.remove(m);
          HBMonsters.add(new Barbarian());
          buttonUpdater();
          break;
        }
      }
    }
    if (GiantButton.buttonPressed(0)){
      for (Monster m : HBMonsters){
        if (m instanceof Giant){
          HBMonsters.remove(m);
          SMonsters.add(new Giant());
          buttonUpdater();
          break;
        }
      }
    }
    if (GiantButtonS.buttonPressed(0)){
      for (Monster m : SMonsters){
        if (m instanceof Giant){
          SMonsters.remove(m);
          HBMonsters.add(new Giant());
          buttonUpdater();
          break;
        }
      }
    }
    if (GoblinButton.buttonPressed(0)){
      for (Monster m : HBMonsters){
        if (m instanceof Goblin){
          HBMonsters.remove(m);
          SMonsters.add(new Barbarian());
          buttonUpdater();
          break;
        }
      }
    }
    if (GoblinButtonS.buttonPressed(0)){
      for (Monster m : SMonsters){
        if (m instanceof Goblin){
          SMonsters.remove(m);
          HBMonsters.add(new Goblin());
          buttonUpdater();
          break;
        }
      }
    }
    if (attackButtonS.buttonPressed(0)){
      cont = false;
    }
  }
  
  void baseUpdater(Homebase player){
    (player._house)._monstersOwned = HBMonsters;
    player._attackMonsters = SMonsters;
  }
  void draw(){
    image(bImg,0,0, 1280, 720);
    BarbarianButton.draw();
    BarbarianButtonS.draw();
    GiantButton.draw();
    GiantButtonS.draw();
    GoblinButton.draw();
    GoblinButtonS.draw();
    attackButton.draw();
  }
}
  