//main class
char[] arrowKeys = {(char)UP, (char)LEFT, (char)DOWN, (char)RIGHT};
Player Player1 = new Player(1, arrowKeys);

char[] WASD = {'w', 'a', 's', 'd'};
Player Player2 = new Player(2, WASD );

int screen=2;
ArrayList<Map> maps = new ArrayList<Map>();
Button start, home, rematch, directions;
boolean drawn=false;
PFont f;

void setup(){
  size(800, 500);
  
  Map mazeMap = new MazeMap(); //game maze
  maps.add(0, mazeMap);
  start = new Button(500, 150, 100, 200, "START", 20);
  directions = new Button(500, 275, 100, 200, "DIRECTIONS", 15);
  home = new Button(700, 425, 50, 75, "HOME", 15);
  
  f=createFont("Showcard Gothic", 24);
}

void draw(){
  if (screen==0) {
    //home screen
    background(255, 212, 184);
    textFont(f, 50);
    textAlign(LEFT);
    fill(255, 102, 125);
    text("BOOMERANG", 30, 175);
    text("FU", 145, 225);
    
    start.display();
    directions.display();
  }
  else if(screen == 1){ //directions
    background(255, 240, 217);
    fill(255, 157, 149);
    text("Directions:", 400, 10);
    
    text("Welcome to Boomerang Fu, an interactive two-player game!", 400, 40);
    home.display();
  }
  else{
    
    background(221, 237, 196);
    //make background specific map
    Map currMap = maps.get(screen-2);
    currMap.display();
   
    
    if(frameCount % Player1.speed == 0){
      Player1.move();
    }
    
    Player1.PlayerBoomerang.move();
    Player1.display();
    Player1.PlayerBoomerang.display();
    Player1.displayLives();
    currMap.checkCollision(Player1.getpos());
    currMap.checkCollision(Player1.PlayerBoomerang.getLocation());
    
    if(frameCount % Player2.speed == 0){
      Player2.move();
    }
    
    Player2.PlayerBoomerang.move();
    Player2.display();
    Player2.PlayerBoomerang.display();
    Player2.displayLives();
    currMap.checkCollision(Player2.getpos());
    currMap.checkCollision(Player2.PlayerBoomerang.getLocation());
    
    home.display();
    
  }
}

void reset(){
  
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP) Player1.setUP(true);
    if(keyCode==LEFT) Player1.setLEFT(true);
    if(keyCode==DOWN) Player1.setDOWN(true);
    if(keyCode==RIGHT) Player1.setRIGHT(true);
  }
  
  if (keyCode == 'W') Player2.setUP(true);
  if (keyCode == 'A') Player2.setLEFT(true);
  if (keyCode == 'S') Player2.setDOWN(true);
  if (keyCode == 'D') Player2.setRIGHT(true);
  
  checkDoubleClick((char)keyCode, Player1);
  checkDoubleClick((char)keyCode, Player2);
}

void checkDoubleClick(char directionKey, Player p){
  boolean DoubleClick = false;
    
  if(!p.getKeyPressed()){
    p.setKeyPressed(true);
    p.setKeyReleased(false);
    p.setKeyTime(millis());
  }
  else{
    //println(millis() - firstKeyPressTime_p1);
    if(millis() - p.getKeyTime() <= 200 && p.getKeyReleased()){
      //println("here");
      DoubleClick = true;
      p.setKeyPressed(false);
    }
    else{
      if(p.getKeyReleased()) p.setKeyTime(millis());
      p.setKeyReleased(false);
    }
  }
  
  if(DoubleClick){
    p.throwBoomerang(directionKey);
  }
  
}

void keyReleased(){
  if(key==CODED){
    if(keyCode==UP){
      Player1.setUP(false);
    }
    if(keyCode==LEFT) Player1.setLEFT(false);
    if(keyCode==DOWN) Player1.setDOWN(false);
    if(keyCode==RIGHT) Player1.setRIGHT(false);
    Player1.setKeyReleased(true);
  }
  else{
    if (keyCode == 'W'){
      Player2.setUP(false);
    }
    if (keyCode == 'A') Player2.setLEFT(false);
    if (keyCode == 'S') Player2.setDOWN(false);
    if (keyCode == 'D') Player2.setRIGHT(false);
    Player2.setKeyReleased(true);
  }
  
}

void mouseClicked() {
  //make button class; stores top-left corner, width, height
  //check which button mouse is cliking on
  //update screen variable
  if(screen==0){
    if(start.clicked(mouseX, mouseY)){
      screen = 2;
    }
    if(directions.clicked(mouseX, mouseY)){
      screen = 1;
    }
  }
  
  if(screen!=0){
    if(home.clicked(mouseX, mouseY)){
      screen = 0;
    }
  }
  
}
