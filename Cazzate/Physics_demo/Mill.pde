class Mill {

  float x,y;
  float w,h;
  float speed;
  
  Body body;
  
  Mill(float x_, float y_, float w_, float h_, float s_) {
   
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    speed = s_;
    
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    bd.type = BodyType.KINEMATIC;
    
    bd.bullet = true;
    
    body = box2d.createBody(bd);
    
    body.setAngularVelocity(speed);
    
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    PolygonShape ps = new PolygonShape();
    ps.setAsBox(box2dW, box2dH);
    
    PolygonShape ps2 = new PolygonShape();
    ps2.setAsBox(box2dH, box2dW);
    
    body.createFixture(ps, 1);
    body.createFixture(ps2, 1);
    
    
  }
  
  void display() {
   
    Vec2 boxPos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
  
    pushMatrix();
    translate(boxPos.x, boxPos.y);
    rotate(-a);
  
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    rect(0,0,h,w);
    popMatrix(); 
    
  }
  
}
