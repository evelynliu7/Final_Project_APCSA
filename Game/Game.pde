//main class
Player Player1 = new Player(1);
boolean p1up, p1left, p1down, p1right = false;
boolean p1DoubleClick = false;
int firstKeyPressTime_p1 = 0;
boolean firstKeyPressed_p1, firstKeyReleased_p1 = false;

Player Player2 = new Player(2);
boolean p2w, p2a, p2s, p2d = false;
boolean p2DoubleClick = false;
int firstKeyPressTime_p2 = 0;
boolean firstKeyPressed_p2, firstKeyReleased_p2 = false;

void setup(){
  size(800, 500);
}

void draw(){
  background(153, 222, 138);
  if(frameCount % Player1.speed == 0){
    Player1.move(p1up, p1left, p1down, p1right);
  }
  if(p1DoubleClick){
    Player1.throwBoomerang();
    p1DoubleClick = false;
  }
  Player1.display();
  
  if(frameCount % Player2.speed == 0){
    Player2.move(p2w, p2a, p2s, p2d);
  }
  if(p2DoubleClick){
    Player2.throwBoomerang();
    p2DoubleClick = false;
  }
  Player2.display();
}

void reset(){
  
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      //println("testing");
      p1up = true;
    }
    if(keyCode==LEFT) p1left = true;
    if(keyCode==DOWN) p1down = true;
    if(keyCode==RIGHT) p1right = true;
  }
  
  if (keyCode == 'W'){
    p2w = true;
    //check double click
  }
  if (keyCode == 'A') p2a = true;
  if (keyCode == 'S') p2s = true;
  if (keyCode == 'D') p2d = true;
  
  if(checkDoubleClick((char)keyCode)){
    if(key==CODED){
      p1DoubleClick = true;
    }
    else{
      p2DoubleClick = true;
    }
  }
}

boolean checkDoubleClick(char direction){
  boolean DoubleClick = false;
  int firstKeyPressTime = 0;
  boolean firstKeyPressed = false, firstKeyReleased = false;
  
  if(!firstKeyPressed){
    firstKeyPressed = true;
    firstKeyReleased = false;
    firstKeyPressTime = millis();
  }
  else{
    //println(millis() - firstKeyPressTime_p1);
    if((millis() - firstKeyPressTime) <= 500 && firstKeyReleased){
      //println("here");
      DoubleClick = true;
      firstKeyPressed = false;
    }
    else{
      if(firstKeyReleased) firstKeyPressTime = millis();
      firstKeyReleased = false;
    }
  }
  
  return DoubleClick;
}

void keyReleased(){
  if(key==CODED){
    if(keyCode==UP){
      p1up = false;
      //if(firstKeyPressed_p1) firstKeyPressed_p1 = false;
      firstKeyReleased_p1 = true;
      //println("released");
    }
    if(keyCode==LEFT) p1left = false;
    if(keyCode==DOWN) p1down = false;
    if(keyCode==RIGHT) p1right = false;
  }
  
  if (keyCode == 'W'){
    p2w = false;
    //if(firstKeyPressed_p2) firstKeyPressed_p2 = false;
    firstKeyReleased_p2 = true;
  }
  if (keyCode == 'A') p2a = false;
  if (keyCode == 'S') p2s = false;
  if (keyCode == 'D') p2d = false;
}
