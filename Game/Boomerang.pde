class Boomerang{
  private PVector velocity; 
  private PVector location; 
  private color c; 
  private Player owner; 
  
  public Boomerang(Player owner, color c){
    this.owner = owner;
    this.c = c;
  }
  
  public void display(){
    fill(c);
    circle(owner.pos.x, owner.pos.y, 3);
  }
  
  public void updateColor(color newColor){
    c = newColor;
  }
  
  public void move(){
    
  }
  
  public void animate(){
    
  }
}
