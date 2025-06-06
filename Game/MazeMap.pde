class MazeMap extends Map{
  public MazeMap(){
    super(2);
  }
  
  public void createMap(){
    super.obstacles.add(createShape(RECT, 30, 30, 280, 20));
    super.obstacles.add(createShape(RECT, 30, 50, 20, 150));
    
    super.obstacles.add(createShape(RECT, 10, 240, 160, 20));
    super.obstacles.add(createShape(RECT, 170, 240, 20, 80));
    super.obstacles.add(createShape(RECT, 190, 300, 60, 20));
    super.obstacles.add(createShape(RECT, 250, 240, 20, 80));
    super.obstacles.add(createShape(RECT, 100, 120, 20, 120));
    super.obstacles.add(createShape(RECT, 120, 120, 70, 20));
    
    super.obstacles.add(createShape(RECT, 200, 180, 150, 20));
    super.obstacles.add(createShape(RECT, 250, 110, 20, 70));
    super.obstacles.add(createShape(RECT, 350, 180, 20, 150));
    super.obstacles.add(createShape(RECT, 370, 230, 80, 20));
    super.obstacles.add(createShape(RECT, 450, 90, 20, 160));
    
    super.obstacles.add(createShape(RECT, 380, 30, 90, 20));
    super.obstacles.add(createShape(RECT, 380, 50, 20, 70));
    
    super.obstacles.add(createShape(RECT, 550, 30, 170, 20));
    super.obstacles.add(createShape(RECT, 550, 50, 20, 70));
    super.obstacles.add(createShape(RECT, 720, 30, 20, 90));
    super.obstacles.add(createShape(RECT, 740, 100, 50, 20));
    
    super.obstacles.add(createShape(RECT, 550, 180, 170, 20));
    super.obstacles.add(createShape(RECT, 620, 110, 20, 70));
    
    super.obstacles.add(createShape(RECT, 450, 280, 170, 20));
    super.obstacles.add(createShape(RECT, 510, 210, 20, 70));
    
    super.obstacles.add(createShape(RECT, 680, 240, 70, 20));
    super.obstacles.add(createShape(RECT, 750, 240, 20, 240));
    super.obstacles.add(createShape(RECT, 680, 390, 70, 20));
    
    super.obstacles.add(createShape(RECT, 30, 320, 20, 150));
    super.obstacles.add(createShape(RECT, 50, 450, 350, 20));
    super.obstacles.add(createShape(RECT, 350, 390, 20, 60));
    super.obstacles.add(createShape(RECT, 370, 390, 220, 20));
    super.obstacles.add(createShape(RECT, 100, 390, 120, 20));
    
    super.obstacles.add(createShape(RECT, 600, 450, 60, 20));
    
    PShape bigPortal = createShape(ELLIPSE, 50, 290, 30, 60);
    bigPortal.setFill(color(81, 110, 99));
    super.portals.add(bigPortal);
    
    PShape mediumPortal = createShape(ELLIPSE, 45, 290, 20, 40);
    mediumPortal.setFill(color(146, 201, 181));
    super.portals.add(mediumPortal);
    
    PShape smallPortal = createShape(ELLIPSE, 40, 290, 10, 20);
    smallPortal.setFill(color(81, 110, 99));
    super.portals.add(smallPortal);
    
    bigPortal = createShape(ELLIPSE, 735, 210, 30, 60);
    bigPortal.setFill(color(81, 110, 99));
    super.portals.add(bigPortal);
    
    mediumPortal = createShape(ELLIPSE, 740, 210, 20, 40);
    mediumPortal.setFill(color(146, 201, 181));
    super.portals.add(mediumPortal);
    
    smallPortal = createShape(ELLIPSE, 745, 210, 10, 20);
    smallPortal.setFill(color(81, 110, 99));
    super.portals.add(smallPortal);
  }
  
  
}
