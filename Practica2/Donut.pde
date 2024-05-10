//Variables
PImage donut, donutLuma;
int pxDonut, pyDonut;
//Funciones
void Donut() {
  image(donut, pxDonut, pyDonut);
  donut.resize(50, 50);
  CaraDonut();
}

void CaraDonut() {
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
      if (pxDonut>0)//Coliders amb el borde del mapa
        pxDonut-=3;
      distanciaRec+=3;
    }
    if (keyCode==RIGHT) {
      if (pxDonut<width-50)
        pxDonut+=3;
      distanciaRec+=3;
    }
    if (keyCode==UP) {
      if (pyDonut>0)
        pyDonut-=3;
      distanciaRec+=3;
    }
    if (keyCode == DOWN) {
      if (pyDonut<height-50)
        pyDonut+=3;
      distanciaRec+=3;
    }
  }
}

void DonutLuma() {
  image(donutLuma, pxDonut, pyDonut);
  donutLuma.resize(50, 50);
  CaraDonut();
  for (int i=0; i<donutLuma.width; i++) {// Recorremos la X(columnas)
    for (int j=0; j<donutLuma.width; j++) { //Recorremos las Y (filas)
      // Ahora estamos en un pixel concreto de la imagen
      // Vamos a cambiar el pixel según una LUT
      // 1- Nos cogemos el color del pixel
      color colorPixel = donutLuma.get(i, j);
      // 2- Cambiamos color
      float luma = 0.299*red(colorPixel) + 0.587*green(colorPixel) + 0.114*blue(colorPixel);
      colorPixel = color(luma); //R,G,B son iguales porque es un gris. Se pued eponer color(luma)
      // 3- Guardamos el color modificado en el pixel
      donutLuma.set(i, j, colorPixel);
    }
  }
}
