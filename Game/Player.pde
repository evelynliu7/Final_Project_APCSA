class Player{
  public PVector pos;
  private Boomerang PlayerBoomerang;
  public int speed; 
  private int lives; 
  private boolean hasBoomerang; 
  private int character; 
  //private char[] controls; 
  //private PowerUp activePowUp;

  public Player(int character) {
    this.pos = new PVector(400, 250);
    this.PlayerBoomerang = new Boomerang(this, 255);
    this.speed = 2;
    this.lives = 3;
    this.hasBoomerang = true;
    this.character = character;
    //this.controls = controls;
  }
  
  void display(){
    //if(pos.x < 0) pos.x = 0;
    //if(pos.x > width) pos.x = width;
    //if(pos.y < 0) pos.y = 0;
    //if(pos.y < height) pos.y = height;
    
    if(character == 1){
      fill(255);
      circle(pos.x, pos.y, 10);
    }
    else if(character == 2){
      fill(0);
      square(pos.x, pos.y, 10);
    }
    PlayerBoomerang.display();
  }
  
  void move(boolean up, boolean left, boolean down, boolean right){
    if(up) pos.y--;
    if(left) pos.x--;
    if(down) pos.y++;
    if(right) pos.x++;
    
    //WRAP AROUND
    pos.x += width; pos.x %= width;
    pos.y += height; pos.y %= height;
  }
  
  public void die(){
    if (lives == 0){
      
    }
  }
  
  public void throwBoomerang(){
    if(hasBoomerang){
      
    }
  }
  
  public void applyPowerUp(){
    
  }
  

}
