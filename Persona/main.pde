//Variables
PImage lechuga, donut;
float pxLechuga, pyLechuga;
float angleX=30.0;
float angleY=60.0;
//Setup
void setup(){
  size(640,360,P3D);
  //Inicialitzem
  lechuga = loadImage("Lechuga.png");
  donut = loadImage("Donut.png");
  pxLechuga=width/2;
  pyLechuga=height/2;
}
//Draw
void draw(){
  background(255);
  GenerarPersonatges();
  Persona();
  mover();
  

}
//Functions
void GenerarPersonatges(){
image(lechuga,pxLechuga,pyLechuga);
  lechuga.resize(50,50);
  fill(255);
  ellipse(pxLechuga+35, pyLechuga+20, 10, 10);
  ellipse(pxLechuga+15, pyLechuga+20, 10, 10);
  fill(0);
  ellipse(pxLechuga+35, pyLechuga+20, 2, 2);
  ellipse(pxLechuga+15, pyLechuga+20, 2, 2);
  fill(255);
  arc(pxLechuga+25, pyLechuga+30, 15, 15, 0, radians(180), OPEN);
  image(donut, 10, 20);
  donut.resize(50,50);
}
void mover(){
  if(mousePressed){
  pxLechuga=mouseX;
  pyLechuga=mouseY;
  }
}
