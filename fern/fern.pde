float x = 0.5;
float y = 0;

void setup()
{
  size(600, 600);
  smooth();
  frameRate(30);
  background(0);
  stroke(255);
  ellipse(x, y, 1, 1);
}

void draw()
{
    float r = random(1);
    // write fern
    if (mousePressed)
      boolean b = true;

    if (b)
    {
    if (r < 0.02) {
        x = 0.5;
        y = 0.27*y;
    } else if (r < 0.17) {
        x = -0.139*x + 0.263*y + 0.57;
        y = 0.246*x + 0.224*y - 0.036;
    } else if (r < 0.30) {
        x = 0.17*x - 0.215*y + 0.408;
        y = 0.222*x + 0.176*y + 0.0893;
    } else {
        x = 0.781*x + 0.034*y + 0.1075;
        y = -0.032*x + 0.739*y + 0.27;
    }
    stroke(255);
    ellipse(600*(1-x), 600*(1-y), 1, 1);

    // // write wood
    // if (r < 0.10) {
    //     x = 0.05;
    //     y = 0.6*y;
    // } else if (r < 0.20) {
    //     x = -0.05*x;
    //     y = -0.5*y + 1.0;
    // } else if (r < 0.40) {
    //     x = 0.46*x - 0.15*y;
    //     y = 0.39*x + 0.38*y + 0.6;
    // } else if (r < 0.60) {
    //     x = 0.47*x - 0.15*y;
    //     y = 0.17*x + 0.42*y + 1.1;
    // } else if (r < 0.80) {
    //     x = 0.43*x + 0.28*y;
    //     y = -0.25*x + 0.45*y + 1.0;
    // } else {
    //     x = 0.42*x + 0.26*y;
    //     y = -0.35*x + 0.31*y + 0.7;
    // }

    // stroke(255);
    // ellipse(300*(1-x), 300*(2-y), 1, 1);

    // saveFrame("framse/######.tif");
    }
}
