PImage fondo, fondoLUT;
PImage nevera;
boolean menu = true;
float pxNevera, pyNevera;
void Menu() {
  if (menu==true) {
    drawMenu();
  }
}

void drawMenu() {
  //Foto Menu
  image (fondo, width, height, 900, 700);
  image(nevera, pxNevera, pyNevera, 600, 700);

  fill(255);
  textSize(32);

  fill(0);
  textSize(32);
  text("Press 'PLAY' to start! ", width/2 + 70, height/2 + 170);


  fill(199, 228, 248);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  rect(width/1.72, height/2.5 -100, 303, 115);
  fill(0);
  textSize(64);
  text("PLAY", width/1.72, height/2.5 - 110);
}

void mousePressed() {

  if (mouseX > width/1.72 - 303/2 && mouseX < width/1.72 + 303/2 && mouseY > height/2.5 - 100 - 115/2 && mouseY < height/2.5 - 100 + 115/2) {
    startGame();
  }
}
void startGame() {
  menu = false;
  menu = false; // Cambiar al juego
}

void FondoLUT(){
  image(fondoLUT, pxLechuga, pyLechuga);//Generar la imatge de la lechuga quan perd la partida (s'aplica el LUT);
  lechugaLuma.resize(50, 50);
  CaraLechuga();
  for (int i=0; i<fondoLUT.width; i++) {// Recorremos la X(columnas)
    for (int j=0; j<fondoLUT.width; j++) { //Recorremos las Y (filas)

      color colorPixelLUT = fondoLUT.get(i, j);
      // 2- Cambiamos color
      float luma = 0.299*red(colorPixelLUT) + 0.587*green(colorPixelLUT) + 0.114*blue(colorPixelLUT);
      colorPixelLUT = color((255-luma),255-(int)random(255),255-(int)random(255));

      fondoLUT.set(i, j, colorPixelLUT);
    }
  }
}
