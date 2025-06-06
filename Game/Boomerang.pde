class Boomerang{
  private PVector velocity; 
  private PVector location; 
  private color c; 
  private Player owner; 
  private int timer; 
  private float spinAngle = 0;
  private boolean returning = false;
  
  public Boomerang(Player owner, color c){
    this.owner = owner;
    this.c = c;
    this.timer = 0;
    this.location = owner.pos.copy();
    this.velocity = new PVector(0, 0);
  }
  
  public void display(){
    pushMatrix();
    translate(location.x, location.y);
    rotate(spinAngle);
    
    fill(c);
    circle(0, 0, 10);        
    stroke(255, 0, 0);
    strokeWeight(2);
    
    line(0, 0, 5, 0);        
    noStroke();
    popMatrix();
  }
  
  public void updateColor(color newColor){
    c += newColor;
    c%=256;
  }
  
  public void move(){
    //figure out how it comes back bc player will move 
    if (owner.hasBoomerang){
      location = owner.pos.copy();
      timer = 0;
      velocity = new PVector(0, 0);
      return;
    }
    
    timer++;
    animate();
  
    if (timer < 15 && !returning) {
      location.add(velocity);
    } else {
      returning = true;
      PVector toPlayer = PVector.sub(owner.pos, location);
      toPlayer.setMag(5);
      velocity = toPlayer;
      location.add(velocity);
    }
      if (PVector.dist(location, owner.pos) < 10) {
        owner.setHasBoomerang(true);
        returning = false;
        velocity = new PVector(0, 0);
    }
  animate();
  }
  
  public void animate(){
    spinAngle += 0.3;
  }
  
  public PVector getLocation(){
    return location;
  }
}
