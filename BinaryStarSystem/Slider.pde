class Slider {
  //global variables
  private float scaleConstant; //used for scaling the output of the slider value
  
  //anchor for entire slider's positioning
  private float anchorX;
  private float anchorY;
  
  //slider object dimensions
  private int xSize = 30; 
  private int ySize = 20;
  private int sliderWidth = 250;
  
  //change in x position since starting dragged
  private float dx; 
  
  //current selector box position coordinates
  private float xPos;
  private float yPos;
  
  //temporary store for mouse & box position coordinates
  private float tempMousePosX;
  private float tempBoxPosX; 
  
  private boolean selected = false; //is slider selected by user's mouse
  
  Slider(float yAnchor, float xAnchor, float scaleConstant){
    this.anchorX = xAnchor;
    this.anchorY = yAnchor;
    this.yPos = anchorY; //anchor x and y values for both boxes
    this.xPos = anchorX;
    this.scaleConstant = scaleConstant;
  }
  
  void display(){ //called every frame
    fill(200); //fill = light gray
    
    rect(anchorX+5, anchorY+8, sliderWidth+20, 5); //slider back bar
    
    if(mouseIsOver()){
      stroke(240);
    } else {
      stroke(100);
    }
    rect(xPos, yPos, xSize, ySize);
    
    stroke(0);
    fill(100);
  }
  
  boolean mouseIsOver(){ //returns true if mouse is over slider 1
    if(pmouseX > (xPos) && pmouseY > (yPos) && pmouseX < (xPos+xSize) && pmouseY < (yPos+ySize)){
      return true;
    } else {
      return false;
    }
  }
  
  void mousePressed(){ //on click
    if(mouseIsOver()){ //box clicked
      selected = true; //select this slider for movement
      tempMousePosX = pmouseX; //Store mouse x position
      tempBoxPosX = xPos; //Store temporary constant x position
    }
  }
  
  void mouseReleased(){
    selected = false;
  }
  
  void mouseDragged(){
    if(selected == true){ //if slider selection box is selected by user's mouse
      dx = pmouseX - tempMousePosX; //find difference dragged
      
      //check boundaries
      if((tempBoxPosX+dx)<anchorX){ //lower bound
        xPos = anchorX;
      } else if((tempBoxPosX+dx)>(anchorX+sliderWidth)){
        xPos = anchorX+sliderWidth;
      } else {
        xPos = tempBoxPosX + dx;
      }
    }
  }
  
  public float getSlider(){ //getter for slider values
    float maxPosition = anchorX + float(sliderWidth);
    float minPosition = anchorX;
    float range = maxPosition-minPosition; //range of the slider
    float normalisedValue;
    
    normalisedValue = (xPos-minPosition)/range;
      
    return (normalisedValue * scaleConstant)+100;
  }
}
