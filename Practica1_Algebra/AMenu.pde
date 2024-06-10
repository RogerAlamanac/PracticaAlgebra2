boolean menuEnemies = true;
int numEnemies=10; // Número inicial de enemigos
PImage MenuFoto;
void MenuEnemies() {
  if (menuEnemies) {
    drawMenuEnemics();
  }
}

void drawMenuEnemics() {
//Foto Menu
  image(MenuFoto,400,400);
  MenuFoto.resize(800,800);
    // Texto que muestra la cantidad actual de enemigos
  fill(255);
  textSize(32);
  text("Choose number of Enemies: " + numEnemies, width/2, height/2 - 250);
  
  fill(255);
  textSize(32);
  text("Press 'PLAY' to start! ", width/2, height/2 + 250);
  
  // Botón para restar enemigos
  fill(100);
  rectMode(CENTER);
  rect(width/2 - 150, height/2 - 100, 200, 100);
  fill(255);
  textSize(50);
  text("-1", width/2 - 150, height/2 -110);
  
  // Botón para sumar enemigos
  fill(100);
  rectMode(CENTER);
  rect(width/2 + 150, height/2 - 100, 200, 100);
  fill(255);
  textSize(50);
  text("+1", width/2 + 150, height/2 - 110);
  
  fill(100);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  rect(width/2, height/2 + 110, 200, 100);
  fill(255);
  textSize(64);
  text("PLAY", width/2, height/2 + 100);
}

void keyPressed() {
  if (menuEnemies && key == ' ') {
    startGame(); // Iniciar el juego cuando se presiona la barra espaciadora
    // tiempoInicial = millis(); // Guardar el tiempo inicial (esto debe estar definido en tu código principal)
  }
  if (menu && key == ' ') {
    startGame(); // Iniciar el juego cuando se presiona la barra espaciadora
  }
}

void mousePressed() {
  if (menuEnemies && mouseX > width/2 - 50 && mouseX < width/2 + 50 && mouseY > height/2 + 75 && mouseY < height/2 + 125) {
    menuEnemies=true; // Iniciar el juego cuando se hace clic en el botón
    // tiempoInicial = millis(); // Guardar el tiempo inicial (esto debe estar definido en tu código principal)
  }
  
   if (menuEnemies && mouseX > width/2 - 250 && mouseX < width/2 - 50 && mouseY > height/2 - 150 && mouseY < height/2 - 50) {
    if (numEnemies > 1) {
      numEnemies--; // Restar un enemigo
    }
  }
  
  if (menuEnemies && mouseX > width/2 + 50 && mouseX < width/2 + 250 && mouseY > height/2 - 150 && mouseY < height/2 - 50) {
    if (numEnemies <= 9) {
      numEnemies++; // Sumar un enemigo
    }
  }
  if (menu && mouseX > width/2 - 50 && mouseX < width/2 + 50 && mouseY > height/2 + 75 && mouseY < height/2 + 125) {
    startGame(); // Iniciar el juego cuando se hace clic en el botón
  }
  
  if (menu && mouseX > width/2 - 50 && mouseX < width/2 + 50 && mouseY > height/4 + 75 && mouseY < height/4 + 125){
    menuEnemies=true;
  }
}

void startGame() {
  menuEnemies = false;
  menu = false; // Cambiar al juego
  
  // Cambiar al juego
}




int tiempoInicial; // Variable para almacenar el tiempo inicial
int duracion = 2 * 60 * 1000; // Duración del contador en milisegundos (2 minutos)

void Tiempo() {
  // Calcular el tiempo transcurrido
  int tiempoTranscurrido = millis() - tiempoInicial;
  
  // Calcular el tiempo restante
  int tiempoRestante = duracion - tiempoTranscurrido;
  
  // Verificar si el tiempo ha terminado
  if (tiempoRestante <= 0) {
    perderVida(); // Si el tiempo ha terminado, el jugador pierde una vida
    reiniciarTiempo(); // Y se reinicia el contador
  }
  
  // Convertir milisegundos a minutos y segundos
  int minutos = tiempoRestante / (60 * 1000);
  int segundos = (tiempoRestante / 1000) % 60;
  
  // Mostrar el tiempo restante
  textAlign(RIGHT, TOP);
  textSize(32);
  fill(255);
  text(nf(minutos, 2) + ":" + nf(segundos, 2), width/2 + 375, height/2 -400); // Colocar el texto en la esquina superior derecha
}

void perderVida() {
  if (vidaActual > 0) {
    vidaActual--; // Restar una vida
    println("¡Has perdido una vida!");
  }
}

void reiniciarTiempo() {
  tiempoInicial = millis(); // Reiniciar el contador de tiempo
}
