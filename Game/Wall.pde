public class Wall{
  PShape shape;
  float x, y, xLen, yLen;
  
  public Wall(float x, float y, float xLen, float yLen){
    this.x = x;
    this.y = y;
    this.xLen = xLen;
    this.yLen = yLen;
  }
  
  public void display(){
    PShape thisWall = createShape(RECT, x, y, xLen, yLen);
    thisWall.setFill(color(168, 230, 207));
    thisWall.setStroke(color(255));
    thisWall.setStrokeWeight(3);
    shape(thisWall);
  }
}
