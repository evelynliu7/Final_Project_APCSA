class Map{
  public ArrayList<Wall> obstacles;
  
  public Map(){
    this.obstacles = new ArrayList<Wall>();
  }
  
  public void display(){
    for (Wall obstacle : obstacles){
      obstacle.display();
    }
    
  }
  public void createMap(){
    obstacles.clear();
  }

  
  public void checkCollision(Player player){
    float x = player.getpos().x;
    float y = player.getpos().y;
    boolean collidingR = false;
    boolean collidingL = false;
    boolean collidingU = false;
    boolean collidingD = false;
    
    for(Wall obstacle : obstacles){
      if((x+10 >= obstacle.x && x+10 <= obstacle.x + 5) && (y >= obstacle.y && y <= obstacle.y + obstacle.yLen)){
        collidingR = true;
        player.setAllowedRight(false);
      }
      if((x-5 >= obstacle.x + obstacle.xLen - 5 && x-5 <= obstacle.x + obstacle.xLen) && (y >= obstacle.y && y <= obstacle.y + obstacle.yLen)){
        collidingL = true;
        player.setAllowedLeft(false);
      }
      if((x >= obstacle.x && x <= obstacle.x + obstacle.xLen) && (y >= obstacle.y + obstacle.yLen && y <= obstacle.y + obstacle.yLen + 5)){
        collidingU = true;
        player.setAllowedUp(false);
      }
      if((x >= obstacle.x && x <= obstacle.x + obstacle.xLen) && (y+10 >= obstacle.y && y+10 <= obstacle.y + obstacle.yLen + 5)){
        collidingD = true;
        player.setAllowedDown(false);
      }
    }
    
    if(!collidingR){
      player.setAllowedRight(true);
    }
    if(!collidingL){
      player.setAllowedLeft(true);
    }
    if(!collidingU){
      player.setAllowedUp(true);
    }
    if(!collidingD){
      player.setAllowedDown(true);
    }
    
    
  }
  
  public void checkCollision(Boomerang boomerang){
    for (Wall obstacle : obstacles) {
      PVector nextPos = PVector.add(boomerang.getLocation(), boomerang.getVelocity());
      float margin = 3;
      
      if (nextPos.x > obstacle.x - margin && nextPos.x < obstacle.x + obstacle.xLen + margin &&
          nextPos.y > obstacle.y - margin && nextPos.y < obstacle.y + obstacle.yLen + margin) {
          
          boomerang.setVelocity(new PVector(0, 0));
          boomerang.setReturning(false);
          boomerang.setStopped(true);
          boomerang.setTimer(10000);
          return;
      }
    }
  }
  
  public boolean teleported(Player player){
    return false;
  }
  
  public boolean updateTime(PVector pos){
    return false;
  }
  
  public void resetTiles(){
  }
  
}
