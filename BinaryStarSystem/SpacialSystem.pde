import java.util.Random;

class SpacialSystem {
  
  private SpacialBody[] bodiesArray;
  private float centreX, centreY;
  private PVector COMVector;
  
  public SpacialSystem(int n){
    bodiesArray = new SpacialBody[n];
    
    bodiesArray[0] = new SpacialBody(100, "Body", Colour, width/2, (height/2)+100, this);
    bodiesArray[1] = new SpacialBody(150, "Body", Colour, width/2, (height/2)-100, this);
  }
  
  public void display(){
    calcCoM(); //first, calculate the new centre of mass for this frame
    displayCoM(); //set the new coordinates of the centre of mass cross
    for(int i=0; i<bodiesArray.length; i++){
      bodiesArray[i].calculateNewAcceleration(COMVector);
    }
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
    COMVector = new PVector(centreX, centreY);
  }
  
  private void displayCoM(){ //displays the centre of mass as a cross on the screen
    line(centreX, centreY-10, centreX, centreY+10);
    line(centreX-10, centreY, centreX+10, centreY);
  }
  
  public float getSystemMass() {
    float totalMass = 0;
    for(int i=0; i<bodiesArray.length; i++){
      totalMass += bodiesArray[i].getMass();
    }
    return totalMass;
  }
}
