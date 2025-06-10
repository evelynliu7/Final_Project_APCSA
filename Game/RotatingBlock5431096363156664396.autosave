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

  boolean isPlayerOnBlock(Player p) {
    float dist = dist(p.pos.x, p.pos.y, x, y);
    float diag = dist(0, 0, w/2, h/2);
    float playerRadius = max(p.playerWidth, p.playerHeight) / 2.0;
    return dist <= diag + playerRadius;
  }

  void applyMovement(Player p) {
    if (isPlayerOnBlock(p)) {
      float radius = dist(p.pos.x, p.pos.y, x, y);
      float playerAngle = atan2(p.pos.y - y, p.pos.x - x);
      playerAngle += rotationSpeed;
      p.pos.x = x + cos(playerAngle) * radius;
      p.pos.y = y + sin(playerAngle) * radius;
    }
  }

  void setAngle(float a) {
    angle = a;
  }
}
