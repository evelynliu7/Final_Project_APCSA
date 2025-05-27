class Player{
  
  private PVector pos;
  private Boomerang PlayerBoomerang;
  private int speed; 
  private int lives; 
  private boolean hasBoomerang; 
  private int character; 
  private char[] controls; 
  //private PowerUp activePowUp;

  public Player(int character, char[] controls) {
        this.character = character;
        this.controls = controls;
        this.speed = 5;
        this.lives = 3;
        this.hasBoomerang = true;
        PlayerBoomerang = new Boomerang();
  }
  
  void draw(){
    circle(0,0,3);
  }
  
  public void die(){
    if (lives == 0){
      
    }
  }
  
  void keyPressed(){
    if (keyCode == controls[0]){ //up
     
    }
    if (keyCode == controls[1]){ //left
   
    }
    if (keyCode == controls[2]){ //down
    
    }
    if (keyCode == controls[3]){ //right
    
   }
  }
  
  public void throwBoomerang(){
    
  }
  
  public void applyPowerUp(){
    
  }
  

}
