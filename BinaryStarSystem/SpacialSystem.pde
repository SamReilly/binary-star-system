import java.util.Random;

class SpacialSystem {
  
  public boolean following;
  private SpacialBody[] bodiesArray;
  private float centreX, centreY;
  private PVector COMVector;
  private PVector origin = new PVector(width/2, height/2); //origin vector for center of screen
  
  public SpacialSystem(int n){
    bodiesArray = new SpacialBody[n];
    
    for(int i=0; i<bodiesArray.length; i++){
      bodiesArray[i] = new SpacialBody(100, findName(i), Colour, width/2, (height/2)+100-200*i, this);
    }
  }
  
  public void setMasses(float[] masses){
    //set new mass values from slider input array
    for(int i=0; i<bodiesArray.length; i++){
      bodiesArray[i].setMass(masses[i]);
    }
  }
  
  public void toggleShowName(){
    for(int i=0; i<bodiesArray.length; i++){
      bodiesArray[i].toggleShowName();
    }
  }
  
  public void display(){ //called every frame
    calcCoM(); //calculate the new centre of mass for this frame
    displayCoM(); //set the new coordinates of the centre of mass cross
    
    for(int i=0; i<bodiesArray.length; i++){
      bodiesArray[i].calculateNewAcceleration(COMVector);
    }
    
    if(following){
        //find the movement of the COM point and use it to re-center the system
      PVector shiftVector = findCOMShift();
      for(int i=0; i<bodiesArray.length; i++){
        bodiesArray[i].movePosition(shiftVector);
      }
    }
    
    for(int i=0; i<bodiesArray.length; i++){
      bodiesArray[i].display();
    }
  }
  
  private PVector findCOMShift(){
    return COMVector.sub(origin);
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
    stroke(0);
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
