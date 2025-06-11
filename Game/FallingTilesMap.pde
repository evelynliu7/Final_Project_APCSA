public class FallingTilesMap extends Map{
  private int[][] grid;
  private int[][] timeStepped;
  private final int SQUARE_SIZE;
  
  public FallingTilesMap(){
    super();
    SQUARE_SIZE = 20;
    grid = new int[500/SQUARE_SIZE][800/SQUARE_SIZE];
    timeStepped = new int[500/SQUARE_SIZE][800/SQUARE_SIZE];
    createMap();
  }
  
  public void display(){
    for(int i=0; i<height/SQUARE_SIZE; i++){
      for(int j=0; j<width/SQUARE_SIZE; j++){
        if(grid[i][j]==0){
          fill(221, 237, 196);
        }
        if(grid[i][j]==1){
          fill(148, 158, 131);
        }
        if(grid[i][j] == 2){
          fill(75, 79, 66);
        }
        if(grid[i][j] == 3){
          fill(0);
        }
        if(grid[i][j] >= 4){
          fill(255);
        }
        square(j*SQUARE_SIZE, i*SQUARE_SIZE, SQUARE_SIZE);
      }
    }
    
  }
  
  public boolean updateTime(PVector pos){
    boolean re = false;
    int x = (int)pos.x/SQUARE_SIZE;
    int y = (int)pos.y/SQUARE_SIZE;
    
    if(millis() - timeStepped[y][x] >= 50){
      grid[y][x]++;
      if(grid[y][x] == 4){
        re = true;
      }
    }
    timeStepped[y][x] = millis();
    return re;
  }
  
  public void checkCollision(Player player){
    int x = (int)player.getpos().x/SQUARE_SIZE;
    int y = (int)player.getpos().y/SQUARE_SIZE;
    
    if(grid[y][x] >= 4 && millis() - timeStepped[y][x] >= 50){
      while(player.getLives()>0){
        player.updateLives(-1);
      }
    }
    
  }
  
  public void resetTiles(){
    grid = new int [500/SQUARE_SIZE][800/SQUARE_SIZE];
  }
}
