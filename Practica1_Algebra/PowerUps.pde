 // Variables para el power-up
float powerUpX;
float powerUpY;
float powerUpSize = 40; // Tamaño del power-up
float PJ = xPJ + yPJ;
// Variables para el power-up 2
float powerUpX2;
float powerUpY2;
float powerUpSize2 = 50; // Tamaño del power-up de reducción de tamaño
// Variables para el power-up 3
float powerUpX3;
float powerUpY3;
float powerUpSize3 = 60; // Tamaño del power-up de reducción de tamaño

// Variables para el power-up 4
float powerUpX4; // Posición X del power-up 4
float powerUpY4; // Posición Y del power-up 4
float powerUp4Width = 40; // Ancho del power-up 4
float powerUp4Height = 70; // Alto del power-up 4
float powerUpX5; // Posición X del power-up 5
float powerUpY5; // Posición Y del power-up 5
float powerUp5Width = 80; // Ancho del power-up 5
float powerUp5Height = 40; // Alto del power-up 5


int statePowerUp = 0;

boolean powerUpActivo = false; // Variable para controlar si el power-up está activo
boolean powerUpActivo2 = false; // Variable para controlar si el power-up está activo
boolean powerUpActivo3 = false; // Variable para controlar si el power-up está activo
boolean powerUpActivo4 = false; // Variable para controlar si el power-up está activo
boolean powerUpActivo5 = false; // Variable para controlar si el power-up está activo

int powerUpCount = 0;
boolean portalOpened = false;

void PowerUps(){
  // Mover al jugador
  if (powerUpActivo) {
    // Si el power-up está activo, mover al jugador más rápido
    xPJ += alpha * 10;
    yPJ += alpha * 10;
  } else {
    xPJ += alpha;
    yPJ += alpha;
  }
 
  if (powerUpActivo) {
    statePowerUp = 1; // Power-up de aumento de velocidad activo
  } else if (powerUpActivo2) {
    statePowerUp = 2; // Power-up de reducción de tamaño activo
  } else if (powerUpActivo3) {
    statePowerUp = 3; // Power-up de reducción de tamaño activo
  } else if (powerUpActivo4) {
    statePowerUp = 4; // Power-up de reducción de tamaño activo
  } else if (powerUpActivo5) {
    statePowerUp = 5; // Power-up de reducción de tamaño activo
  }
  else {
    statePowerUp = 0; // Ningún power-up activo
  }
 
  // Dibujar el power-up si no está activo
  if (!powerUpActivo) {
    fill(255, 165, 0); // Color naranja para el power-up
    triangle(powerUpX - powerUpSize / 2, powerUpY + powerUpSize / 2,
             powerUpX + powerUpSize / 2, powerUpY + powerUpSize / 2,
             powerUpX, powerUpY - powerUpSize / 2);
   
    // Verificar colisión entre el jugador y el power-up
    if (dist(xPJ, yPJ, powerUpX, powerUpY) < 15 + powerUpSize / 2) {
      // Si hay colisión, activar el power-up y reiniciar su posición
      powerUpActivo = true;
    }
  }
 
  if (!powerUpActivo2) {
    fill(128, 0, 128); // Color lila para el power-up de reducción de tamaño
    quad(powerUpX2 - powerUpSize2 / 2, powerUpY2 - powerUpSize2 / 2,
         powerUpX2 + powerUpSize2 / 2, powerUpY2 - powerUpSize2 / 2,
         powerUpX2 + powerUpSize2 / 2, powerUpY2 + powerUpSize2 / 2,
         powerUpX2 - powerUpSize2 / 2, powerUpY2 + powerUpSize2 / 2);
   
    // Verificar colisión entre el jugador y el power-up de reducción de tamaño
    if (dist(xPJ, yPJ, powerUpX2, powerUpY2) < PJ / 10 + powerUpSize2 / 2) {
      // Si hay colisión, activar el power-up de reducción de tamaño y reiniciar su posición
      powerUpActivo2 = true;
    }
  }
  
  if (!powerUpActivo3) {
    fill(0, 255, 75); // Color verde para el power-up 3
    quad(powerUpX3, powerUpY3 + powerUpSize3 / 2, // Vértice superior izquierdo
         powerUpX3 + powerUpSize3 / 2, powerUpY3 + powerUpSize3, // Vértice inferior izquierdo
         powerUpX3 + powerUpSize3, powerUpY3 + powerUpSize3 / 2, // Vértice superior derecho
         powerUpX3 + powerUpSize3 / 2, powerUpY3); // Vértice inferior derecho
   
    // Verificar colisión entre el jugador y el power-up 3
    if (dist(xPJ, yPJ, powerUpX3, powerUpY3) < PJ / 10 + powerUpSize3 / 2) {
      // Si hay colisión, activar el power-up 3
      powerUpActivo3 = true;
    }
  }
  
  if (!powerUpActivo4) {
    fill(255, 50, 203); // Color rosa para el power-up 4
    rect(powerUpX4, powerUpY4, powerUp4Width, powerUp4Height);
   
    // Verificar colisión entre el jugador y el power-up 4
    if (dist(xPJ, yPJ, powerUpX4 + powerUp4Width / 2, powerUpY4 + powerUp4Height / 2) < PJ / 10 + powerUp4Width / 2) {
      // Si hay colisión, activar el power-up 4
      powerUpActivo4 = true;
    }
  }
 
  if (!powerUpActivo5) {
    fill(255, 255, 0); // Color amarillo para el power-up 5
    ellipse(powerUpX5 + powerUp5Width / 2, powerUpY5 + powerUp5Height / 2, powerUp5Width, powerUp5Height);
   
    // Verificar colisión entre el jugador y el power-up 5
    if (dist(xPJ, yPJ, powerUpX5 + powerUp5Width / 2, powerUpY5 + powerUp5Height / 2) < PJ / 10 + powerUp5Width / 2) {
      // Si hay colisión, activar el power-up 5
      powerUpActivo5 = true;
    }
  }
}

void openPortal() {
  if (powerUpCount >= 5 && !portalOpened) {
    activarPortal();
  }
  if (portalOpened) {
    fill(0, 0, 255); // Color del portal
    ellipse(width/2, height/2, 50, 50);
  }
}
  
void activarPortal() {
  portalOpened = true;
}
