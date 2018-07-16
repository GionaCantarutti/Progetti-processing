  public static double l1 = 200;
  public static double l2 = 300;
  
  public static double m1 = 40;
  public static double m2 = 40;
  
  public static double g = 1;
  
  public static double[] data = {Math.PI, Math.PI + 0.00001, 0, 0, 0, 0, 0, 0, 0, 0};
  
  public static int x0 = 400;
  public static int y0 = 400;
  
  public static double maxVel = g * Math.sqrt((2 * (1*l2 + 2*l2))/g);


public static double[] doubleP(double[] data) {
  
  double ang1 = data[0];
  double ang2 = data[1];
  
  double vel1 = data[2];
  double vel2 = data[3];
  
  double acc1 = data[4];
  double acc2 = data[5];
  
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
 
  size(800,800);
  
  background(0, 0, 0);

}

void draw() {
  
  background(255,255,255);
  
  float x1 = (float) (data[6] + x0);
  float y1 = (float) (data[7] + y0);
  
  float x2 = (float) (data[8] + x0);
  float y2 = (float) (data[9] + y0);
  
  stroke(255, 0, 100);
  
  line((float) x0, (float) y0, x1, y1);
  line((float) x1, (float) y1, x2, y2);
  
  int red = (int) (((x2 - x0 + l1 + l2)*255) / (2*l1 + 2*l2));
  int green = (int) (((y2 - y0 + l1 + l2)*255) / (2*l1 + 2*l2));
  int blue = (int) ((data[3] * 255) / maxVel);
  
  fill(red, green, blue);
  stroke(red, green, blue);
  
  
  rect(50, 50, 50, 50);
  
  data = doubleP(data);
  
}
