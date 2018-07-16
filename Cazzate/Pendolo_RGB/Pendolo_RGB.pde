  public static double l1 = 200;
  public static double l2 = 200;
  
  public static double m1 = 40;
  public static double m2 = 40;
  
  public static double g = 1;
  
  public static int x0 = 157;
  public static int y0 = 157;
  
  public static double maxVel = g * Math.sqrt((2 * (1*l2 + 2*l2))/g);


public static double[] doubleP(double[] data) {
  
  double ang1 = data[0];
  double ang2 = data[1];
  
  double vel1 = data[2];
  double vel2 = data[3];
  
  double[] out = new double[10];
  
  double a = -g * (2*m1 + m2) * Math.sin(ang1);
  double b = -m2 * g * Math.sin(ang1 - 2*ang2);
  double c = -2 * Math.sin(ang1 -ang2) * m2;
  double d = vel2*vel2*l2 + vel1*vel1*l1*Math.cos(ang1 - ang2);
  double e = l1 * (2 * m1 + m2 - m2*Math.cos(2 * ang1 - 2 * ang2));
  
  out[4] = (a + b + c * d)/e;
  
  a = 2 * Math.sin(ang1 - ang2);
  b = (vel1 * vel1 * l1 * (m1 + m2));
  c = g * (m1 + m2) * Math.cos(ang1);
  d = vel2 * vel2 * l2 * m2 * Math.cos(ang1 - ang2);
  e = l2 * (2 * m1 + m2 - m2*Math.cos(2 * ang1 - 2 * ang2));
  
  out[5] = (a * (b + c + d)) / e;
  
  out[6] = l1 * Math.sin(ang1);
  out[7] = l1 * Math.cos(ang1);
  
  out[8] = out[6] + l2 * Math.sin(ang2);
  out[9] = out[7] + l2 * Math.cos(ang2);
  
  out[2] = vel1 + out[4];
  out[3] = vel2 + out[5];
  
  out[0] = ang1 + out[2];
  out[1] = ang2 + out[3];
  
  return out;
  
}

void setup() {
 
  size(314,314);
  
  background(0, 0, 0);
  
  for(int i = 0; i < 800; i++) {
    for(int j = 0; j < 800; j++) {
      
      Matrix[i][j][0] = Math.PI - (double)i/100.0;
      Matrix[i][j][1] = Math.PI - (double)j/100.0;
      
    }
  }

}

public static double[][][] Matrix = new double[800][800][10];

void draw() {
  
  background(255,255,255);
  
  for(int i = 0; i < 314; i++) {
    for(int j = 0; j < 314; j++) {
      
      float x1 = (float) (Matrix[i][j][6] + x0);
      float y1 = (float) (Matrix[i][j][7] + y0);
  
      float x2 = (float) (Matrix[i][j][8] + x0);
      float y2 = (float) (Matrix[i][j][9] + y0);
  
      int red = (int) (((x2 - x0 + l1 + l2)*255) / (2*l1 + 2*l2));
      int green = (int) (((y2 - y0 + l1 + l2)*255) / (2*l1 + 2*l2));
      int blue = (int) ((Matrix[i][j][3] * 255) / maxVel);
      
      stroke(red, green, blue);
      point(i,j);
      
      Matrix[i][j] = doubleP(Matrix[i][j]);
      
    }
  }
  
  System.out.println(frameCount);
  
}
