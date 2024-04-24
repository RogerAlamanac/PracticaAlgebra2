//Variables
float angleX=30.0;
float angleY=60.0;
int torn;
//Setup
void setup() {
  size(900, 700);
  //Inicialitzem
  lechuga = loadImage("Lechuga.png");
  donut = loadImage("Donut.png");
  pxLechuga=width/2;
  pyLechuga=height/2;
  pxDonut = width/2;
  pyDonut = height/4;
  torn = 0;
}
//Draw
void draw() {
  background(255);
  Lechuga();
  Donut();
  Persona();
  generarLiniesY();
  generarLiniesX();
  if (torn == 0) {
    moverDonut();
    torn = 1;
  } else if (torn == 1) {
    MoverLechuga();
    torn = 0;
  }
  ColisionPvP();
}
