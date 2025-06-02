//main class
char[] arrowKeys = {(char)UP, (char)LEFT, (char)DOWN, (char)RIGHT};
Player Player1 = new Player(1, arrowKeys);

char[] WASD = {'w', 'a', 's', 'd'};
Player Player2 = new Player(2, WASD );

int screen=1;
ArrayList<Map> maps = new ArrayList<Map>();

PFont f;

void setup(){
  size(800, 500);
  Map mazeMap = new Map(1);
  maps.add(0, mazeMap);
  f=createFont("Showcard Gothic", 24);
}

void draw(){
  if (screen==0) {
    //home screen
    textFont(f, 50);
    textAlign(LEFT);
    text("BOOMERANG", 30, 175);
    text("FU", 145, 225);
  }
  else {
    background(153, 222, 138);
    //make background specific map
    Map currMap = maps.get(screen-1);
    currMap.display();
    
    if(frameCount % Player1.speed == 0){
      Player1.move();
    }
    
    Player1.PlayerBoomerang.move();
    Player1.display();
    Player1.PlayerBoomerang.display();  
    
    if(frameCount % Player2.speed == 0){
      Player2.move();
    }
    
    Player2.display();
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
}
