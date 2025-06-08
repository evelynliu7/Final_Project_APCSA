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
  private boolean isSlowed = false;
  private int slowStartFrame = 0;
  private int slowDurationFrames = 300; // 5 seconds at 60 FPS
  
  private int firstKeyPressTime = 0;
  private boolean firstKeyPressed = false, firstKeyReleased = false;
  
  private boolean allowedUp = true, allowedLeft = true, allowedDown = true, allowedRight = true;
  
  private int playerWidth, playerHeight;

  public Player(int character, char[] controls, int xPos, int yPos) {
    this.pos = new PVector(xPos, yPos);
    this.PlayerBoomerang = new Boomerang(this, 255);
    this.speed = 1;
    this.lives = 3;
    this.hasBoomerang = true;
    this.character = character;
    this.controls = controls;
    playerWidth = 10;
    playerHeight = 10;
  }
  
  void display(){
    //if(pos.x < 0) pos.x = 0;
    //if(pos.x > width) pos.x = width;
    //if(pos.y < 0) pos.y = 0;
    //if(pos.y < height) pos.y = height;
    
    if(character == 1){
      fill(255);
      stroke(255);
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
  
  void setAllowedUp(boolean b){
    allowedUp = b;
  }
  void setAllowedLeft(boolean b){
    allowedLeft = b;
  }
  void setAllowedDown(boolean b){
    allowedDown = b;
  }
  void setAllowedRight(boolean b){
    allowedRight = b;
  }
  
  void move(){
    if(up && allowedUp) pos.y--;
    if(left && allowedLeft) pos.x--;
    if(down && allowedDown) pos.y++;
    if(right && allowedRight) pos.x++;
    
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
    if(isSlowed && frameCount - slowStartFrame > slowDurationFrames){
      isSlowed = false;
      speed = 2; // brings the speed back
    }
  
    if(hasBoomerang){
      hasBoomerang = false;
      PlayerBoomerang.setTimer(0);
      PlayerBoomerang.setReturning(false);
    
      float speed = 10;
    
      if(dir == 'W' || dir == UP){
        PlayerBoomerang.setVelocity(new PVector(0, -speed));
      } else if(dir == 'A' || dir == LEFT){
        PlayerBoomerang.setVelocity(new PVector(-speed, 0));
      } else if(dir == 'S' || dir == DOWN){
        PlayerBoomerang.setVelocity(new PVector(0, speed));
      } else if(dir == 'D' || dir == RIGHT){
        PlayerBoomerang.setVelocity(new PVector(speed, 0));
      }
      PlayerBoomerang.location = pos.copy(); 
      PlayerBoomerang.move();
    }
  }
  
  public Boomerang getBoomerang(){
    return PlayerBoomerang;
  }
  
  public void setpos(PVector newPos){
    pos = newPos;
  }
  
  public PVector getpos(){
    return pos;
  }
  
  public void checkHit(Player other){
    float otherX = other.getpos().x;
    float otherY = other.getpos().y;
    float boomX = PlayerBoomerang.getLocation().x;
    float boomY = PlayerBoomerang.getLocation().y;
    if(otherX <= boomX && boomX <= otherX + 12.5 && otherY <= boomY && boomY <= otherY + 12.5){
      if(!PlayerBoomerang.getReturning()){
        other.updateLives();
        //other.slowDown();
      }
    }
  }
  
  public void slowDown(){
    //for like 5 seconds make it slower 
    isSlowed = true;
    slowStartFrame = frameCount;
    speed = 1;
  }
  public void updateLives(){
    lives--; 
  }
  public void displayLives(){
    textSize(18);
    fill(255, 102, 125);
    if(controls[0]=='w'){
      text("Player 2's lives: " + lives, 710, 490);
    }
    else{
      text("Player 1's lives: " + lives, 90, 490);
    }
  }
  
  
  public void die(){
    if (lives == 0){
      
    }
  }
  
  public void applyPowerUp(){
    
  }
  

}
