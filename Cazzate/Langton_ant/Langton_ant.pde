// {red, green, blue, direction change, steps}
int[][] BW = {{255,255,255, -1, +1} , {0,0,0, +1, +1}};
int[][] RGB = {{255, 0, 0, +1, +1}, {0, 255, 0, +1, -1}, {0, 0, 255, -1, +1}};
int[][] REDBLUE = {{250, 0, 0, +1, +2}, {175, 0, 75, +1, +1}, {100, 0, 100, 0, 0}, {75, 0, 175, -1, +1}, {0, 0, 250, -1, +2}};
int[][] HEATMAP400 = heatMap(400);
int[][] HEATMAP32 = heatMap(32);
int[][] SMOOTH400 = smoothHeatMap(400);
int[][] SMOOTH32 = smoothHeatMap(32);

int[][] grid = new int[800][800];

int[][] tiles = SMOOTH400;

int UPANT = 0;
int RIGHTANT = 1;
int DOWNANT = 2;
int LEFTANT = 3;

int x = 400;
int y = 400;
int dir = UPANT;

void moveDir(int s) {
 
  grid[x][y]++;
  if (grid[x][y] == tiles.length) {
    grid[x][y] = 0;
  }
  stroke(tiles[grid[x][y]][0], tiles[grid[x][y]][1], tiles[grid[x][y]][2]);
  point(x, y);
  
  if (dir == UPANT) {
    y -= s;
  } else if (dir == LEFTANT) {
    x -= s;
  } else if (dir == DOWNANT) {
    y += s;
  } else if (dir == RIGHTANT) {
    x += s;
  }
  
  while (x >= width) {
    x -= width;
  }
  while (y >= height) {
    y -= height;
  }
  while (x < 0) {
    x += width;
  }
  while (y < 0) {
    y += height;
  }
  
}

void step() {
  
  dir += tiles[grid[x][y]][3];
  while (dir > LEFTANT) {
    dir -= 4;
  }
  while (dir < UPANT) {
    dir += 4;
  }
  moveDir(tiles[grid[x][y]][4]);
  
}

int[][] heatMap(int depth) {
 
  int[][] out = new int[2*depth][5];
  
  for(int i = -depth; i < depth; i++) {
    
    float c;
    
    if (i == 0) { c = 0; } else {
    c = ((float)i/(float)depth)*255; 
    }
  
  //c, 0, 255 - c, -1, +i
  
    out[i + depth][0] = (int)c;
    out[i + depth][1] = 0;
    out[i + depth][2] = 255 - (int)c;
    out[i + depth][3] = (int)Math.signum(i);
    out[i + depth][4] = i;
    
  }
  
  return out;
  
}

int[][] smoothHeatMap(int depth) {
 
  int[][] out = new int[4*depth][5];
  
  for(int i = -depth; i < depth; i++) {
    
    float c;
    
    if (i == 0) { c = 0; } else {
    c = ((float)i/(float)depth)*255; 
    }
  
  //c, 0, 255 - c, -1, +i
  
    out[i + depth][0] = (int)c;
    out[i + depth][1] = 0;
    out[i + depth][2] = 255 - (int)c;
    out[i + depth][3] = (int)Math.signum(i);
    out[i + depth][4] = i;
    
  }
  
  for(int i = 0; i < 2*depth; i++) {
  
  //c, 0, 255 - c, -1, +i
  
    out[2*depth + i] = out[2*depth - i];
    
  }
  
  return out;
  
}

int[][] blueMistake(int depth) {
 
  int[][] out = new int[2*depth][5];
  
  for(int i = -depth; i < depth; i++) {
    
    int c;
    
    if (i == 0) { c = 0; } else {
    c = (int)((float)i/(float)depth)*255; 
    }
  
  //c, 0, 255 - c, -1, +i
  
    out[i + depth][0] = c;
    out[i + depth][1] = 0;
    out[i + depth][2] = 255 - c;
    out[i + depth][3] = -1;
    out[i + depth][4] = i;
    
  }
  
  return out;
  
}


void setup() {
  
  size(800, 800);
  
  background(255, 255, 255);
  
}

void draw() {
  
  for (int i = 0; i < 10000; i++) {
   step(); 
  }
  
  System.out.println(frameRate);
  
}
