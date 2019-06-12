import java.util.ArrayList;
import java.util.Iterator;

ArrayList<Electron> Electrons = new ArrayList<Electron>();

void setup()
{
    size(1200, 700);
    // ArrayList<Electron> Electrons = new ArrayList<Electron>();
    // Electron ele = new Electron(new PVector(width/2, height/2), new PVector(1, 1), new PVector(0, 0));
    // ele.update();
    // ele.showMe();
}

void draw()
{
    background(25, 25, 112);
    Electrons.add(new Electron(new PVector(random(width), random(height)),  
                               new PVector(random(10) - 5, random(10) - 5), 
                               new PVector(random(1) - 0.5, random(1) - 0.5)));

    // PVector loc = new PVector(width/2, height/2);  
    // PVector vel = new PVector(2, 2); 
    // PVector acc = new PVector(0, 0);
    
    // Electrons.add(new Electron(loc, vel, acc));

    Iterator<Electron> itr = Electrons.iterator();
    while(itr.hasNext())
    {
        Electron e = itr.next();
        e.update();
        e.showMe();
    }
}

class Electron
{
    PVector loc;
    PVector vel;
    PVector acc;

    Electron(PVector tempLoc, PVector tempVel, PVector tempAcc)
    {
        loc = tempLoc;
        vel = tempVel;
        acc = tempAcc;
    }

    void update()
    {
        vel.add(acc);
        loc.add(vel);
    }

    void showMe()
    {
        fill(255);
        ellipse(loc.x, loc.y, 10, 10);
    }
}