class Particle {
  
  private int frameLifeSpan;
  private int framesLeft;
  private PVector position;
  
  public Particle(PVector position, int frameLifeSpan){
    this.position = position;
    this.frameLifeSpan = frameLifeSpan;
    this.framesLeft = frameLifeSpan;
  }
  
  //register a passing frame, reduces the framesLeft by 1 and returns true if the particle has expired
  public boolean registerFrame() {
    framesLeft -= 1;
    if(framesLeft <= 0){
      return true;
    } else {
      return false;
    }
  }
  
  public void draw() {
    stroke(150);
    fill(color(150));
    float d = 6*((float)framesLeft/(float)frameLifeSpan);
    ellipse(position.x, position.y, d, d);
  }
}
