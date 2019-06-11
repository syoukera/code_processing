import java.util.Iterator;

final int PARTICLE_START_FORCE = 1;
final int ELECTRIC_FORCE = 5;
final int PARTICLE_MAX_VEL = 20; ///7;//4;
final int PARTICLE_MAX_ACC = 10; // Max particle acceleration
final int PARTICLE_MAX_SIZE = 100;
final int SPAWN_COUNT = 2; // Number of particles to spawn at once
final float LIFESPAN_DECREMENT = 2.0;
final int START_SIZE = 50;//100;//175;
final int SHRINK_RATE = 19;//2;//5;
final int MAX_PARTICLES = 100;
final int SPAWN_DELAY = 50; //ms

boolean displayColour = true;
int time = millis();

ParticleSystem system = new ParticleSystem();
ColourGenerator colour = new ColourGenerator();

void setup()
{
//   fullScreen();
  size(1200, 1200);
  background(0);
  frameRate(60);
}

void draw() 
{
	background(0);
  // Update our particle system each frame
  system.update();
}

void mouseDragged()
{
  if (millis() > time + SPAWN_DELAY) {
    system.addParticle(new PVector(mouseX, mouseY));
    time = millis();
  }
}

void keyPressed() 
{
  
  switch (key) {
    case 'r':
      background(0);
      break;
    default:  
      displayColour = !displayColour;  
  }
}

class ParticleSystem
{
  ArrayList<Particle> particles = new ArrayList<Particle>();
  int count = 0;
  
  ParticleSystem() { }
  
  void addParticle(PVector loc)
  {
    count++;
    
    if (particles.size() + SPAWN_COUNT < MAX_PARTICLES) {
      for (int i = 0; i < SPAWN_COUNT; i++) {
        particles.add(new Particle(loc));
      }
    }
  }
  
  void update()
  {
    // Use an iterator to loop through active particles
    Iterator<Particle> i = particles.iterator();
    
    while(i.hasNext()) {
      // Get next particle
      Particle p = i.next();
      
      // update position and lifespan
      p.update();
      
      // Remove particle if dead
      if (p.isDead()) {
        i.remove();
        count--;
      } else {
        p.display();
      }
    }
  }
}

class Particle
{
  PVector loc;
  PVector vel;
  PVector acc;
  float xnoise = random(10);
  float ynoise = random(10);
  
  int size = START_SIZE;
  float angle;

  //ColourGenerator colour = new ColourGenerator();
  
  Particle(PVector loc2) 
  {
    loc = new PVector(loc2.x, loc2.y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void update()
  {
    // Work out force 
    acc.x = ELECTRIC_FORCE + random(-10, 10);
    acc.y = random(-10, 10);

    vel.add(acc);
    vel.limit(PARTICLE_MAX_VEL);
    loc.add(vel);

    // Wrap around screen
    if (loc.x > width)
      loc.x -= width;
     if (loc.x < 0)
       loc.x += width;
     if(loc.y > height)
       loc.y -= height;
     if(loc.y < 0)
       loc.y += height;
       
      //  size += radiusRate;
  }
  
  void display() 
  {
		 noStroke();
     if (displayColour) {
       //colour = new ColourGenerator();
         colour.update();
        fill(colour.R, colour.G, colour.B);
     } else {
         fill(255);
     }
     ellipse(loc.x + noise(xnoise)*30, loc.y + noise(ynoise)*100, size, size);
     xnoise += 0.1;
     ynoise += 0.1;
  }
  
  boolean isDead()
  {
    if (size < 0) {
      return true;
    } else {
      return false;
    }
  }
}

class ColourGenerator
{
  final static float MIN_SPEED = 0.2;
  final static float MAX_SPEED = 1.3;
  float R, G, B;
  float Rspeed, Gspeed, Bspeed;
  
  ColourGenerator()
  {
    init();  
  }
  
  public void init()
  {
    // Starting colour
    R = random(255);
    G = random(255);
    B = random(255);
    
    // Starting transition speed
    Rspeed = (random(1) > 0.5 ? 1 : -1) * random(MIN_SPEED, MAX_SPEED);
    Gspeed = (random(1) > 0.5 ? 1 : -1) * random(MIN_SPEED, MAX_SPEED);
    Bspeed = (random(1) > 0.5 ? 1 : -1) * random(MIN_SPEED, MAX_SPEED);
  }
  
  public void update()
  {
    // Use transition to alter original colour (Keep within RGB bounds)
    // Rspeed = ((R += Rspeed) > 255 || (R < 0)) ? -Rspeed : Rspeed;
    // Gspeed = ((G += Gspeed) > 255 || (G < 0)) ? -Gspeed : Gspeed;
    // Bspeed = ((B += Bspeed) > 255 || (B < 0)) ? -Bspeed : Bspeed;
  }
  
}