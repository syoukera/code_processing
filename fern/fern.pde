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
}
