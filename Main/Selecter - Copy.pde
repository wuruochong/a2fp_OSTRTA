public class Selecter{

  LList<Monster> HBMonsters;
  LList<Monster> SMonsters;
  Button BarbarianButton;
  Button BarbarianButtonS;
  Button GiantButton;
  Button GiantButtonS;
  Button GoblinButton;
  Button GoblinButtonS;
  Button ArcherButton;
  Button ArcherButtonS;
  Button WizardButton;
  Button WizardButtonS;
  Button Back;
  boolean back;
  int BarbarianA = 0;
  int BarbarianS = 0;
  int GiantA = 0;
  int GiantS = 0;
  int GoblinA = 0;
  int GoblinS = 0;
  int ArcherA = 0;
  int ArcherS = 0;
  int WizardA = 0;
  int WizardS = 0;
  Button attackButtonS;
  boolean cont;
  PImage bImg;


  public Selecter(Homebase player){
    HBMonsters = player.getMonsters();
    println(HBMonsters);
    SMonsters = new LList<Monster>();
    Counter();
    BarbarianButton = new Button(new int[] {50,50}, new int[] {200, 150}, "Barbarian", "Avalible Barbarians: " + BarbarianA, 0);
    BarbarianButtonS = new Button(new int[] {200,50}, new int[] {350, 150}, "BarbarianS", "Selected Barbairans" + BarbarianS, 0);
    GiantButton = new Button(new int[] {50, 200}, new int[] {200,300}, "Giant", "Avalible Giants: " + GiantA, 0);
    GiantButtonS = new Button(new int[] {200, 200},new int[] {350, 300}, "GiantS", "Selected Giants: " + GiantS, 0);
    GoblinButton = new Button(new int[] {50, 350 }, new int[] {200, 450}, "Goblin", "Avalible Goblins: " + GoblinA, 0);
    GoblinButtonS = new Button(new int[] {200, 350},new int[] {350, 450}, "GoblinS", "Selected Goblins: " + GoblinS, 0);
    ArcherButton = new Button(new int[] {400, 50 }, new int[] {550, 150}, "Archer", "Avalible Archers: " + ArcherA, 0);
    ArcherButtonS = new Button(new int[] {550, 50},new int[] {700, 150}, "ArcherS", "Selected Archers: " + ArcherS, 0);
    WizardButton = new Button(new int[] {400, 200 }, new int[] {550, 300}, "Wizard", "Avalible Wizards: " + WizardA, 0);
    WizardButtonS = new Button(new int[] {550, 200},new int[] {700, 300}, "WizardS", "Selected Wizards: " + WizardS, 0);
    bImg = loadImage("grass.jpg");
    image(bImg,0,0, 1280, 720);
    attackButtonS =new Button(new int[] {0, 600}, "attack", 0, "attack.jpg");
    cont = true;
    back = false;
    Back = new Button(new int[] {1100,0}, new int[] {1200,100}, "Back", "Cancel attack", 0);
  }
  
  void buttonUpdater(){
    Counter();
    BarbarianButton = new Button(new int[] {50,50}, new int[] {200, 150}, "Barbarian", "Avalible Barbarians: " + BarbarianA, 0);
    BarbarianButtonS = new Button(new int[] {200,50}, new int[] {350, 150}, "BarbarianS", "Selected Barbairans" + BarbarianS, 0);
    GiantButton = new Button(new int[] {50, 200}, new int[] {200,300}, "Giant", "Avalible Giants: " + GiantA, 0);
    GiantButtonS = new Button(new int[] {200, 200},new int[] {350, 300}, "GiantS", "Selected Giants: " + GiantS, 0);
    GoblinButton = new Button(new int[] {50, 350 }, new int[] {200, 450}, "Goblin", "Avalible Goblins: " + GoblinA, 0);
    GoblinButtonS = new Button(new int[] {200, 350},new int[] {350, 450}, "GoblinS", "Selected Goblins: " + GoblinS, 0);
    ArcherButton = new Button(new int[] {400, 50 }, new int[] {550, 150}, "Archer", "Avalible Archers: " + ArcherA, 0);
    ArcherButtonS = new Button(new int[] {550, 50},new int[] {700, 150}, "ArcherS", "Selected Archers: " + ArcherS, 0);
    WizardButton = new Button(new int[] {400, 200 }, new int[] {550, 300}, "Wizard", "Avalible Wizards: " + WizardA, 0);
    WizardButtonS = new Button(new int[] {550, 200},new int[] {700, 300}, "WizardS", "Selected Wizards: " + WizardS, 0);
  }
  
  
  public void Counter(){
    BarbarianA = 0;
    BarbarianS = 0;
    GiantA = 0;
    GiantS = 0;
    GoblinA = 0;
    GoblinS = 0;
    ArcherA = 0;
    ArcherS = 0;
    WizardA = 0;
    WizardS = 0;
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
      else if (m instanceof Archer){
        ArcherA ++;
      }
      else if (m instanceof Wizard){
        WizardA ++;
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
      else if (m instanceof Archer){
        ArcherS ++;
      }
      else if (m instanceof Wizard){
        WizardS ++;
      }
    }
  }
  
  void mousePressed(){
    if (BarbarianButton.buttonPressed(0)){
      for (Monster m : HBMonsters){
        if (m instanceof Barbarian){
          HBMonsters.remove(m);
          SMonsters.add(new Barbarian(100,100));
          buttonUpdater();
          break;
        }
      }
    }
    if (BarbarianButtonS.buttonPressed(0)){
      for (Monster m : SMonsters){
        if (m instanceof Barbarian){
          SMonsters.remove(m);
          HBMonsters.add(new Barbarian(100,100));
          buttonUpdater();
          break;
        }
      }
    }
    if (GiantButton.buttonPressed(0)){
      for (Monster m : HBMonsters){
        if (m instanceof Giant){
          HBMonsters.remove(m);
          SMonsters.add(new Giant(100,100));
          buttonUpdater();
          break;
        }
      }
    }
    if (GiantButtonS.buttonPressed(0)){
      for (Monster m : SMonsters){
        if (m instanceof Giant){
          SMonsters.remove(m);
          HBMonsters.add(new Giant(100,100));
          buttonUpdater();
          break;
        }
      }
    }
    if (GoblinButton.buttonPressed(0)){
      for (Monster m : HBMonsters){
        if (m instanceof Goblin){
          HBMonsters.remove(m);
          SMonsters.add(new Goblin(100,100));
          buttonUpdater();
          break;
        }
      }
    }
    if (GoblinButtonS.buttonPressed(0)){
      for (Monster m : SMonsters){
        if (m instanceof Goblin){
          SMonsters.remove(m);
          HBMonsters.add(new Goblin(100,100));
          buttonUpdater();
          break;
        }
      }
    }
    if (ArcherButton.buttonPressed(0)){
      for (Monster m : HBMonsters){
        if (m instanceof Archer){
          HBMonsters.remove(m);
          SMonsters.add(new Archer(100,100));
          buttonUpdater();
          break;
        }
      }
    }
    if (ArcherButtonS.buttonPressed(0)){
      for (Monster m : SMonsters){
        if (m instanceof Archer){
          SMonsters.remove(m);
          HBMonsters.add(new Archer(100,100));
          buttonUpdater();
          break;
        }
      }
    }
    if (WizardButton.buttonPressed(0)){
      for (Monster m : HBMonsters){
        if (m instanceof Wizard){
          HBMonsters.remove(m);
          SMonsters.add(new Wizard(100,100));
          buttonUpdater();
          break;
        }
      }
    }
    if (WizardButtonS.buttonPressed(0)){
      for (Monster m : SMonsters){
        if (m instanceof Wizard){
          SMonsters.remove(m);
          HBMonsters.add(new Wizard(100,100));
          buttonUpdater();
          break;
        }
      }
    }
    if (attackButtonS.buttonPressed(0)){
      if (!(SMonsters.size()==0)){
        cont = false;
      }
    }
    if (Back.buttonPressed(0)){
      back = true;
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
    ArcherButton.draw();
    ArcherButtonS.draw();
    WizardButton.draw();
    WizardButtonS.draw();
    coc.attackButton.draw();
    Back.draw();
    if (SMonsters.size()==0){
      coc.attackButton.img = loadImage("attack2.png");
    }
    else{
      coc.attackButton.img = loadImage("attack.jpg");
    }
  }
}
  