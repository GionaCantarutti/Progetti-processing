import java.util.Stack;

public void spread(int x,int y) {
  
  double N; double E; double S; double W;
  boolean Nb = false; boolean Eb = false; boolean Sb = false; boolean Wb = false;
  int[] Nc = {x, y-1}; int[] Ec = {x+1, y}; int[] Sc = {x, y+1}; int[] Wc = {x-1, y};
  
  if (y > 0) {
    N = grid[x][y-1];
  } else {
    N = 0;
    Nb = true;
  }
  
  if (x < width-1) {
    E = grid[x+1][y];
  } else {
    E = 0;
    Eb = true;
  }
  
  if (y < height-1) {
    S = grid[x][y+1];
  } else {
    S = 0;
    Sb = true;
  }
  
  if (x > 0) {
    W = grid[x-1][y];
  } else {
    W = 0;
    Wb = true;
  }
  
  double C = grid[x][y];
  
  double sum = N + S + W + E + C;
  double Np = 1.0/((double)N/(double)(sum - C));
  double Ep = 1.0/((double)E/(double)(sum - C));
  double Sp = 1.0/((double)S/(double)(sum - C));
  double Wp = 1.0/((double)W/(double)(sum - C));
  double Cp = (double)C/(double)sum;
  
  if (C > N && C > S && C > W && C > E) {
    
//    System.out.println("yeah");
  
    double Ex = ((Cp-(1-Cp))*C)*spread;
    C = C - Ex;
    N = N + Ex*Np;
    System.out.println(Np);
    S = S + Ex*Sp;
    E = E + Ex*Ep;
    W = W + Ex*Wp;
    
    grid[x][y] = C;
  
    if (!Nb) {
      grid[x][y-1] = N;
      stack.push(Nc);
//    System.out.println(stack.peek());
    } 
    if (!Sb) {
      grid[x][y+1] = S;
      stack.push(Sc);
    }
    if (!Eb) {
      grid[x+1][y] = E;
      stack.push(Ec);
    }
    if (!Wb) {
      grid[x-1][y] = W;
      stack.push(Wc);
    }
    
  }
  
  
}

Stack<int[]> stack = new Stack<int[]>();

void setup() {
  size(700,700);
  
  for (int i = 0; i < 700; i++) {
    for (int j = 0; j < 700; j++) {
      grid[i][j] = 1;
    }
  }
  
  grid[350][350] = 255;
  int[] a = {350, 350};
  stack.push(a);
  
  background(0,0,0);
}

int strenght = 255;
double spread = 1;
double[][] grid = new double[700][700];


void draw() {
  
  while (!stack.empty()) {
   int[] a = stack.pop();
   spread(a[0],a[1]);
   float c = (float)grid[a[0]][a[1]];
   stroke(c, c, c);
   point(a[0],a[1]);
   
//   System.out.println(grid[a[0]][a[1]]);
  }
  
//  System.out.println(frameRate);
  
}
