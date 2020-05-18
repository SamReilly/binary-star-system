class PopulationController {
  private float xPos;
  private float yPos;
  private int currentValue;
  private boolean select1;
  private boolean select2;
  
  public PopulationController(float xPos, float yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.currentValue = 2;
  }
  
  public int getValue() {
    return this.currentValue;
  }
  
  public void draw() {
    //check selection of minus button
    if(pmouseX < xPos+29 &&
      pmouseX > xPos+14 &&
      pmouseY > yPos+10 &&
      pmouseY < yPos+25){
      select1 = true;
    } else {
      select1 = false;
    }
    
    //check selection of plus button
    if(pmouseX < xPos+82 &&
      pmouseX > xPos+67 &&
      pmouseY > yPos+10 &&
      pmouseY < yPos+25){
      select2 = true;
    } else {
      select2 = false;
    }
    
    stroke(50);
    fill(200);
    rect(xPos, yPos, 100, 35);
    fill(0);
    text(currentValue, xPos+45, yPos+22);
    
    fill(195);
    if(select1){stroke(255);} else {stroke(0);}
    rect(xPos+14, yPos+10, 15, 15);
    if(select2){stroke(255);} else {stroke(0);}
    rect(xPos+67, yPos+10, 15, 15);
    
    fill(0);
    text('+', xPos+70, yPos+22);
    text('-', xPos+18, yPos+22);
  }
  
  public void mousePressed(){
    if(select1){
      currentValue -= 1;
    } else if(select2){
      currentValue += 1;
    }
    
    //maintain within the range
    if(currentValue < 2){
      currentValue = 2;
    } else if(currentValue > 8){
      currentValue = 8;
    }
  }
}
