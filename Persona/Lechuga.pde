//Variables
PImage lechuga, lechugaLuma;
float pxLechuga, pyLechuga;
//Functions
void Lechuga() {
  image(lechuga, pxLechuga, pyLechuga);
  lechuga.resize(50, 50);
  CaraLechuga();
}

void CaraLechuga() {
  fill(255);
  ellipse(pxLechuga+35, pyLechuga+20, 10, 10); //Ulls cornea
  ellipse(pxLechuga+15, pyLechuga+20, 10, 10);
  fill(0);
  ellipse(pxLechuga+35, pyLechuga+20, 2, 2); //Ulls pupila
  ellipse(pxLechuga+15, pyLechuga+20, 2, 2);
  fill(255);
  arc(pxLechuga+25, pyLechuga+30, 15, 15, 0, radians(180), OPEN); //Boca
}
void MoverLechuga() {
  if (keyPressed) {
    if (key =='a') {
      if (pxLechuga>0)
        pxLechuga-=3;
      distanciaRec+=3;
    }
    if (key =='d') {
      if (pxLechuga<width-50)
        pxLechuga+=3;
      distanciaRec+=3;
    }
    if (key =='w') {
      if (pyLechuga>0)
        pyLechuga-=3;
      distanciaRec+=3;
    }
    if (key =='s') {
      if (pyLechuga<height-50)
        pyLechuga+=3;
      distanciaRec+=3;
    }
  }
}

void LechugaLuma() {
  image(lechugaLuma, pxLechuga, pyLechuga);//Generar la imatge de la lechuga quan perd la partida (s'aplica la luma);
  lechugaLuma.resize(50, 50);
  CaraLechuga();
  for (int i=0; i<lechugaLuma.width; i++) {// Recorremos la X(columnas)
    for (int j=0; j<lechugaLuma.width; j++) { //Recorremos las Y (filas)
      
      color colorPixel = lechugaLuma.get(i, j);

      float luma = 0.299*red(colorPixel) + 0.587*green(colorPixel) + 0.114*blue(colorPixel);
      colorPixel = color(luma); 

      lechugaLuma.set(i, j, colorPixel);
    }
  }
}
