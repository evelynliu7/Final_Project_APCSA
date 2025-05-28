public class Map{
  private ArrayList<PShape> obstacles; 
  private int level; 
  private PVector spawnPoint; 
  
  public Map(){
    level = 1;
    spawnPoint = new PVector(100, 100);
    obstacles = new ArrayList<PShape>();
  }
  void draw(){
  fill(144,238,144);
  for (PShape obstacle : obstacles){
    shape(obstacle);
  }
  }
  public void levelDisplay(){
    if (level == 1) {
        obstacles.add(createShape(RECT, 150, 100, 20, 200));
        obstacles.add(createShape(RECT, 100, 250, 200, 20));
        obstacles.add(createShape(RECT, 300, 300, 100, 20));
      }
      
    fill(0);
    textSize(16);
    text("Level: " + level, 10, 20);
  }
  public void checkCollision(){
    for (PShape obs : obstacles) {
      float x = obs.getParams()[0];
      float y = obs.getParams()[1];
      float w = obs.getParams()[2];
      float h = obs.getParams()[3];

    /*  Figure out what is collision for
    
    if (boomerangPos.x > x && boomerangPos.x < x + w &&
       boomerangPos.y > y && boomerangPos.y < y + h) {
        boomerangVel.x *= -1;
        boomerangVel.y *= -1;
        return;
        */
      }
    }
  }
  
  
}
