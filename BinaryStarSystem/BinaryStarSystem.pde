//global objects
PFont font;
PImage background;
Slider[] sliders;
SpacialSystem spaceSystem;
color Colour;

int numberOfStars = 2;

void setup(){
  size(1280, 720);
  
  //moved to method for ability to call when reloading the scene
  systemSetup(); 
}

void systemSetup() {
  Colour = color(255, 0, 0);
  spaceSystem = new SpacialSystem(numberOfStars); //create a new system with 
  
  sliders = new Slider[numberOfStars];
  for(int i=0; i<sliders.length; i++){
    sliders[i] = new Slider(25+40*i, 975);
  }
}

void draw(){
  background(200);
  
  spaceSystem.display();
  
  for(int i=0; i<sliders.length; i++){
    sliders[i].display();
  }
}

void mousePressed() { //executes on click
  for(int i=0; i<sliders.length; i++){
    sliders[i].mousePressed();
  }
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
