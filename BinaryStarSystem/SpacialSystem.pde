import java.util.Random;

class SpacialSystem {
  
  private SpacialBody[] bodiesArray;
  private float centreX, centreY;
  private Random random = new Random();
  
  public SpacialSystem(int n){
    bodiesArray = new SpacialBody[n];
    for(int i=0; i<n; i++){
      float randomX = (width/2)+random.nextInt(400)-200;
      float randomY = (height/2)+random.nextInt(400)-200;
      bodiesArray[i] = new SpacialBody(100, "Body", Colour, randomX, randomY);
    }
  }
  
  public void display(){
    calcCoM(); //first, calculate the new centre of mass for this frame
    displayCoM();
    for(int i=0; i<bodiesArray.length; i++){
      bodiesArray[i].display();
    }
  }
  
  private void calcCoM(){ // updates the position of the centre of mass of the system to centreX and centreY
    float fracTopX = 0;
    float fracTopY = 0;
    float fracBottomX = 0;
    float fracBottomY = 0;
    for(int i=0; i<bodiesArray.length; i++){
      float posX = bodiesArray[i].getPosX();
      float posY = bodiesArray[i].getPosY();
      float mass = bodiesArray[i].getMass();
      fracTopX += (posX*mass);
      fracTopY += (posY*mass);
      fracBottomX += mass;
      fracBottomY += mass;
    }
    centreX = fracTopX/fracBottomX; //set the two variables
    centreY = fracTopY/fracBottomY;
  }
  
  private void displayCoM(){ //displays the centre of mass as a cross on the screen
    line(centreX, centreY-10, centreX, centreY+10);
    line(centreX-10, centreY, centreX+10, centreY);
  }
}
