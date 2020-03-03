class Slider {
  float anchorX, anchorY;
  float xPos, yPos; //current box 1 position
  float dx; //change in position since being dragged
  float tempMousePosX, tempBoxPosX; //temporary store for mouse & box position on press
  
  boolean selected1 = false; //check that the slider should be moved
  
  int xSize = 30; //box sizes
  int ySize = 20;
  int sliderWidth = 250;
  
  Slider(float y, float x){ //constructor method
    this.anchorX = x;
    this.anchorY = y;
    this.yPos = anchorY; //anchor x and y values for both boxes
    this.xPos = anchorX;
  }
  
  void display(){
    fill(200);
    
    rect(anchorX+5, anchorY+8, sliderWidth+20, 5); //slider back bar
    
    if(mouseIsOver1()){
      stroke(240);
    } else {
      stroke(100);
    }
    rect(xPos, yPos, xSize, ySize);
    
    stroke(0);
    fill(100);
    textSize(16);
    
    if(mouseIsOver1()){ //check mouse is over box
      float slider1MidPoint = xPos+(xSize/2);
      float text1X = slider1MidPoint-(textWidth((int)getSlider(1)+"g")/2);
      float text1Y = yPos+40;
      
      text((int)getSlider(1)+"g", text1X, text1Y);
    }
  }
  
  boolean mouseIsOver1(){ //returns true if mouse is over slider 1
    if(pmouseX > (xPos) && pmouseY > (yPos) && pmouseX < (xPos+xSize) && pmouseY < (yPos+ySize)){
      return true;
    } else {
      return false;
    }
  }
  
  void mousePressed(){ //on click
    if(mouseIsOver1()){ //box 1 clicked
      selected1 = true; //select this slider for movement
      tempMousePosX = pmouseX; //Store mouse x position
      tempBoxPosX = xPos; //Store temporary constant x position
      
    }
  }
  
  void mouseReleased(){
    selected1 = false;
  }
  
  void mouseDragged(){
    if(selected1 == true){ //if box 1 is selected
      dx = pmouseX - tempMousePosX; //find difference
      
      //check boundaries
      if((tempBoxPosX+dx)<anchorX){ //lower bound
        xPos = anchorX;
      } else {
        xPos = tempBoxPosX + dx;
      }
    }
  }
  
  float getSlider(int n){ //getter for slider values
    float maxPosition = anchorX + float(sliderWidth);
    float minPosition = anchorX;
    float range = maxPosition-minPosition; //range of the slider
    float normalisedValue;
    
    normalisedValue = (xPos-minPosition)/range;
      
    return pow(10, (normalisedValue*8));
  }
}

/* TOOO:
- Fix right hand slider stopper (currently slides off the sldier)

*/
