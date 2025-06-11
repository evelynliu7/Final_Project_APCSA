class RotatingBlock {
  float x, y;
  float w, h;
  float angle;
  float rotationSpeed;

  public RotatingBlock(float x, float y, float w, float h, float rotationSpeed) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.angle = 0;
    this.rotationSpeed = rotationSpeed;
  }

  void update() {
    angle += rotationSpeed;
  }

  void display() {
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

  void setAngle(float a) {
    angle = a;
  }
}
