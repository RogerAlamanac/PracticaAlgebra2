
void setup() {
  size(800, 600, P3D);
  //CORBA

  // Crear múltiples curvas
  PVector p1[] = {new PVector(100, 500, 0), new PVector(200, 100, 0), new PVector(400, 300, 0), new PVector(600, 100, 0)};
  PVector p2[] = {new PVector(600, 100, 0), new PVector(700, 500, 0), new PVector(500, 200, 0), new PVector(300, 400, 0)};
  PVector p3[] = {new PVector(300, 400, 0), new PVector(100, 300, 0), new PVector(200, 600, 0), new PVector(100, 500, 0)};

  // Crido al construcotr de la corba
  la_primera_corba = new corba(p1, 100);
  la_segona_corba = new corba(p2, 100);
  la_tercera_corba = new corba(p3, 100);

  corbes.add(new corba(p1, 100));
  corbes.add(new corba(p2, 100));
  corbes.add(new corba(p3, 100));

  for (int i = 0; i < corbes.size(); i++) {
    corbes.get(i).Calcular_coefs();
  }

  Lider();
  // Inicialización bola
  u = 0; // Inici curva
  frameRate(60); // Fotogrames
}

void draw() {
  background(0);
  //BOLA
  // Actualiza posició elipse
  corba currentCorba = corbes.get(currentCorbaIndex);
  interpolate(u, currentCorba);

  fill(0, 0, 255);
  ellipse(posX, posY, 50, 50);

  // Incrementa u
  u += 0.005;
  if (u > 1) {
    u = 0;
    currentCorbaIndex++;
    if (currentCorbaIndex >= corbes.size()) {
      currentCorbaIndex = 0;
    }
  }

  //Pintar la CORBA

  for (int i = 0; i<corbes.size(); i++) {
    corbes.get(i).pintar();
    corbes.get(i).pintarCaixa();
  }
  //Calcular coeficients
  for (int i = 0; i<corbes.size(); i++) {
    corbes.get(i).Calcular_coefs();
  }
}
