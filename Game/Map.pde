class Map{
  private ArrayList<PShape> obstacles; 
  private int level; 
  private int[][] layout;
  private PVector spawnPoint; 
  

  public Map(int level){
    this.level = level;
    //this.spawnPoint = spawn;
    this.obstacles = new ArrayList<PShape>();
  }
  
  public void display(){
    fill(144,238,144);
    for (PShape obstacle : obstacles){
      shape(obstacle);
    }
  }
  public void levelDisplay(){
    obstacles.clear();
    if (level == 1){
      PShape Wall = createShape(RECT, 100, 100, 200, 20);
      obstacles.add(Wall);
    }
      
    fill(0);
    textSize(16);
    text("Level: " + level, 10, 20);
  }
  
  public void checkCollision(){
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
