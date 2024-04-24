//Variables
PImage donut;
float pxDonut, pyDonut;
//Funciones
void Donut(){
  image(donut, pxDonut, pyDonut);
  donut.resize(50,50);
  fill(255);
  ellipse(pxDonut+35, pyDonut+20, 10, 10); //Cornea Ulls
  ellipse(pxDonut+15, pyDonut+20, 10, 10);
  fill(0);
  ellipse(pxDonut+35, pyDonut+20, 2, 2); //Pupila Ulls
  ellipse(pxDonut+15, pyDonut+20, 2, 2);
}

void moverDonut() {
  if (keyPressed&&(key==CODED)) {
    if (keyCode==LEFT) {
      pxDonut-=20;
    }
    if (keyCode==RIGHT) {
      pxDonut+=20;
    }
    if (keyCode==UP) {
      pyDonut-=20;
    }
    if (keyCode == DOWN) {
      pyDonut+=20;
    }
  }
}
