class Map{
  private ArrayList<PShape> obstacles;
  private int level; 
  private int[][] layout; //-1 wall, 0 holes, 1
  //private PVector spawnPoint; 
  
  public Map(int level){
    this.level = level;
    //this.spawnPoint = spawn;
    this.obstacles = new ArrayList<PShape>();
    createMap();
  }
  
  public void display(){
    for (PShape obstacle : obstacles){
      obstacle.setFill(color(168, 230, 207));
      obstacle.setStroke(color(255));
      obstacle.setStrokeWeight(3);
      shape(obstacle);
    }
  }
  public void createMap(){
    obstacles.clear();
    if (level == 2){
      PShape Wall = createShape(RECT, 100, 100, 200, 20);
      obstacles.add(Wall);
    }
      
    fill(0);
    textSize(16);
    text("Level: " + level, 10, 20);
  }

  
  public void checkCollision(PVector pos){
    float x = pos.x;
    float y = pos.y;
    for(PShape obstacle : obstacles){
      if(obstacle.X <= x && x <= obstacle.X + obstacle.width){
        
      }
      if(obstacle.Y <= y && y <= obstacle.Y + obstacle.height){
        
      }
    }
    
    //for (PShape obs : obstacles) {
    //  float ox = obstacle.getParam("x");
    //  float oy = obstacle.getParam("y");
    //  float ow = obstacle.getParam("width");
    //  float oh = obstacle.getParam("height");
      
    //  if (pos.x > ox && pos.x < ox + ow && pos.y > oy && pos.y < oy + oh) {
    //    velocity.x *= -1;
    //    velocity.y *= -1;
    //  }
    //}
  }
    /*  Figure out what is collision for
    
    if (boomerangPos.x > x && boomerangPos.x < x + w &&
       boomerangPos.y > y && boomerangPos.y < y + h) {
        boomerangVel.x *= -1;
        boomerangVel.y *= -1;
        return;
      }
    */

}
