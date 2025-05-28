public class Map{
  private ArrayList<PShape> obstacles; 
  private int level; 
  private PVector spawnPoint; 
  
  public Map(int level, PVector spawn) {
    this.level = level;
    this.spawnPoint = spawn;
    this.obstacles = new ArrayList<PShape>();
    levelDisplay(level);
  }
  
  void draw(){
  fill(144,238,144);
  for (PShape obstacle : obstacles){
    shape(obstacle);
  }
  }
  public void levelDisplay(int level){
    obstacles.clear();
    if (level == 1){
      PShape Wall = createShape(RECT, 100, 100, 200, 20);
      obstacles.add(Wall);
    }
  }
  public void checkCollision(PVector pos, PVector velocity){}
    for (PShape obstacle : obstacles){
      float ox = obstacle.getParam("x");
      float oy = obstacle.getParam("y");
      float ow = obstacle.getParam("width");
      float oh = obstacle.getParam("height");

      if (pos.x > ox && pos.x < ox + ow && pos.y > oy && pos.y < oy + oh) {
       velocity.x *= -1;
       velocity.y *= -1;
     }
    }
  
}
