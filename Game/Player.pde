class Player{
  public PVector pos;
  private Boomerang PlayerBoomerang;
  private int speed; 
  private int lives; 
  private boolean hasBoomerang; 
  private int character; 
  //private char[] controls; 
  //private PowerUp activePowUp;

  public Player(int character) {
    this.pos = new PVector(width/2, height/2);
    this.PlayerBoomerang = new Boomerang(this, 255);
    this.speed = 5;
    this.lives = 3;
    this.hasBoomerang = true;
    this.character = character;
    //this.controls = controls;
  }
  
  void display(){
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
  }
  
  public void die(){
    if (lives == 0){
      
    }
  }
  
  public void throwBoomerang(){
    
  }
  
  public void applyPowerUp(){
    
  }
  

}
