Cell[][] _cellArray;
int _cellSize = 10;
int _numX, _numY;

void setup()
{
    size(500, 300);
    _numX = floor(width/_cellSize);
    _numY = floor(height/_cellSize);
    restart();   
}

void restart()
{
    _cellArray = new Cell[_numX][_numY];
    for (int x = 0; x < _numX; x++)
    {
        for (int y = 0; y < _numY; y++)
        {
            Cell newCell = new Cell(x, y);
            _cellArray[x][y] = newCell;
        }
    }

    for (int x = 0; x < _numX; x++)
    {
        for (int y = 0; y < _numY; y++)
        {
            int above = y-1;
            int below = y+1;
            int left = x-1;
            int right = x+1;

            if (above < 0) { above = _numY-1; }
            if (below == _numY) { below = 0; }
            if (left < 0) { left = _numX-1; }
            if (right == _numX) { right = 0; }

            _cellArray[x][y].addNeighbour(_cellArray[left][above]);
            _cellArray[x][y].addNeighbour(_cellArray[left][y]);
            _cellArray[x][y].addNeighbour(_cellArray[left][below]);
            _cellArray[x][y].addNeighbour(_cellArray[x][above]);
            _cellArray[x][y].addNeighbour(_cellArray[x][below]);
            _cellArray[x][y].addNeighbour(_cellArray[right][above]);
            _cellArray[x][y].addNeighbour(_cellArray[right][y]);
            _cellArray[x][y].addNeighbour(_cellArray[right][below]);
        }
    }
}

void draw()
{
    background(200);

    for (int x = 0; x < _numX; x++)
    {
        for (int y = 0; y < _numY; y++)
        {
            _cellArray[x][y].calcNextState();
        }
    }

    translate(_cellSize/2, _cellSize/2);

    for (int x = 0; x < _numX; x++)
    {
        for (int y = 0; y < _numY; y++)
        {
            _cellArray[x][y].drawMe();
        }
    }
}

void mousePressed()
{
    restart();
}

class Cell{
    float x, y;
    // 7.1.2 and 7.1.3
    // boolean state;
    // boolean nextState;

    // 7.1.4
    int state;
    int nextState;

    Cell[] neighbours;

    Cell(float ex, float why)
    {
        x = ex * _cellSize;
        y = why * _cellSize;

        // 7.1.2 and 7.1.3
        // if (random(2) > 1) {
        //     nextState = true;
        // } else {
        //     nextState = false;
        // }

        // 7.1.4
        nextState = int(random(2));
        
        state = nextState;
        neighbours = new Cell[0];
    }

    void addNeighbour(Cell cell)
    {
        neighbours = (Cell[])append(neighbours, cell);
    }

/************************* 7.1.2 *************************/
    // void calcNextState()
    // {
    //     int liveCount = 0;
    //     for (int i = 0; i < neighbours.length; i++)
    //     {
    //         if (neighbours[i].state == true) {
    //             liveCount++;
    //         }
    //     }

    //     if (state == true) {
    //         if ((liveCount == 2) || (liveCount == 3)) {
    //             nextState = true;
    //         } else {
    //             nextState = false;
    //         }
    //     } else {
    //         if (liveCount == 3) {
    //             nextState = true;
    //         } else {
    //             nextState = false;
    //         }
    //     }
    // }
/************************* 7.1.2 *************************/

/************************* 7.1.3 *************************/
// void calcNextState()
// {
//     int liveCount = 0;
//     if (state) { liveCount++; }
//     for (int i = 0; i < neighbours.length; i++)
//     {
//         if (neighbours[i].state == true) {
//             liveCount++;
//         }
//     }

//     if (liveCount <= 4) {
//         nextState = false;
//     } else if (liveCount > 4) {
//         nextState = true;
//     }

//     if ((liveCount == 4) || (liveCount == 5)) {
//         nextState = !nextState;
//     }
// }
/************************* 7.1.3 *************************/

/************************* 7.1.4 *************************/
void calcNextState()
{
    if (state == 0) {
        int firingCount = 0;
        for (int i = 0; i < neighbours.length; i++)
        {
            if (neighbours[i].state == 1) {
                firingCount++;
            }
        }
        if (firingCount == 2) {
            nextState = 1;
        } else {
            nextState = state;
        }
    } else if (state == 1) {
        nextState = 2;
    } else if (state == 2) {
        nextState = 0;
    }
}
/************************* 7.1.4 *************************/

/************************* 7.1.2-3 *************************/
//     void drawMe()
//     {
//         state = nextState;
//         stroke(0);
//         if (state == true) {
//             fill(0);
//         } else {
//             fill(255);
//         }
//         ellipse(x, y, _cellSize, _cellSize);
//     }
// }
/************************* 7.1.2-3 *************************/

/************************* 7.1.4 *************************/
    void drawMe()
    {
        state = nextState;
        stroke(0);
        if (state == 1) {
            fill(0);
        } else if (state == 2) {
            fill(150);
        } else {
            fill(255);
        }
        ellipse(x, y, _cellSize, _cellSize);
    }
}
/************************* 7.1.4 *************************/