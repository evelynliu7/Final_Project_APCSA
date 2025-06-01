class Player{
  public PVector pos;
  private Boomerang PlayerBoomerang;
  public int speed; 
  private int lives; 
  private boolean hasBoomerang; 
  private int character; 
  private char[] controls; 
  //private PowerUp activePowUp;
  private boolean up = false, left = false, down = false, right = false;
  
  private int firstKeyPressTime = 0;
  private boolean firstKeyPressed = false, firstKeyReleased = false;

  public Player(int character, char[] controls) {
    this.pos = new PVector(400, 250);
    this.PlayerBoomerang = new Boomerang(this, 255);
    this.speed = 2;
    this.lives = 3;
    this.hasBoomerang = true;
    this.character = character;
    this.controls = controls;
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
  
  void setUP(boolean b){
    up = b;
  }
  void setLEFT(boolean b){
    left = b;
  }
  void setDOWN(boolean b){
    down = b;
  }
  void setRIGHT(boolean b){
    right = b;
  }
  
  void move(){
    if(up) pos.y--;
    if(left) pos.x--;
    if(down) pos.y++;
    if(right) pos.x++;
    
    //WRAP AROUND
    pos.x += width; pos.x %= width;
    pos.y += height; pos.y %= height;
  }
  
  int getKeyTime(){
    return firstKeyPressTime;
  }
  void setKeyTime(int t){
    firstKeyPressTime = t;
  }
  
  boolean getKeyPressed(){
    return firstKeyPressed;
  }
  void setKeyPressed(boolean b){
    firstKeyPressed = b;
  }
  
  boolean getKeyReleased(){
    return firstKeyReleased;
  }
  void setKeyReleased(boolean b){
    firstKeyReleased = b;
  }
  
  public void setHasBoomerang(boolean b){
    hasBoomerang = b;
  }

  public boolean hasBoomerang(){
    return hasBoomerang;
  }
  public void throwBoomerang(char dir){
    if(hasBoomerang){
    hasBoomerang = false;
    PlayerBoomerang.timer = 0;
    PlayerBoomerang.returning = false;

    float speed = 10;

    if(dir == 'w' || dir == 'W' || dir == UP){
      PlayerBoomerang.velocity = new PVector(0, -speed);
    } else if(dir == 'a' || dir == 'A' || dir == LEFT){
      PlayerBoomerang.velocity = new PVector(-speed, 0);
    } else if(dir == 's' || dir == 'S' || dir == DOWN){
      PlayerBoomerang.velocity = new PVector(0, speed);
    } else if(dir == 'd' || dir == 'D' || dir == RIGHT){
      PlayerBoomerang.velocity = new PVector(speed, 0);
    }
    PlayerBoomerang.location = pos.copy(); 
  }
  }
  
  public void die(){
    if (lives == 0){
      
    }
  }
  
  public void applyPowerUp(){
    
  }
  

}
