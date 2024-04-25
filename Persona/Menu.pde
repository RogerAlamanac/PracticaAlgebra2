PImage fondo;
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
  // Texto que muestra la cantidad actual de enemigos
  fill(255);
  textSize(32);

  fill(255);
  textSize(32);
  text("Press 'PLAY' to start! ", width/2, height/2 + 250);


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
