//Controls number of spacial bodies in current use
class PopulationController {
  
  float posX, posY; //anchor positions of the top left corner of the object
  float boxWidth = 50, boxHeight = 120; //object dimensions
  
  public PopulationController(float posX, float posY){
    this.posX = posX;
    this.posY = posY;
  }
  
  public void display(){
    rect(posX, posY, boxWidth, boxHeight);
    fill(255);
    ellipse(posX+(boxWidth/2), posY+boxHeight/6, 30, 30);
    ellipse(posX+(boxWidth/2), posY+(5*boxHeight)/6, 30, 30);
  }
}
