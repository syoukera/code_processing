particle[] particles;
float A = 0.001;
float dt = 1;
float dirmeter = 10;

void setup()
{
    size(600, 600);
    background(0);
    
    particles = new particle[100];

    for (int i = 0; i < 100; ++i)
    {
        particles[i] = new particle(new PVector(random(600), random(600)), 
                                    new PVector(random(10)-5, random(10)-5),
                                    random(255), random(255), random(255), 255);
    }
}

void draw()
{
    background(0);
    noStroke();

    for (int i = 0; i < 100; ++i)
    {
        particles[i].updatePosition();
        particles[i].show();
    }
}

class particle
{
    PVector pos;
    PVector vel;
    color col;
    float r, g, b, alpha;

    particle(PVector myPosition, PVector myVelocity,
             float myRed, float myGreen, float myBlue, float myAlpha)
    {
        pos = myPosition;
        vel = myVelocity;
        r = myRed;
        g = myGreen;
        b = myBlue;
        alpha = myAlpha;
    }

    void show()
    {
        stroke(0);
        fill(color(r, g, b, alpha));
        ellipse(pos.x, pos.y, dirmeter, dirmeter);
    }

    void updatePosition()
    {
        vel.x += 2*A*(width/2-pos.x);
        vel.y += 2*A*(height/2-pos.y);
        pos.x = pos.x + dt*vel.x;
        pos.y = pos.y + dt*vel.y;
    }
}