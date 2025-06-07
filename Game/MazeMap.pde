class MazeMap extends Map{
  private ArrayList<PShape> portals;
  private PVector portalLeft;
  private PVector portalRight;
  
  public MazeMap(){
    super();
    this.portals = new ArrayList<PShape>();
    this.portalLeft = new PVector();
    this.portalRight = new PVector();
    createMap();
  }
  
  public void display(){
    super.display();
    for(PShape portal : portals){
      portal.setStroke(color(255));
      portal.setStrokeWeight(3);
      shape(portal);
    }
  }
  
  public void createMap(){
    super.obstacles.add(new Wall(30, 30, 280, 20));
    super.obstacles.add(new Wall(30, 50, 20, 150));
    
    super.obstacles.add(new Wall(10, 240, 160, 20));
    super.obstacles.add(new Wall(170, 240, 20, 80));
    super.obstacles.add(new Wall(190, 300, 60, 20));
    super.obstacles.add(new Wall(250, 240, 20, 80));
    super.obstacles.add(new Wall(100, 120, 20, 120));
    super.obstacles.add(new Wall(120, 120, 70, 20));
    
    super.obstacles.add(new Wall(200, 180, 150, 20));
    super.obstacles.add(new Wall(250, 110, 20, 70));
    super.obstacles.add(new Wall(350, 180, 20, 150));
    super.obstacles.add(new Wall(370, 230, 80, 20));
    super.obstacles.add(new Wall(450, 90, 20, 160));
    
    super.obstacles.add(new Wall(380, 30, 90, 20));
    super.obstacles.add(new Wall(380, 50, 20, 70));
    
    super.obstacles.add(new Wall(550, 30, 170, 20));
    super.obstacles.add(new Wall(550, 50, 20, 70));
    super.obstacles.add(new Wall(720, 30, 20, 90));
    super.obstacles.add(new Wall(740, 100, 50, 20));
    
    super.obstacles.add(new Wall(550, 180, 170, 20));
    super.obstacles.add(new Wall(620, 110, 20, 70));
    
    super.obstacles.add(new Wall(450, 280, 170, 20));
    super.obstacles.add(new Wall(510, 210, 20, 70));
    
    super.obstacles.add(new Wall(680, 240, 70, 20));
    super.obstacles.add(new Wall(750, 240, 20, 240));
    super.obstacles.add(new Wall(680, 390, 70, 20));
    
    super.obstacles.add(new Wall(30, 320, 20, 150));
    super.obstacles.add(new Wall(50, 450, 350, 20));
    super.obstacles.add(new Wall(350, 390, 20, 60));
    super.obstacles.add(new Wall(370, 390, 220, 20));
    super.obstacles.add(new Wall(100, 390, 120, 20));
    
    super.obstacles.add(new Wall(600, 450, 60, 20));
    
    PShape bigPortal = createShape(ELLIPSE, 50, 290, 30, 60);
    bigPortal.setFill(color(81, 110, 99));
    portals.add(bigPortal);
    
    PShape mediumPortal = createShape(ELLIPSE, 45, 290, 20, 40);
    mediumPortal.setFill(color(114, 161, 144));
    portals.add(mediumPortal);
    
    PShape smallPortal = createShape(ELLIPSE, 40, 290, 10, 20);
    smallPortal.setFill(color(81, 110, 99));
    portals.add(smallPortal);
    
    portalLeft.x = 40;
    portalLeft.y = 290;
    
    bigPortal = createShape(ELLIPSE, 735, 210, 30, 60);
    bigPortal.setFill(color(81, 110, 99));
    portals.add(bigPortal);
    
    mediumPortal = createShape(ELLIPSE, 740, 210, 20, 40);
    mediumPortal.setFill(color(114, 161, 144));
    portals.add(mediumPortal);
    
    smallPortal = createShape(ELLIPSE, 745, 210, 10, 20);
    smallPortal.setFill(color(81, 110, 99));
    portals.add(smallPortal);
    
    portalRight.x = 745;
    portalRight.y = 210;
  }
  
  public void checkCollision(Player player){
   super.checkCollision(player);
   PVector teleportRight = new PVector(portalRight.x - 10, portalRight.y);
   PVector teleportLeft = new PVector(portalLeft.x + 10, portalLeft.y);
    
    //portals
    if(portalLeft.x - 5 <= player.getpos().x && player.getpos().x <= portalLeft.x + 5 && portalLeft.y - 10 <= player.getpos().y && player.getpos().y <= portalLeft.y + 10){
      player.setpos(teleportRight);
    }
    else if(player.getpos().x >= portalRight.x && portalRight.y - 5 <= player.getpos().y && player.getpos().y <= portalRight.y + 5){
      player.setpos(teleportLeft);
    }
  }
  
  public void checkCollision(Boomerang boomerang){
    super.checkCollision(boomerang);
  }
}
