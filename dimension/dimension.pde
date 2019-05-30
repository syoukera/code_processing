/********************** 5.1.1 **********************/
// size(300, 300);
// smooth();
// background(255);
// float xstart = random(10);
// float xnoise = xstart;
// float ynoise = random(10);

// for (int y = 0; y <= height; y+=1)
// {
//     ynoise += 0.01;
//     xnoise = xstart;
//     for (int x = 0; x <= width; x+=1)
//     {
//         xnoise += 0.01;
//         int alph = int(noise(xnoise, ynoise) * 255);
//         stroke(0, alph);
//         line(x, y, x+1, y+1);
//     }
// }

/********************** 5.1.1 **********************/
// float xstart, xnoise, ynoise;
// void setup()
// {
//     size(300, 300);
//     smooth();
//     background(0);
//     xstart = random(10);
//     xnoise = xstart;
//     ynoise = random(10);
//     for (int y = 0; y <= height; y += 5)
//     {
//         ynoise += 0.1;
//         xnoise = xstart;
//         for (int x = 0; x <= width; x+=5)
//         {
//             xnoise += 0.1;
//             drawPoint(x, y, noise(xnoise, ynoise));
//         }
//     }
// }

// void drawPoint(float x, float y, float noiseFactor)
// {
//     float len = 10 * noiseFactor;
//     rect(x, y, len, len);
// }

//  drawPoint(float x, float y, float noiseFactor)
// {
//     pushMatrix();
//     translate(x, y);
//     rotate(noiseFactor * radians(360));
//     stroke(0, 150);
//     line(0, 0, 20, 0);
//     popMatrix();
// }

// void drawPoint(float x, float y, float noiseFactor)
// {
//     pushMatrix();
//     translate(x, y);
//     rotate(noiseFactor * radians(540));
//     float edgeSize = noiseFactor * 35;
//     float grey = 150 + (noiseFactor * 120);
//     float alph = 150 + (noiseFactor * 120);
//     noStroke();
//     fill(grey, alph);
//     ellipse(0, 0, edgeSize, edgeSize/2);
//     popMatrix();
// }

/********************** 5.2 **********************/
// float xstart, xnoise, ystart, ynoise, xstartNoise, ystartNoise;
// void setup()
// {
//     size(300, 300);

//     smooth();
//     background(0);
//     frameRate(24);
//     xstartNoise = random(20);
//     ystartNoise = random(20);
//     xstart = random(10);
//     ystart = random(10);
// }
// void draw()
// {
//     background(255);

//     xstartNoise += 0.01;
//     ystartNoise += 0.01;
//     xstart += (noise(xstartNoise) * 0.5) - 0.25;
//     ystart += (noise(ystartNoise) * 0.5) - 0.25;

//     xnoise += xstart;
//     ynoise += ystart;
//     for (int y = 0; y <= height; y += 5)
//     {
//         ynoise += 0.1;
//         xnoise = xstart;
//         for (int x = 0; x <= width; x+=5)
//         {
//             xnoise += 0.1;
//             drawPoint(x, y, noise(xnoise, ynoise));
//         }
//     }
// }

// void drawPoint(float x, float y, float noiseFactor)
// {
//     pushMatrix();
//     translate(x, y);
//     rotate(noiseFactor * radians(540));
//     float edgeSize = noiseFactor * 35;
//     float grey = 150 + (noiseFactor * 120);
//     float alph = 150 + (noiseFactor * 120);
//     noStroke();
//     fill(grey, alph);
//     ellipse(0, 0, edgeSize, edgeSize/2);
//     popMatrix();
// }

// void drawPoint(float x, float y, float noiseFactor)
// {
//     pushMatrix();
//     translate(x, y);
//     rotate(noiseFactor * radians(360));
//     stroke(0, 150);
//     line(0, 0, 20, 0);
//     popMatrix();
// }

/********************** 5.3.1 **********************/
// import processing.opengl.*;

// void setup()
// {
//     size(500, 300, OPENGL);
//     sphereDetail(40);
//     noStroke();
//     fill(204);
// }

// void draw()
// {
//     background(0);
//     lights();
//     translate(width/2, height/2, mouseX);
//     sphere(100);
// }

/********************** 5.3.2 **********************/
// import processing.opengl.*;

float xstart, xnoise, ystart, ynoise, zstart, znoise;

int sideLength = 200;
int spacing = 5;

void setup()
{
    size(500, 300, P3D);
    background(0);
    noStroke();

    xstart = random(10);
    ystart = random(10);
    zstart = random(10);
}

void draw()
{
    background(0);

    xstart += 0.01;
    ystart += 0.01;
    zstart += 0.01;
    xnoise = xstart;
    ynoise = ystart;
    znoise = zstart;

    translate(150, 20, -150);
    rotateZ(frameCount * 0.1);
    rotateY(frameCount * 0.1);

    for (int z = 0; z <= sideLength; z += spacing)
    {
        znoise += 0.1;
        ynoise = ystart;

    for (int y = 0; y <= height; y += 5)
    {
        ynoise += 0.1;
        xnoise = xstart;
        for (int x = 0; x <= width; x += 5)
        {
            xnoise += 0.1;
            drawPoint(x, y, z, noise(xnoise, ynoise, znoise));
        }
    }
    }
}

void drawPoint(float x, float y, float z, float noiseFactor)
{
    pushMatrix();
    translate(x, y, z);
    float grey = noiseFactor * 255;
    fill(grey, 10);
    box(spacing, spacing, spacing);
    popMatrix();
}