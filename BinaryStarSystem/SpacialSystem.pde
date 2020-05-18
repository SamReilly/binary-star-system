import java.util.Random;

class SpacialSystem {
  //global variables
  public boolean following;
  private SpacialBody[] bodiesArray;
  private float centreX, centreY;
  private PVector COMVector;
  private PVector origin = new PVector(width/2, height/2); //origin vector for center of screen
  
  //constructor method
  public SpacialSystem(int n){
    bodiesArray = new SpacialBody[n];
    
    for(int i=0; i<bodiesArray.length; i++){
      bodiesArray[i] = new SpacialBody(100, findName(i), Colour, findPosition(n, i).x, findPosition(n, i).y, this);
    }
  }
  
  //returns a valid position to start the input body in
  private PVector findPosition(int number, int index) {
    //find the correct angled unit vector
    PVector angledUnit = PVector.fromAngle((float)(2f*Math.PI*index/number));
    angledUnit.normalize();
    
    //multiply it to scale
    angledUnit.mult(100+number*15);
    
    //add the vector to the central coordinates
    return angledUnit.add(new PVector(width/2, height/2));
  }
  
  public void setMasses(float[] masses){
    //set new mass values from slider input array
    for(int i=0; i<bodiesArray.length; i++){
      bodiesArray[i].setMass(masses[i]);
    }
  }
  
  //toggles names on and off
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
  
  //returns the change in position of the centre of mass for tracking
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
  
  //returns the total system's mass for newton's formula
  public float getSystemMass() {
    float totalMass = 0;
    for(int i=0; i<bodiesArray.length; i++){
      totalMass += bodiesArray[i].getMass();
    }
    return totalMass;
  }
}
