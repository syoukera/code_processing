float _ax = 1;
float _ay = 0;
float _threshold_I = 50;
float _threshold_R = 50;
float _velocityAfterCollision = 3;
float _maximumElectronNumber = 1e2;

Electron[] _electronArr = {};

void setup()
{
    size(1024, 512);
    background(0);
    Electron firstElectron = new Electron(0, height/2, 0, 0);
    _electronArr = (Electron[])append(_electronArr, firstElectron);

}

void draw()
{
    background(24);
    for (int i = 0; i < _electronArr.length; ++i)
    {
        _electronArr[i].update();
        _electronArr[i].showMe();
    }

    // saveFrame("frames/####.png");
    // ffmpeg -y -r 20 -pattern_type glob -i "./frames/*.png" -an -pix_fmt yuv420p -vcodec h264 -profile:v baseline ionization.mp4
}

class Electron
{
    float x, y, u, v, energy;
    boolean is_shown;

    Electron(float tempx, float tempy, float tempu, float tempv)
    {
        x = tempx;
        y = tempy;
        u = tempu;
        v = tempv;
        energy = sqrt(u*u + v*v);
        is_shown = true;
    }

    void update()
    {
        u += _ax;
        v += _ay;
        x += u;
        if (x > width) { x = x%width; }
        y += v;
        if (y > height) { y = y%height; }

        energy = sqrt(u*u + v*v);
        if (energy + random(30) > _threshold_I)
        {
            if (_electronArr.length < _maximumElectronNumber)
            {
                ionization();
            }
        }
        if (energy + random(20) > _threshold_R) {
            recombination();
        }
    }

    void ionization()
    {
        {
            u = random(_velocityAfterCollision*2) - _velocityAfterCollision;
            v = random(_velocityAfterCollision*2) - _velocityAfterCollision;
            float newu = random(_velocityAfterCollision*2) - _velocityAfterCollision;
            float newv = random(_velocityAfterCollision*2) - _velocityAfterCollision;
            Electron newElectron = new Electron(x, y, newu, newv);
            _electronArr = (Electron[])append(_electronArr, newElectron);
        }
    }

    void recombination()
    {
        is_shown = false;
    }

    void showMe()
    {
        noStroke();
        float col = constrain(energy*5, 0, 255);
        fill(col, 100, 100);
        if (is_shown)
        {
            ellipse(x, y, 10, 10);
        }
    }
}