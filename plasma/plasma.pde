float _ax = 1;
float _ay = 0;
float _threshold_I = 5;
float _threshold_A = 100;
float _meanFreePath = 30;

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
    background(0);
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
    float x, y, u, v;
    float path;

    Electron(float tempx, float tempy, float tempu, float tempv)
    {
        x = tempx;
        y = tempy;
        u = tempu;
        v = tempv;
    }

    void update()
    {
        path += sqrt(u*u + v*v);

        u += _ax;
        v += _ay;
        x += u;
        if (x > width) { x = x%width; }
        y += v;
        if (y > height) { y = y%height; }

        if (path + random(3) > _meanFreePath)
        {
            ionization();
            path = 0;
        }
    }

    void ionization()
    {
        float normv = sqrt(u*u + v*v);
        if (normv > _threshold_I)
        {
            u = random(10) - 5;
            v = random(10) - 5;
            Electron newElectron = new Electron(x, y, random(10) - 5, random(10) - 5);
            _electronArr = (Electron[])append(_electronArr, newElectron);
        }
    }

    void attachment()
    {
        
    }

    void showMe()
    {
        noStroke();
        fill(255);
        ellipse(x, y, 3, 3);
    }
}

// class Ion
// {
//     float x, y, u, v;

//     Plasma(float tempx, float tempy)
//     {
//         x = tempx;
//         y = tempy;
//         u = 0;
//         v = 0;
//     }

//     void update()
//     {
//         u += _ax;
//         v += _ay;
//         x += u;
//         if (x > width) { x = x%width; }
//         y += v;
//         if (y > height) { y = y%height; }
//     }

//     void showMe()
//     {
//         noStroke();
//         fill(255);
//         ellipse(x, y, 3, 3);
//     }
// }
