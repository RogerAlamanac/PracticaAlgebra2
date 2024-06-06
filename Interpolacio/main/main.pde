PVector[] p1, p2, p3, p4; //Les diferents corbes
int numCubs = 4; // Número 'obstacles
PVector[] posicions = new PVector[numCubs]; // posició obstacles
float cubSize = 100; // Mida obstacles

void setup() {
  size(1900, 1000, P3D);

  camZ = (height / 2.0) / tan(PI / 6.0); // Distancia de la càmara
  //Inicialitzo el desti
  desti = new PVector(mouseX, mouseY);
  //CORBA
  // Crear múltiples corbes
  p1 = new PVector[]{new PVector(100, 800, 100), new PVector(200, 100, 200), new PVector(400, 300, 593), new PVector(600, 100, 170)};
  p2 = new PVector[]{new PVector(600, 100, 170), new PVector(700, 500, 264), new PVector(500, 200, 264), new PVector(1000, 800, 375)};
  p3 = new PVector[]{new PVector(1000, 800, 375), new PVector(100, 300, 628), new PVector(200, 600, 325), new PVector(300, 632, 700)};
  p4 = new PVector[]{new PVector(300, 632, 700), new PVector(400, 300, 628), new PVector(300, 610, 78593), new PVector(mouseX, mouseY, 200)};

  // Crido al constructor de la corba
  corbes.add(new corba(p1, 500));
  corbes.add(new corba(p2, 500));
  corbes.add(new corba(p3, 500));
  corbes.add(new corba(p4, 500));

  for (int i = 0; i < corbes.size(); i++) {
    corbes.get(i).Calcular_coefs();
  }

  Lider();
  // Inicializació bola
  u = 0; // Inici curva
  frameRate(60); // Fotogrames

  // Inicialitzo les particules
  // Constructor = PVector p, PVector v, float m, float tam, float constant_desti, float constant_lider, color c
  boid1 = new ArrayList<Particula>();
  for (int i = 0; i < 20; i++) {
    boid1.add(new Particula(false, new PVector(random(width), random(height)), new PVector(random(-1, 1), random(-1, 1)), 5, 10, 0.2, 0.8, 0.01, color(255, 0, 0)));
  }  //K desti = 0.2, K lider = 0.4, K friccio = 0.02
  boid2 = new ArrayList<Particula>();
  for (int i = 0; i < 20; i++) {
    boid2.add(new Particula(false, new PVector(random(width), random(height)), new PVector(random(-1, 1), random(-1, 1)), 5, 10, 0.8, 0.8, 0.01, color(0, 255, 0)));
  }  //K desti = 0.8, K lider = 0.1, K friccio = 0.02
  lider = new Particula(true, new PVector(width / 2.0, height - 30),
    new PVector(0.03, 0.03), 1.0, 45.0, 0.9, 0, 0.6, color(0, 0, 255));  //K desti = 0.9, K lider = 0, K friccio = 0.02*/
  // Ini. voxel
  primer_voxel = new voxel(new PVector (100, -100), new PVector (width/2, height/2), 100.0, 100.0, color(200));
  
  for (int i = 0; i < numCubs; i++) {
    // Generar posicions aleatories per cada obstacle
    float x = random(cubSize, width - cubSize);
    float y = random(cubSize, height - cubSize);
    float z = random(-200, 200); 
    posicions[i] = new PVector(x, y, z);
  }
}

void draw() {
  background(0);
  //Configuració de la càmara
  setupCamera();
   if (isIsometric) { //Per poder posar la vista isometrica
    rotateX(-PI / 6);
    rotateY(PI / 4);
  }
  
  //BOLA
  // Actualiza posició elipse
  corba currentCorba = corbes.get(currentCorbaIndex);
  interpolate(u, currentCorba);

  // Destí
  pushMatrix();
  translate(desti.x, desti.y, 0);
  fill(255, 255, 0);
  box(20);
  popMatrix();

  // Dibujar el líder sin afectar a los boids
  pushMatrix();
  translate(lider.posicio_particula.x, lider.posicio_particula.y, lider.posicio_particula.z);
  strokeWeight(3);
  stroke(0, 0, 255);
  sphere(25); // radio de la esfera es 25
  popMatrix();

  /* fill(0, 0, 255);
   ellipse(lider.posicio_particula.x, lider.posicio_particula.y, 50, 50);*/

  // Incrementa u
  u += 0.003;

  if (u > 1.0) {
    u = 0; // Reiniciamos u a 0 al finalizar cada curva
    // Avanzar a la siguiente curva
    currentCorbaIndex++;

    if (currentCorbaIndex >= corbes.size()) {
      currentCorbaIndex = 0; // Volver a la primera curva al finalizar todas las curvas
    }
  }
  //Pintar la CORBA
  for (int i = 0; i<corbes.size(); i++) {
    corbes.get(i).pintar();
    //corbes.get(i).pintarCaixa();
  }
  //Calcular coeficients
  for (int i = 0; i<corbes.size(); i++) {
    corbes.get(i).Calcular_coefs();
  }

  for (Particula p : boid1) { //Hem fet un iterador perquè vagi passant per cada particula, és més pràctic
    p.calcula_particula();
    p.pinta_particula();
   // checkCollision(p, lider);
  }

  for (Particula p : boid2) {
    p.calcula_particula();
    p.pinta_particula();
     //checkCollision(p, lider);
  }
  
  //obstacles
  fill(255, 165, 0);//Pintem els obstacles
  stroke(255);
 strokeWeight(5);
  for (int i = 0; i < numCubs; i++) {
    PVector pos = posicions[i];
    pushMatrix(); 
    translate(pos.x, pos.y, pos.z); // Moure a la posició del cub
    box(cubSize); // Dibuixar el cub
    popMatrix(); 
  }
    // Detectar colisiones con voxel
  //Colisions();
  

  //pinta voxels
  //primer_voxel.pintar_voxel();
}



void mouseMoved() {

  desti.x = mouseX;
  desti.y = mouseY;
  if (currentCorbaIndex == 3) {
    p4[3].x = mouseX;
    p4[3].y = mouseY;
  }
}
