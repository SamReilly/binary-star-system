PFont font;
PImage background;

SpacialBody body1;
SpacialBody body2;
Slider slider1;
Slider slider2;

color Colour;

void setup(){
  size(1280, 720);
  
  Colour = color(255, 0, 0);
  body1 = new SpacialBody(100, "Body1", Colour, 100, 100);
  body2 = new SpacialBody(100, "Body2", Colour, 100, 200);
  
  slider1 = new Slider(200, 200);
  slider2 = new Slider(100, 200);
}

void draw(){
  background(200);
  
  body1.display();
  body2.display();
  
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
