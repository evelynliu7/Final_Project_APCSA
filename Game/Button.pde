public class Button{
  private int upperX;
  private int upperY;
  private int w, l;
  private String text;
  
  public Button(int upperX, int upperY, int l, int w, String text){
    this.upperX = upperX;
    this.upperY = upperY;
    this.l = l;
    this.w = w;
    this.text = text;
  }
  
  public void display(){
    fill(255);
    rect(upperX, upperY, w, l, 28);
    fill(0);
    text(text, 30, upperX+w/2, upperY+l/2);
  }
  
  public boolean clicked(int mx, int my){
    if(upperX <= mx && mx <= upperX+width && upperY<= my && my<=upperY+height){
      return true;
    }
    return false;
  }
}
