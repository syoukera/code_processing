particle[] particles;

void setup()
{
    size(600, 600);
    background(0);
}

void draw()
{
    noStroke();
    fill(132, 23, 234);
    ellipse(mouseX, mouseY, 30, 30);
    particles = new particle[100];

    for (int i = 0; i < 100; ++i)
    {
        particles[i] = new particle(new PVector(random(600), random(600)));
        particles[i].show();
    }
}

class particle
{
    PVector pos;
    // PVector velocity;

    particle(PVector myPosition)
    {
        pos = myPosition;
    }

    void show()
    {
        stroke(0);
        fill(random(255), random(255), random(255));
        ellipse(pos.x, pos.y, 3, 3);
    }
}