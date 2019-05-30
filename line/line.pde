void setup()
{

size(500, 100);;
background(255);
strokeWeight(5);
smooth();

/**************** 3.3.1 *****************/
// float xstep = 1;
// float ystep = 10;
// float lastx = -20;
// float lasty = -50;
// float ynoise = random(10);
// float y = 50;
// int borderx = 20;
// int bordery = 10;
// for (int x=borderx; x<= width-borderx; x+=xstep)
// {
//     y = 10 + noise(ynoise) * 80;
//     // ystep = random(20) - 10;
//     y += ystep;
//     // y = bordery + random(height - 2*bordery);
//     if (lastx > -999)
//     {
//         line(x, y, lastx, lasty);
//     }

//     lastx = x;
//     lasty = y;
//     ynoise += 0.03;
// }


/**************** 3.3.2 *****************/
// float xstep = 1;
// float lastx = -999;
// float lasty = -999;
// float angle = 0;
// float y = 50;
// for (int x=20; x<=480; x+=xstep)
// {
//     float rad = radians(angle);
//     y = 50 + (pow(cos(rad), 3)*noise(rad*2) * 40);
//     if (lastx > -999)
//     {
//         line(x, y, lastx, lasty);
//     }
//     lastx = x;
//     lasty = y;
//     angle++;
// }


/**************** 3.3.2 *****************/
float xstep = 1;
float lastx = -999;
float lasty = -999;
float angle = 0;
float y = 50;
for (int x=20; x<=480; x+=xstep)
{
    float rad = radians(angle);
    y = 20 + (customRandom() * 60);
    if (lastx > -999)
    {
        line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    angle++;
}
}

float customRandom()
{
    float retValue = 1 - pow(random(1), 5);
    return retValue;
}