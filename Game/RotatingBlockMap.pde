public class RotatingBlockMap extends Map {
  private RotatingBlock left;
  private RotatingBlock right;
  private float rightDelayAngle = 0;

  public RotatingBlockMap() {
    super();
    left = new RotatingBlock(200, 300, 390, 60, 0.02); 
    right = new RotatingBlock(600, 300, 390, 60, 0.02);
  }

  @Override
  public void display() {
    super.display();
    left.display();
    right.display();
  }

  @Override
  public void checkCollision(Player player) {
    super.checkCollision(player);

    left.update();

    rightDelayAngle = left.angle - 0.4;
    right.setAngle(rightDelayAngle);
    right.update();

    left.applyMovement(player);
    right.applyMovement(player);
  }
}
