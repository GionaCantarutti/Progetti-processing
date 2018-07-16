class Box  {

  float w,h;
  Body body;
  Vec2 center = new Vec2(0,0);
  
  Box(int x, int y) { 
    
    Vec2 cor = box2d.coordPixelsToWorld(x, y);
    
    w = 30;
    h = 30;
    
    PolygonShape ps = new PolygonShape();
    float boxW = box2d.scalarPixelsToWorld(w/2);
    float boxH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(boxW, boxH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 1;
    fd.restitution = 1;
    
    BodyDef bd = new BodyDef();
    
    bd.type = BodyType.DYNAMIC;
    bd.position.set(cor);
    
    body = box2d.createBody(bd);
    
    body.createFixture(fd);
    
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
    rect(0,0,30,30);
    popMatrix(); 
    
  }
  
  void killBody() {
   
    box2d.destroyBody(body);
    
  }
  
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    // Is it off the bottom of the screen?
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }
  
}
