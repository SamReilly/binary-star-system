class ParticleController {
  public ArrayList<Particle> particleList;
  
  //constructor method
  public ParticleController(){
    this.particleList = new ArrayList<Particle>();
  }
  
  //method creates a new particle at selected position
  public void makeParticle(PVector position) {
    particleList.add(new Particle(position, 80)); //add a new particle with life span of 80 frames
  }
  
  public void draw() {
    //verify then draw all the particles in the list
    for(int i=0; i<particleList.size(); i++){
      if(particleList.get(i).registerFrame()){
        //register a passing frame, if returns true then delete the particle
        particleList.remove(i);
      }
    }
    
    for(int i=0; i<particleList.size(); i++){
      particleList.get(i).draw();
    }
  }
}
