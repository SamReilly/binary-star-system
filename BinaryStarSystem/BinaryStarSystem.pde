//global variables
PFont font;
PImage background;
Slider[] sliders;
float[] sliderValues;
SpacialSystem spaceSystem;
color Colour;
ButtonSetMass buttonSetMass;
ButtonSetCentre buttonSetCentre;
ButtonReset buttonReset;
ButtonReset buttonApply;
ButtonToggleName buttonToggleName;
PopulationController popController;

ParticleController particleController;

void setup(){
  frameRate(60);
  size(1280, 720);
  Colour = color(100); //colour variable of the spacial objects
  
  //instantiate new objects
  buttonSetMass = new ButtonSetMass("Set Mass", 1075, 90);
  buttonSetCentre = new ButtonSetCentre("Toggle Follow", 10, 10);
  buttonReset = new ButtonReset("Restart Scene", 10, 40);
  buttonApply = new ButtonReset("Apply", 1175, 32);
  buttonToggleName = new ButtonToggleName("Toggle Names", 10, 70);
  popController = new PopulationController(1060, 25);
  
  //moved to method for ability to call when reloading the scene
  systemSetup(); 
}

void systemSetup() {
  spaceSystem = new SpacialSystem(popController.getValue()); //create a new system with x number of stars
  particleController = new ParticleController();
  
  sliders = new Slider[popController.getValue()];
  sliderValues = new float[popController.getValue()];
  for(int i=0; i<sliders.length; i++){
    sliders[i] = new Slider(125+40*i, 975, 1000, findName(i));
  }
  setMasses();
}

char findName(int input){
  if(input < 0 || input >= 26){ //check ranges of the alphabet
    return '0';
  }
  return (char)('A'+input);
}

void reset(){
  spaceSystem = new SpacialSystem(popController.getValue()); //create a new system with x number of stars
  
  sliders = new Slider[popController.getValue()];
  sliderValues = new float[popController.getValue()];
  for(int i=0; i<sliders.length; i++){
    sliders[i] = new Slider(125+40*i, 975, 1000, findName(i));
  }
  setMasses();
}

void setMasses() {
  for(int i=0; i<sliders.length; i++){
    sliderValues[i] = sliders[i].getSlider();
  }
  spaceSystem.setMasses(sliderValues); //send the mass values to the spacial system
}

void toggleShowName() {
  spaceSystem.toggleShowName();
}

void draw(){ //called every frame
  background(200);
  textSize(32);
  fill(140);
  text("Binary & Multi-Star System Model", 275, 50);
  textSize(14);
  
  particleController.draw();
  spaceSystem.display();
  for(int i=0; i<sliders.length; i++){
    sliders[i].display();
  }
  
  buttonSetMass.display();
  buttonSetCentre.display();
  buttonReset.display();
  buttonApply.display();
  buttonToggleName.display();
  popController.draw();
  drawKey();
  drawInstructions();
}

void mousePressed() { //executes on click
  for(int i=0; i<sliders.length; i++){
    sliders[i].mousePressed();
  }
  buttonSetMass.mousePressed();
  buttonSetCentre.mousePressed();
  buttonReset.mousePressed();
  buttonApply.mousePressed();
  buttonToggleName.mousePressed();
  popController.mousePressed();
}

void mouseReleased() { //executes on release
  for(int i=0; i<sliders.length; i++){
    sliders[i].mouseReleased();
  }
}

void mouseDragged() { //executes when cursor is dragged anywhere
  for(int i=0; i<sliders.length; i++){
    sliders[i].mouseDragged();
  }
}

void keyPressed() { //save screenshot of current output
  if(key == 's'){
     println("Saving...");
     save("output.png");
     println("Done saving");
  }
}

void toggleCentre() {
  if(spaceSystem.following){
    spaceSystem.following = false;
  } else {
    spaceSystem.following = true;
  }
}

void drawKey(){
  stroke(50);
  fill(190);
  rect(25, 490, 195, 200);
  
  textSize(32);
  fill(50);
  text("Key", 95, 530);
  textSize(14);
  line(50, 550, 195, 550);
  
  //draw spacial object
  stroke(0);
  fill(color(100));
  ellipse(60, 580, 10, 10);
  
  //draw COM
  line(50, 617, 70, 617);
  line(60, 627, 60, 607);
  
  //draw acceleration vector
  line(50, 650, 70, 670);
  
  //draw guide lines
  line(80, 580, 90, 580);
  line(80, 617, 90, 617);
  line(80, 657, 90, 657);
  
  //draw text
  fill(50);
  text("Star", 100, 585);
  text("Centre of Mass", 100, 622);
  text("Force Vector", 100, 662);
}

void drawInstructions() { //draws the instructions onto the canvas
  fill(50);
  textSize(16);
  
  text("Instructions: ", 890, 600);
  text("- Click 'Set Mass' to set the slider values", 890, 690);
  text("- Click 'Apply' to set a new number of stars", 890, 660);
  text("- Drag the sliders to modify the stars' masses", 890, 630);
  
  textSize(14);
}
