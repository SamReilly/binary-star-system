//global objects
PFont font;
PImage background;
Slider slider1;
Slider slider2;
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
  
  slider1 = new Slider(25, 975);
  slider2 = new Slider(65, 975);
}

void draw(){
  background(200);
  
  spaceSystem.display();
  
  slider1.display();
  slider2.display();
}

void mousePressed() { //executes on click
  slider1.mousePressed();
  slider2.mousePressed();
}

void mouseReleased() { //executes on release
  slider1.mouseReleased();
  slider2.mouseReleased();
}

void mouseDragged() { //executes when cursor is dragged anywhere
  slider1.mouseDragged();
  slider2.mouseDragged();
}

void keyPressed() { //save screenshot of current output
  if(key == 's'){
     println("Saving...");
     save("output.png");
     println("Done saving");
  }
}
