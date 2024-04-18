//Variables
PImage lechuga, donut;
float pxLechuga, pyLechuga;
int pxDonut=10;
int pyDonut=20;
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
  Lechuga();
  Donut();
  Persona();
  mover();
  

}
//Functions
void Lechuga(){
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
}
void Donut(){
  image(donut, pxDonut, pyDonut);
  donut.resize(50,50);
   fill(255);
  ellipse(pxDonut+35, pyDonut+20, 10, 10);
  ellipse(pxDonut+15, pyDonut+20, 10, 10);
  fill(0);
  ellipse(pxDonut+35, pyDonut+20, 2, 2);
  ellipse(pxDonut+15, pyDonut+20, 2, 2);
}
void mover(){
  if(mousePressed){
  pxLechuga=mouseX;
  pyLechuga=mouseY;
  }
  
  if(keyPressed&&(key==CODED)){
    if(keyCode==LEFT){
      pxDonut-=2;
    }
    if (keyCode==RIGHT){
      pxDonut+=2;
    }
    if(keyCode==UP){
      pyDonut-=2;
    }
    if (keyCode == DOWN){
      pyDonut+=2;
    }
  }
 
}
