PVector P0, P1, P2, P3;
float C0x, C1x, C2x, C3x;
float C0y, C1y, C2y, C3y;
float u;
float posX, posY;

void setup() {
  size(800, 600);
  P0 = new PVector(100, 500);
  P1 = new PVector(300, -500);
  P2 = new PVector(400, 1000);
  P3 = new PVector(700, 100);

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

  u = 0; // Inici curva
  frameRate(60); // Fotogrames
}

void draw() {
  background(255);

  // Actualiza posició elipse
  interpolate(u);

  fill(0, 0, 255);
  ellipse(posX, posY, 50, 50);

  // Incrementa u
  u += 0.005;
  if (u > 1) {
    u = 0;
  }
}

// Calcular coeficients
float[] calculateCoefficients(float P0, float P1, float P2, float P3) {
  float[] coefficients = new float[4];
  coefficients[0] = P0;
  coefficients[1] = 3 * (P1 - P0);
  coefficients[2] = 3 * (P2 - 2 * P1 + P0);
  coefficients[3] = P3 - 3 * P2 + 3 * P1 - P0;
  return coefficients;
}

// Funció de interpolació
void interpolate(float u) {
  float u2 = u * u;
  float u3 = u * u * u;

  posX = C0x + C1x * u + C2x * u2 + C3x * u3;
  posY = C0y + C1y * u + C2y * u2 + C3y * u3;
}
