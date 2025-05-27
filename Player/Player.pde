public class Player {

  private Boomerang Boomerang
  private int speed; 
  private int lives; 
  private boolean hasBoomerang; 
  private int character; 
  private char[] controls; 
  private activePowUp PowerUp; 

  public Player(int character, char[] controls) {
        this.character = character;
        this.controls = controls;
        this.speed = 5;
        this.lives = 3;
        this.hasBoomerang = true;
        this.boomerang = new Boomerang();
    }
  
  public void die(){
    if (lives == 0){
      
    }
  }
  
  public void move(){
    if (keyCode == UP){
     
    }
   if (keyCode == DOWN){
   
    }
    if (keyCode == LEFT){
    
    }
   if (keyCode == RIGHT){
    
   }
  }
  
  public void throwBoomerang(){}
  public applyPowerUp()

}
