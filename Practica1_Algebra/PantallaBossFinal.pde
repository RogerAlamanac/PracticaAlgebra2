
float xBOSS=400;
float yBOSS=400;
float radiBOSS = 300;
float velocitatBOSS=1;
float[] balaX = new float[10]; // Array para las posiciones X de las balas
float[] balaY = new float[10]; // Array para las posiciones Y de las balas
float balaSpeed = 5; // Velocidad de las balas
int balaCount = 0; // Contador de balas

// Vidas del jefe
int vidaJefe = 3;
float jefeSize = 300;

void Boss(){
  fill(255);
  ellipse(xBOSS,yBOSS, radiBOSS, radiBOSS);
  
  // Dibujar la vida del jefe
  fill(255, 0, 0);
  rect(xBOSS - 50, yBOSS + radiBOSS / 2 + 10, 100, 10); // Representación visual de la vida del jefe
  fill(0, 255, 0);
  rect(xBOSS - 50, yBOSS + radiBOSS / 2 + 10, vidaJefe * 33.3, 10); // Barra de vida proporcional al número de vidas
  
  //ELIMINAR PNJS, ENEMICS I OBSTACLES
  xPNJ1=5000;
  yPNJ1=5000;
  xPNJ2=5000;
  yPNJ2=5000;
  WidthObstacles=0;
  HeightObstacles=0;
  //Generar barra de vida del Jugador
 BarraVida();
 vidaPNJ2();
 
 
  //MOVIMENT DEL BOSS
  xBOSS += velocitatBOSS*direccioX;  
    if((xBOSS>width-radiBOSS)||(xBOSS<radiBOSS)){
      
      direccioX=-direccioX;
    }
    yBOSS += velocitatBOSS*direccioY;
    if((yBOSS>height-radiBOSS)||(yBOSS<radiBOSS)){
     
     direccioY=-direccioY; 
    }
    
   //ATAC DEL BOSS
  vector[0] = xBOSS - xPJ;//Vx = NPCx - PCx 
    vector[1] = yBOSS - yPJ;//Vy = NPCy - PCy
    magnitude = sqrt(vector[0]*vector[0] + vector[1]*vector[1]); //Calculem el modul dels vectors per saber la distancia 
    // Quan el PJ colisioni amb un enemic
      if (magnitude < jefeSize / 2 + 10) { // Aquí 10 es el radio del jugador
    vidaJefe--; // El jefe pierde una vida
    jefeSize -= 10; // Reducir el tamaño del jefe
  } 
  
  // Disparar balas del BOSS
  for (int i = 0; i < balaCount; i++) {
    fill (0); //Color
    ellipse(balaX[i], balaY[i], 10, 10); // Dibujar la bala
    // Mover la bala
    float angle = atan2(yPJ - balaY[i], xPJ - balaX[i]); // Calcular el ángulo hacia el jugador
    balaX[i] += balaSpeed * cos(angle); // Mover la bala en X
    balaY[i] += balaSpeed * sin(angle); // Mover la bala en Y
    
    // Detectar colisión de la bala con el jugador
    if (dist(balaX[i], balaY[i], xPJ, yPJ) < 10) { //  10 es el radio del jugador
      vidaActual--; // El jugador pierde una vida
      // Eliminar la bala
      for (int j = i; j < balaCount - 1; j++) {
        balaX[j] = balaX[j + 1];
        balaY[j] = balaY[j + 1];
      }
      balaCount--;
    }
  }
}

// Función para que el BOSS dispare una bala
void dispararBala() {
  if (balaCount < balaX.length) {
    balaX[balaCount] = xBOSS; // Posición inicial X de la bala
    balaY[balaCount] = yBOSS; // Posición inicial Y de la bala
    balaCount++; // Incrementar el contador de balas
  }
}
