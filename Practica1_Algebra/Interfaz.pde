int colisions = 0; // Contador de colisions
boolean gameOver = false; // Controla si el joc ha acabat

// Dibuixar la barra de vida
float barraX = 175;
float barraY = height - 30;
float barraAncho = 300;
float barraAlto = 20;
float vidaProporcion = (float)vidaActual / vidaTotal;
float barraActualAncho = barraAncho * vidaProporcion;
//Configuració vida
void vidaPNJ2(){
 if (!gameOver) 
  {
    // Verificar si la barra de vida esta buida
    if (vidaActual <= 0) {
      vidaActual = 0; // Assegurar que la vida actual no sigui negativa
      vidaTotal--; // Reduir el número de vides
      if (vidaTotal <= 0) 
      {
        gameOver = true; // El el joc acaba si arriba a 0
      } 
      else 
      {
        vidaActual = vidaTotal; // Restaurar la vida actual al valor total
      }
    }

    // Verificar el maxim de colisions
    if (colisions >= 3) 
    {
      colisions = 0; // Reiniciar el contador de colisions
      vidaActual--; // Reduir la vida del jugador
    }
  }

  
  else 
  {
    //  "Game Over"
    fill(255, 0, 0);
    textSize(64);
    textAlign(CENTER, CENTER);
    text("Game Over", width/2, height/2);
    restablecerVida();
  }

}
//Generar barra de vida
void BarraVida(){
  fill(255,0, 0); // Color 
  rect(barraX, barraY, barraAncho, barraAlto);

    fill(0, 255, 0); // Color verde
    rect(barraX, barraY, barraActualAncho, barraAlto);

    // Mostrar la vida actual
    fill(255);
    textSize(30);
    textAlign(LEFT, TOP);
    text("VIDA: " + vidaActual, barraX/2 + barraAncho / 2, barraY - 50);
}
 
// Funcio per reestablir la vida del jugador
void restablecerVida() 
{
  vidaTotal = 3; // Reestablir el número total de vides
  vidaActual = vidaTotal; // Reiniciar la vida amb el valor total
  colisions = 0; // Reiniciar el contador de colisions
  gameOver = false; // Reiniciar el joc
}
