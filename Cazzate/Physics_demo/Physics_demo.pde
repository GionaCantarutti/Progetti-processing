import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Box> boxes;
ArrayList<Mill> mills;

void setup() {
  
  size(800,800);
  smooth();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  box2d.setGravity(0,-20);
  
  boxes = new ArrayList<Box>();
  mills = new ArrayList<Mill>();
  
  Mill mill = new Mill(400,400, 10, 200, 10);
  Mill mill2 = new Mill(200, 400, 30, 300, 5);
  mills.add(mill);
  mills.add(mill2);
  
}

void draw() {
  
  background(255,255,255);

  box2d.step();
  
  if (mousePressed) {
   
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
    
  }
  
  for (Box b: boxes) {
    b.display();
  }
  for (Mill m: mills) {
    m.display();
  }


}
