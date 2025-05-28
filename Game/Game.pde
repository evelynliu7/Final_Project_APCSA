//main class
Player Player1 = new Player(1);
boolean p1up, p1left, p1down, p1right = false;
boolean p1DoubleClick = false;
int firstKeyPressTime_p1 = 0;
boolean firstKeyPressed_p1 = false;

Player Player2 = new Player(2);
boolean p2w, p2a, p2s, p2d = false;
boolean p2DoubleClick = false;
int firstKeyPressTime_p2 = 0;
boolean firstKeyPressed_p2 = false;

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
      if(!firstKeyPressed_p1){
        firstKeyPressed_p1 = true;
        firstKeyPressTime_p1 = millis();
      }
      else{
        if(millis() - firstKeyPressTime_p1 <= 200){
          p1DoubleClick = true;
        }
        else{
          firstKeyPressTime_p1 = millis();
        }
      }
    }
    if(keyCode==LEFT) p1left = true;
    if(keyCode==DOWN) p1down = true;
    if(keyCode==RIGHT) p1right = true;
  }
  
  if (keyCode == 'W'){
    p2w = true;
    //check double click
    if(!firstKeyPressed_p2){
        firstKeyPressed_p2 = true;
        firstKeyPressTime_p2 = millis();
      }
      else{
        if(millis() - firstKeyPressTime_p2 <= 200){
          p2DoubleClick = true;
        }
        else{
          firstKeyPressTime_p2 = millis();
        }
      }
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
