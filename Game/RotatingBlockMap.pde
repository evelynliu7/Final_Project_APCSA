public class RotatingBlockMap extends Map {
  private RotatingBlock left;
  private RotatingBlock right;
  private float rightDelayAngle;

  public RotatingBlockMap() {
    super();
    left = new RotatingBlock(250, 250, 180, 30, 0.005); 
    right = new RotatingBlock(550, 250, 180, 30, 0.005);
    rightDelayAngle = 0;
    createMap();
  }

  public void display() {
    super.display();
    left.display();
    right.display();
  }
  
  public void createMap(){
    super.obstacles.add(new Wall(350, 20, 100, 50));
    super.obstacles.add(new Wall(350, 430, 100, 50));
    
    super.obstacles.add(new Wall(20, 200, 50, 100));
    super.obstacles.add(new Wall(730, 200, 50, 100));
  }

  public void checkCollision(Player player) {
    super.checkCollision(player);
  
    left.update();
    rightDelayAngle = left.angle - 0.4;
    right.setAngle(rightDelayAngle);
    right.update();
  
    if (left.containsPoint(player.getpos().x, player.getpos().y)) {
      push(player, left);
      PVector vel = left.getTangentialVelocity(player.getpos().x, player.getpos().y);
      player.setpos(PVector.add(player.getpos(), vel));
    }
    
    else if (right.containsPoint(player.getpos().x, player.getpos().y)) {
      push(player, right);
      PVector vel = right.getTangentialVelocity(player.getpos().x, player.getpos().y);
      player.setpos(PVector.add(player.getpos(), vel));
    }
  }

 public void push(Player player, RotatingBlock block) {
    PVector pos = player.getpos();
    PVector local = block.toLocal(pos.x, pos.y);
  
    float halfW = block.w / 2;
    float halfH = block.h / 2;
  
    float pushX = 0;
    float pushY = 0;
  
    float distRight = halfW - local.x;
    float distLeft = -halfW - local.x;
    float distDown = halfH - local.y;
    float distUp = -halfH - local.y;
  
    float minDist = abs(distRight);
    pushX = distRight;
  
    if (abs(distLeft) < abs(minDist)) {
      minDist = abs(distLeft);
      pushX = distLeft;
    }
    if (abs(distDown) < abs(minDist)) {
      minDist = abs(distDown);
      pushX = 0;
      pushY = distDown;
    }
    if (abs(distUp) < abs(minDist)) {
      minDist = abs(distUp);
      pushX = 0;
      pushY = distUp;
    }
  
    local.x += pushX;
    local.y += pushY;
  
    PVector world = block.toWorld(local);
    player.setpos(world);
    
  }


  
  public void checkCollision(Boomerang boom) {
    super.checkCollision(boom);
  
    left.update();
    rightDelayAngle = left.angle - 0.4;
    right.setAngle(rightDelayAngle);
    right.update();
  
    if (left.containsPoint(boom.getLocation().x, boom.getLocation().y) && !boom.isStopped()) {
      boom.setVelocity(new PVector(0, 0));
      boom.setStopped(true);
    }
    if (right.containsPoint(boom.getLocation().x, boom.getLocation().y) && !boom.isStopped()) {
      boom.setVelocity(new PVector(0, 0));
      boom.setStopped(true);
    }
  }


}
