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

void setup(){
  frameRate(60);
  size(1280, 720);
  Colour = color(100);
  buttonSetMass = new ButtonSetMass("Set Mass", 10, 10);
  buttonSetCentre = new ButtonSetCentre("Toggle Follow", 10, 40);
  buttonReset = new ButtonReset("Restart Scene  ", 10, 70);
  buttonApply = new ButtonReset("Apply", 1175, 32);
  buttonToggleName = new ButtonToggleName("Toggle Names", 10, 100);
  popController = new PopulationController(1060, 25);
  
  //moved to method for ability to call when reloading the scene
  systemSetup(); 
}

void systemSetup() {
  spaceSystem = new SpacialSystem(popController.getValue()); //create a new system with x number of stars
  
  sliders = new Slider[popController.getValue()];
  sliderValues = new float[popController.getValue()];
  for(int i=0; i<sliders.length; i++){
    sliders[i] = new Slider(75+40*i, 975, 1000, findName(i));
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
    sliders[i] = new Slider(75+40*i, 975, 1000, findName(i));
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
