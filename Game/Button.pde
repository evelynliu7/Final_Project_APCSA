public class Button{
  private int upperX;
  private int upperY;
  private int w, h;
  private String text;
  public int txtSize;
  
  public Button(int upperX, int upperY, int h, int w, String text, int txtSize){
    this.upperX = upperX;
    this.upperY = upperY;
    this.h = h;
    this.w = w;
    this.text = text;
    this.txtSize = txtSize;
  }
  
  public void display(){
    fill(255, 157, 149);
    stroke(255);
    strokeWeight(3);
    rect(upperX, upperY, w, h, 28);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(txtSize);
    text(text, upperX+(w/2), upperY+(h/2));
  }
  
  public boolean clicked(int mx, int my){
    if(upperX <= mx && mx <= upperX+w && upperY<= my && my<=upperY+h){
      return true;
    }
    return false;
  }
}
