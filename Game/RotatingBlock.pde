public class RotatingBlock {
  public float x, y;      
  public float w, h;    
  public float angle;
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

  public boolean containsPoint(float px, float py) {
    PVector local = toLocal(px, py);
    if (abs(local.x) <= w / 2 && abs(local.y) <= h / 2){
      return true;
    }else{
      return false;
    }
  }

  public PVector getTangentialVelocity(float px, float py) {
    //using formula v = w(r) 
    PVector r = new PVector(px - x, py - y);
    return new PVector(-rotationSpeed * r.y, rotationSpeed * r.x);
  }

  public PVector toLocal(float px, float py) {
    float dx = px - x;
    float dy = py - y;
    float cosA = cos(-angle);
    float sinA = sin(-angle);
    return new PVector(dx * cosA - dy * sinA, dx * sinA + dy * cosA);
  }

  public PVector toWorld(PVector local) {
    float cosA = cos(angle);
    float sinA = sin(angle);
    return new PVector(local.x * cosA - local.y * sinA + x,local.x * sinA + local.y * cosA + y);
  }
}
