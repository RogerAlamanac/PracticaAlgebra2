//Variables
PImage lechuga, lechugaLUT1, lechugaLUT2;
float pxLechuga, pyLechuga;
//Functions
void Lechuga() {
  image(lechuga, pxLechuga, pyLechuga);
  lechuga.resize(50, 50);
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

void LUT1() { //0,102,51
  image(lechugaLUT1, pxLechuga, pyLechuga);
  lechugaLUT1.resize(50, 50);
  fill(255);
  ellipse(pxLechuga+35, pyLechuga+20, 10, 10); //Ulls cornea
  ellipse(pxLechuga+15, pyLechuga+20, 10, 10);
  fill(0);
  ellipse(pxLechuga+35, pyLechuga+20, 2, 2); //Ulls pupila
  ellipse(pxLechuga+15, pyLechuga+20, 2, 2);
  fill(255);
  arc(pxLechuga+25, pyLechuga+30, 15, 15, 0, radians(180), OPEN); //Boca
  for (int i=0; i<lechugaLUT1.width; i++) {// Recorremos la X(columnas)
    for (int j=0; j<lechugaLUT1.width; j++) { //Recorremos las Y (filas)
      // Ahora estamos en un pixel concreto de la imagen
      // Vamos a cambiar el pixel según una LUT
      // 1- Nos cogemos el color del pixel
      color colorPixel = lechugaLUT1.get(i, j);
      // 2- Cambiamos color
      float lut11 = 0.299*red(colorPixel) + 0.587*green(colorPixel) + 0.114*blue(colorPixel);
      float lut12 = -0.147*red(colorPixel) - 0.289*green(colorPixel) + 0.436*blue(colorPixel);
      float lut13 = 0.615*red(colorPixel) - 0.515*green(colorPixel) + 0.100*blue(colorPixel);
      colorPixel = color(lut11, lut12, lut13); //R,G,B son iguales porque es un gris. Se pued eponer color(luma)
      // 3- Guardamos el color modificado en el pixel
      lechugaLUT1.set(i, j, colorPixel);
    }
  }
}
