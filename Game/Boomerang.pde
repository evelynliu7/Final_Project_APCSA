class Boomerang{
  private PVector velocity; 
  private PVector location; 
  private color c; 
  private Player owner; 
  private int timer; 
  private float spinAngle = 0;
  
  public Boomerang(Player owner, color c){
    this.owner = owner;
    this.c = c;
    timer = 0;
    location = owner.pos; 
    velocity = PVector.mult(5);     
  }
  
  public void display(){
    fill(c);
    circle(owner.pos.x, owner.pos.y, 3);
  }
  
  public void updateColor(color newColor){
    c = newColor;
  }
  
  public void move(){
    //figure out how it comes back bc player will move 
    timer++;
    
    if (timer < 60) {
      location.add(velocity);
    } else {
      animate(); 
      PVector toPlayer = PVector.sub(owner.pos, location);
      toPlayer.setMag(5);
      velocity = toPlayer;
      location.add(velocity);
    }
  }
  
  public void animate(){
    spinAngle += 0.2; 
    fill(c);
    if (spinFrame == 0) {
      rect(location.x - 5, location.y - 1, 10, 2);
    } else if (spinFrame == 1) {
      line(location.x - 5, location.y + 5, location.x + 5, location.y - 5);
    } else if (spinFrame == 2) {
      rect(location.x - 1, location.y - 5, 2, 10);
    } else if (spinFrame == 3) {
      line(location.x - 5, location.y - 5, location.x + 5, location.y + 5);
    }
  }
}
