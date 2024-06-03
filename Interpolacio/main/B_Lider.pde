void Lider() {
  PVector[] lider = new PVector[4];
  // Inicialitzar els punts del líder
  lider[0] = new PVector(100, 500, 300);
  lider[1] = new PVector(300, -500, 400);
  lider[2] = new PVector(400, 400, 250);
  lider[3] = new PVector(700, 100, 100);

  // BOLA
  P0 = new PVector(lider[0].x, lider[0].y, lider[0].z); //Establir el desti de la pilota per cada punt
  P1 = new PVector(lider[1].x, lider[1].y, lider[1].z);
  P2 = new PVector(lider[2].x, lider[2].y, lider[2].z);
  P3 = new PVector(lider[3].x, lider[3].y, lider[3].z);

  // Calcula coeficients de x
  float[] coefficientsX = calculateCoefficients(P0.x, P1.x, P2.x, P3.x);
  C0x = coefficientsX[0];
  C1x = coefficientsX[1];
  C2x = coefficientsX[2];
  C3x = coefficientsX[3];

  // Calcula coeficients de y
  float[] coefficientsY = calculateCoefficients(P0.y, P1.y, P2.y, P3.y);
  C0y = coefficientsY[0];
  C1y = coefficientsY[1];
  C2y = coefficientsY[2];
  C3y = coefficientsY[3];
}

// Calcular coeficients
float[] calculateCoefficients( float P0, float P1, float P2, float P3) {
  float[] coefficients = new float[4];
  coefficients[0] = P0;
  coefficients[1] = 3 * (P1 - P0);
  coefficients[2] = 3 * (P2 - 2 * P1 + P0);
  coefficients[3] = P3 - 3 * P2 + 3 * P1 - P0;
  return coefficients;
}

// Funció de interpolació
void interpolate(float u, corba c) {
  float u2 = u * u;
  float u3 = u * u * u;

  corba currentCorba = corbes.get(currentCorbaIndex);

  lider.posicio_particula.x = c.coefs[0].x + c.coefs[1].x * u + c.coefs[2].x * u2 + c.coefs[3].x * u3;
  lider.posicio_particula.y = c.coefs[0].y + c.coefs[1].y * u + c.coefs[2].y * u2 + c.coefs[3].y * u3;

  /* u += 0.01;
   if (u > 1.0) {
   u = 0; // Reiniciamos u a 0 al finalizar cada curva
   // Avanzar a la siguiente curva
   currentCorbaIndex++;
   
   if (currentCorbaIndex >= corbes.size()) {
   currentCorbaIndex = 0; // Volver a la primera curva al finalizar todas las curvas
   }
   }*/
}
void canviCamera() {
  if (keyPressed) {
    if (key == '1') {
      // ortografica
      camera(width/2, height/2, 800, width/2, height/2, 0, 0, 1, 0);
    } else if (key == '2') {
      // sométrica
      camera(width/2, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
    }
  }
}
