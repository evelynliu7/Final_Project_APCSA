//main class
Player Player1 = new Player(1);
boolean p1up, p1left, p1down, p1right = false;
boolean p1DoubleClick = false;

Player Player2 = new Player(2);
boolean p2w, p2a, p2s, p2d = false;
boolean p2DoubleClick = false;

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
  }
  Player1.display();
  
  if(frameCount % Player2.speed == 0){
    Player2.move(p2w, p2a, p2s, p2d);
  }
  if(p2DoubleClick){
    Player2.throwBoomerang();
  }
  Player2.display();
}

void reset(){
  
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      p1up = true;
      //check double click
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
}

void keyReleased(){
  if(key==CODED){
    if(keyCode==UP) p1up = false;
    if(keyCode==LEFT) p1left = false;
    if(keyCode==DOWN) p1down = false;
    if(keyCode==RIGHT) p1right = false;
  }
  
  if (keyCode == 'W') p2w = false;
  if (keyCode == 'A') p2a = false;
  if (keyCode == 'S') p2s = false;
  if (keyCode == 'D') p2d = false;
}
