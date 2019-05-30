/********************* 4.1 ***********************/
// void setup()
// {
//     size(500, 300);
//     background(255);
//     strokeWeight(5);
//     smooth();

//     float radius = 100;
//     int centx = 250;
//     int centy = 150;

//     stroke(0, 30);
//     noFill();
//     ellipse(centx, centy, radius*2, radius*2);
//     stroke(20, 50, 700);
//     strokeWeight(1);

//     float x, y;
//     float noiseval = random(10);
//     float radVariance, thisRadius, rad;
//     beginShape();
//     fill(20, 50, 70, 50);
//     for (float ang = 0; ang <= 360; ang += 1)
//     {
//         noiseval += 0.1;
//         radVariance = 30 * customNoise(noiseval);

//         thisRadius = radius + radVariance;
//         rad = radians(ang);
//         x = centx + (thisRadius * cos(rad));
//         y = centy + (thisRadius * sin(rad));

//         curveVertex(x, y);
//     }
//     endShape();
// }

// float customNoise(float value)
// {
//     int count = int((value % 12));
//     float retValue = pow(sin(value), count);
//     return retValue;
// }

/********************* 4.2 ***********************/
float _angnoise, _radiusnoise;
float _xnoise, _ynoise;
float _angle = -PI/2;
float _radius;
float _strokeCol = 254;
int _strokeChange = 01;

void setup()
{
    size(500, 300);
    smooth();
    frameRate(30);
    background(255);
    noFill();

    _angnoise = random(10);
    _radiusnoise = random(10);
    _xnoise = random(10);
    _ynoise = random(10);
}

void draw()
{
    _radiusnoise += 0.005;
    _radius = (noise(_radiusnoise) * 550) + 1;
    
    _angnoise += 0.005;
    _angle += (noise(_angnoise) * 6) - 3;
    if (_angle > 360) { _angle -= 360; }
    if (_angle < 0) { _angle += 360; }

    _xnoise += 0.01;
    _ynoise += 0.01;
    float centerx = width/2 + (noise(_xnoise) * 100) - 50;
    float centery = height/2 + (noise(_ynoise) * 100) - 60;

    float rad = radians(_angle);
    float x1 = centerx + (_radius * cos(rad));
    float y1 = centery + (_radius * sin(rad));
    float opprad = rad + PI;
    float x2 = centerx + (_radius * cos(opprad));
    float y2 = centery + (_radius * sin(opprad));

    _strokeCol += _strokeChange;
    if (_strokeCol > 254) { _strokeChange = -1; }
    if (_strokeCol < 0) { _strokeChange = 1; }
    stroke(_strokeCol, 60);
    strokeWeight(1);
    line(x1, y1, x2, y2);
}