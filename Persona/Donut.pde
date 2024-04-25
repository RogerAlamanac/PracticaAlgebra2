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
  if (keyPressed||(keyPressed&&(key==CODED))) {
    if (keyCode==LEFT) {
      if(pxDonut>0)//Coliders amb el borde del mapa
      pxDonut-=3;
    }
    if (keyCode==RIGHT) {
      if(pxDonut<width-50)
      pxDonut+=3;
    }
    if (keyCode==UP) {
      if(pyDonut>0)
      pyDonut-=3;
    }
    if (keyCode == DOWN) {
      if(pyDonut<height-50)
      pyDonut+=3;
    }
  }
}
