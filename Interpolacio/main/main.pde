void setup() {
  fullScreen(P3D);  
  //CORBA
  // Crear múltiples corbes
  PVector p1[] = {new PVector(100, 500, 0), new PVector(200, 100, 0), new PVector(400, 300, 0), new PVector(600, 100, 0)}; //Cada vector es un punt de la corba
  PVector p2[] = {new PVector(600, 100, 0), new PVector(700, 500, 0), new PVector(500, 200, 0), new PVector(300, 400, 0)};
  PVector p3[] = {new PVector(300, 400, 0), new PVector(100, 300, 0), new PVector(200, 600, 0), new PVector(200, 250, 0)};

  // Crido al constructor de la corba
  corbes.add(new corba(p1, 100));
  corbes.add(new corba(p2, 100));
  corbes.add(new corba(p3, 100));

  for (int i = 0; i < corbes.size(); i++) {
    corbes.get(i).Calcular_coefs();
  }

Lider();
  // Inicializació bola
  u = 0; // Inici curva
  frameRate(60); // Fotogrames
  
 

  
  //Inicialitzo el desti
  desti = new PVector(width - 20, 20);
  // Ini. voxel
  //Fiquem vector unitari apuntant cap amunt en vertical
  //Per tant les seves coordenades son (0,-1)
  //primer_voxel = new voxel(new PVector (0, -0.5), new PVector (width/2, height/2), 100.0, 150.0, color(200));
  // Inicialitzo les particules
  // Constructor = PVector p, PVector v, float m, float tam, float constant_desti, float constant_lider, color c
  boid1 = new ArrayList<Particula>();
  for (int i = 0; i < 20; i++) {
    boid1.add(new Particula(false, new PVector(random(width), random(height)), new PVector(random(-1, 1), random(-1, 1)), 5, 10, 0.2, 0.8, 0.01, color(255, 0, 0)));
  }  //K desti = 0.2, K lider = 0.4, K friccio = 0.02
  boid2 = new ArrayList<Particula>();
  for (int i = 0; i < 20; i++) {
    boid2.add(new Particula(false, new PVector(random(width), random(height)), new PVector(random(-1, 1), random(-1, 1)), 5, 10, 0.8, 0.2, 0.01, color(0, 255, 0)));
  }  //K desti = 0.8, K lider = 0.1, K friccio = 0.02
  lider = new Particula(true, new PVector(width / 2.0, height - 30),
      new PVector(0.0, 0.0), 1.0, 45.0, 0.9, 0, 0.6, color(0, 0, 255));  //K desti = 0.9, K lider = 0, K friccio = 0.02*/
}

void draw() {
  background(0);
  //BOLA
  // Actualiza posició elipse
  corba currentCorba = corbes.get(currentCorbaIndex);
  interpolate(u, currentCorba);
  
  //desti
  pushMatrix();
  translate(desti.x, desti.y, 0);
  fill(255, 255, 0);
  box(20);
  popMatrix();

  fill(0, 0, 255);
  translate(lider.posicio_particula.x, lider.posicio_particula.y, 0);
  sphere(50);

  // Incrementa u
  if (currentCorbaIndex < 3) {
    if (currentCorbaIndex != 2) { //Perquè pari un cop arribi a la ultima corba
      u += 0.005;  
    }
  }

  if (u > 1 && currentCorbaIndex < 3) {
    u = 0;
    if (currentCorbaIndex != 2) { //Perquè pari un cop arribi a la ultima corba
      currentCorbaIndex++;
    }

    /*if (currentCorbaIndex >= corbes.size()) { //Perquè torni a la primera corba
     currentCorbaIndex = 0;
     }*/
  }

  //Pintar la CORBA
  for (int i = 0; i<corbes.size(); i++) {
    //corbes.get(i).pintar();
    //corbes.get(i).pintarCaixa();
  }
  //Calcular coeficients
  for (int i = 0; i<corbes.size(); i++) {
    corbes.get(i).Calcular_coefs();
  }
  
  for (Particula p : boid1) {
    p.calcula_particula();
    p.pinta_particula();
  }

  for (Particula p : boid2) {
    p.calcula_particula();
    p.pinta_particula();
  }
}