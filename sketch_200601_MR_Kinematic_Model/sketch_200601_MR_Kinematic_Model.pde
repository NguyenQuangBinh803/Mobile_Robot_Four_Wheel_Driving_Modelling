Vehicle vehicle;
Particle wheel_front_right;
Particle wheel_front_left;
Particle wheel_rear_right;
Particle wheel_rear_left;
Particle MR_center;
Particle MR_head;
Particle MR_tail;


//tan of MR_height/2, MR_width/2
float MR_angle;
float MR_distance_from_center;

int MR_width = 200;
int MR_height = 100;


float mouse_x;
float mouse_y;
void setup() {
  size(800, 800);
  int center_x = width/2;
  int center_y = height/2;


  //Initailize particle for each wheel points
  wheel_front_right = new Particle(new PVector(float(center_x + MR_width/2), float(center_y + MR_height/2)));
  wheel_front_left = new Particle(new PVector(float(center_x + MR_width/2), float(center_y - MR_height/2)));
  wheel_rear_right = new Particle(new PVector(float(center_x - MR_width/2), float(center_y + MR_height/2)));
  wheel_rear_left = new Particle(new PVector(float(center_x - MR_width/2), float(center_y - MR_height/2)));
  MR_center = new Particle(new PVector(float(center_x + MR_width/2), float(center_y)));
  MR_head = new Particle(new PVector(float(center_x + MR_width/2), float(center_y)));
  MR_tail = new Particle(new PVector(float(center_x - MR_width/2), float(center_y)));

  Vehicle current = new Vehicle(MR_head.get_position().x, MR_head.get_position().y, MR_width/2, 0);

  MR_angle = atan(float(MR_height)/float(MR_width)); 
  MR_distance_from_center = sqrt((MR_height/2)*(MR_height/2) + (MR_width/2)*(MR_width/2));
  println(MR_distance_from_center);
  print(MR_angle*180/PI);
  vehicle = current;
}

float step_x = 0;
float step_y = 0;
PVector prev_right = new PVector();
PVector prev_left = new PVector();
float mousex = 0;
float mousey = 0;

void draw() {
  background(0);
  vehicle.follow(mouse_x, mouse_y);
  vehicle.update();
  vehicle.show();  
}
void mouseMoved() {
  mouse_x = mouseX;
  mouse_y = mouseY;
}
