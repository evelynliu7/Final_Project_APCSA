public class RotatingBlock {
  private float x, y;
  private float w, h;
  private float angle;
  private float rotationSpeed;

  public RotatingBlock(float x, float y, float w, float h, float rotationSpeed) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.angle = 0;
    this.rotationSpeed = rotationSpeed;
  }

  public void update() {
    angle += rotationSpeed;
  }

  public void display() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rectMode(CENTER);
    fill(168, 230, 207);
    stroke(255);
    strokeWeight(3);
    rect(0, 0, w, h);
    popMatrix();
  }

  public void setAngle(float a) {
    angle = a;
  }
}
