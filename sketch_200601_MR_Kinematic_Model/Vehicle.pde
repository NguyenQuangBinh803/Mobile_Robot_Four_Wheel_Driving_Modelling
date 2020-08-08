class Vehicle {
  float ang_front;
  float ang_rear;

  float ang_wheel_front_left = pow(tan(ang_front), -1) - MR_height/(2*MR_width)*pow(tan(ang_front), -1)*(tan(ang_front) - tan(ang_rear));


  PVector a;
  PVector center;
  float angle = 0;
  float len;

  float sw = 0;

  PVector rear_center_target = new PVector();
  PVector front_center_target = new PVector();

  PVector rear_center= new PVector();  
  PVector front_center= new PVector();

  PVector front_left_target = new PVector();
  PVector front_left= new PVector();

  PVector front_right_target = new PVector();
  PVector front_right= new PVector();


  PVector rear_left_target = new PVector();
  PVector rear_left= new PVector();

  PVector rear_right_target = new PVector();
  PVector rear_right= new PVector();

  PVector prev_center = new PVector();


  Vehicle(float x, float y, float len_, float i) {
    a = new PVector(x, y);
    center = new PVector(x,y);
    prev_center = a;

    len = len_;
    float init_ang = 0;
    update();
    rear_center = new PVector(a.x+len, a.y);
    front_center = new PVector(a.x-len, a.y);
  }

  float follow(float tx, float ty) {
    PVector target = new PVector(tx, ty);
    PVector dir = PVector.sub(target, a);
    
    //a = center;
    PVector accel = dir.copy();
    accel.setMag(accel.mag()/10);
    angle = dir.heading();
    print(a.x, a.y);
    a.add(accel);
    print(a.x, a.y);
    update();
    

    PVector vel_rear_center = PVector.sub(rear_center_target, rear_center);
    vel_rear_center.setMag(vel_rear_center.mag()/10);
    stroke(0, 255, 0);

    PVector vel_front_center = PVector.sub(front_center_target, front_center);
    vel_front_center.setMag(vel_front_center.mag()/10);
    stroke(0, 255, 0);


    PVector vel_front_left = PVector.sub(front_left_target, front_left);
    vel_front_left.setMag(vel_front_left.mag()/10);
    stroke(0, 255, 0);

    PVector vel_front_right = PVector.sub(front_right_target, front_right);
    vel_front_right.setMag(vel_front_right.mag()/10);
    stroke(0, 255, 0);

    PVector vel_rear_left = PVector.sub(rear_left_target, rear_left);
    vel_rear_left.setMag(vel_rear_left.mag()/10);
    stroke(0, 255, 0);

    PVector vel_rear_right = PVector.sub(rear_right_target, rear_right);
    vel_rear_right.setMag(vel_rear_right.mag()/10);
    stroke(0, 255, 0);

    println(front_left, front_right);

    rear_center.add(vel_rear_center);
    front_center.add(vel_front_center);
    
    front_left.add(vel_front_left);
    front_right.add(vel_front_right);

    rear_left.add(vel_rear_left);
    rear_right.add(vel_rear_right);
    return angle;
  }

  void calculate_rear_center() {
    float dx = -len * cos(angle);
    float dy = -len * sin(angle);
    rear_center_target.set(a.x+dx, a.y+dy);
  }

  void calculate_front_center() {
    float dx = +len * cos(angle);  
    float dy = +len * sin(angle);
    front_center_target.set(a.x+dx, a.y+dy);
  }

  void calculate_front_left_target() {
    float temp_angle = angle - MR_angle;

    float dx = MR_distance_from_center*cos(temp_angle);
    float dy = MR_distance_from_center*sin(temp_angle);

    front_left_target.set(a.x+dx, a.y+dy);
  }


  void calculate_front_right_target() {
    float temp_angle = angle + MR_angle;

    float dx = MR_distance_from_center*cos(temp_angle);
    float dy = MR_distance_from_center*sin(temp_angle);

    front_right_target.set(a.x+dx, a.y+dy);
  }

  void calculate_rear_left_target() {
    float temp_angle = angle + MR_angle   - PI;

    float dx = MR_distance_from_center*cos(temp_angle);
    float dy = MR_distance_from_center*sin(temp_angle);

    rear_left_target.set(a.x+dx, a.y+dy);
  }


  void calculate_rear_right_target() {
    float temp_angle = angle - MR_angle - PI;

    float dx = MR_distance_from_center*cos(temp_angle);
    float dy = MR_distance_from_center*sin(temp_angle);

    rear_right_target.set(a.x+dx, a.y+dy);
  }


  void update() {
    calculate_front_left_target();
    calculate_front_right_target();
    calculate_rear_left_target();
    calculate_rear_right_target();
    calculate_rear_center();
    calculate_front_center();
  }


  void show() {

    //Display real point accelerate
    stroke(255);
    strokeWeight(10);
    point(front_center.x, front_center.y);
    point(rear_center.x, rear_center.y);

    stroke(0, 255, 0);
    point(front_right.x, front_right.y);
    point(front_left.x, front_left.y);
    point(rear_right.x, rear_right.y);
    point(rear_left.x, rear_left.y);


    //Display target points
    stroke(255, 0, 0);
    point(front_left_target.x, front_left_target.y);
    //stroke(0, 255, 255); 
    point(front_right_target.x, front_right_target.y);
    //stroke(255,0,0);
    point(rear_right_target.x, rear_right_target.y);
    //stroke(0,0,255);
    point(rear_left_target.x, rear_left_target.y);
    
    point(a.x, a.y);
    //point(h.x, h.y);
    //point(b.x, b.y);
    //print(front_left_target);

    //println(PVector.sub(tail, head).mag());
  }
}
