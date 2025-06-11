class Player{
  private PVector pos;
  private Boomerang PlayerBoomerang;
  private int speed; 
  private int lives; 
  private boolean hasBoomerang; 
  private int character; 
  private char[] controls; 
  private boolean up = false, left = false, down = false, right = false;
  private boolean isSlowed = false;
  private int slowStartFrame = 0;
  private int slowDurationFrames = 300; // 5 seconds at 60 FPS
  
  private int firstKeyPressTime = 0;
  private boolean firstKeyPressed = false, firstKeyReleased = false;
  
  private boolean allowedUp = true, allowedLeft = true, allowedDown = true, allowedRight = true;
  
  private int playerWidth, playerHeight;
  private color currC, originalC;
  
  private int numReturningHits, numForwardHits;
  
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
    numReturningHits = 0;
    numForwardHits = 0;
  }
  
  void display(){
    //if(pos.x < 0) pos.x = 0;
    //if(pos.x > width) pos.x = width;
    //if(pos.y < 0) pos.y = 0;
    //if(pos.y < height) pos.y = height;
    
    if(character == 1){
      originalC = 255;
      currC = 255;
      fill(currC);
      stroke(255);
      circle(pos.x, pos.y, 10);
    }
    else if(character == 2){
      originalC = 0;
      currC = 0;
      fill(currC);
      square(pos.x, pos.y, 10);
    }
    PlayerBoomerang.display();
  }
  void setNumReturning(int n) {
    numReturningHits = n;
  }
  void setNumForward(int n) {
    numForwardHits = n;
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
    boolean forwardHit = false, returningHit = false;
    if(character == 1){
      float r=(otherX+5-boomX)*(otherX+5-boomX)+(otherY+5-boomY)*(otherY+5-boomY);
      if (r<=7.5*7.5) {
        if(PlayerBoomerang.getReturning()){
          returningHit = true;
          numReturningHits++;
        }
        else{
          forwardHit = true;
          numForwardHits++;
        }
      }
    }
    else if (character == 2){
      float r=(otherX-boomX)*(otherX-boomX)+(otherY-boomY)*(otherY-boomY);
      if (r<=7.5*7.5) {
        if(PlayerBoomerang.getReturning()){
          returningHit = true;
          numReturningHits++;
        }
        else{
          forwardHit = true;
          numForwardHits++;
        }
      }
   }
   if(returningHit && numReturningHits<=1){
     other.updateLives(-1);
     animateHit();
     returningHit=false;
   }
   else if(forwardHit && numForwardHits<=1){
     other.updateLives(-1);
     animateHit();
     forwardHit=false;
   }
     
  }
  
  public void animateHit(){
    for(int i=0; i<3; i++){
      int start = millis();
      currC = color(255, 102, 125);
      if(millis() >= start + 100){
        currC = originalC;
      }
    }
  }
  
  public void slowDown(){
    //for like 5 seconds make it slower 
    isSlowed = true;
    slowStartFrame = frameCount;
    speed = 1;
  }
  public void updateLives(int num){
    lives += num; 
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
  
  
  public boolean dead(){
    if (lives == 0){
      return true;
    }
    return false;
  }
  
  public void setlives(int l){
    lives = l;
  }
  public int getLives(){
    return lives;
  }
  
  public void applyPowerUp(){
    
  }
  

}
