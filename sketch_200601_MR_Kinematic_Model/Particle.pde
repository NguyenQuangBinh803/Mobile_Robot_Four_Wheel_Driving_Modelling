class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Particle(PVector l) {
    location = l.get();
    acceleration = new PVector();
    velocity = new PVector();
    float angle;
  }
  PVector get_position() {
    return location;
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  void update_velocity(PVector target ) {
    //PVector target = new PVector(tx, ty);
    PVector dir = PVector.sub(target, location);
    PVector accel = dir.copy();
    accel.setMag(accel.mag()/10);
    float angle = dir.heading();
    location.add(accel);
    //location.add(velocity_);
  }


  void display() {
    stroke(255);
    strokeWeight(10);
    point(location.x, location.y);
  }
}
