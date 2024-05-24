//Un sistema de particules necessita estructura
//Una bona manera d'estructurar es tenir objectes
//Els objectes es creen amb classes
//una particula pot ser un objecte! i moltes tb

//Variables i objectes
float increment_temps = 0.04;
particula[] p1;
particula[] p2;
int particulas = 100;
//Funcions i classes
class particula {
  //Atributs
  PVector pos_particula;
  PVector vel_particula;
  PVector acc_particula;
  float massa;
  float tamany;
  color color_particula;
  //Constructor
  particula(PVector p, PVector v, float m, float tam, color c ) {
    pos_particula = new PVector(0.0, 0.0);
    vel_particula = new PVector(0.0, 0.0);
    acc_particula = new PVector(0.0, 0.0);
    pos_particula.set(p);
    vel_particula.set(new PVector(random(20),random(20)));

    massa = m;
    tamany = tam;
    color_particula = c;
  }
  //Metodes
  void calcula_particula() {
    PVector acum_forca;
    acum_forca= new PVector(0.0, 0.0);
    //Solver euler
    //0)Acum força
    acum_forca.x = 0.0;
    acum_forca.y = 9.8;
    //Es pot afegir mes forces
    //1) Acceleracio
    acc_particula.x = acum_forca.x / massa;
    acc_particula.y = acum_forca.y / massa;
    //2) Velocitat
    vel_particula.x=vel_particula.x+acc_particula.x*increment_temps;
    vel_particula.y=vel_particula.y+acc_particula.y*increment_temps;
    //3) Posicio
    pos_particula.x=pos_particula.x+vel_particula.x*increment_temps;
    pos_particula.y=pos_particula.y+vel_particula.y*increment_temps;
  }


  void pinta_particula() {
    fill(color_particula);
    ellipse(pos_particula.x, pos_particula.y, tamany, tamany);
  }
}

void setup() {
  size(800, 800);
  p1 = new particula[particulas];
  p2 = new particula[particulas];
  for (int i=0; i<particulas; i++) {
    p1[i]= new particula(new PVector(width/2, height/10), new PVector(-10, -30), 1, 30, color(255, 0, 0));
    p2[i]= new particula(new PVector(width/2, height/10), new PVector(10, -30), 1, 30, color(0, 0, 255));
  }
}

void draw() {
  background(0);
  //Calcular
  for (int i=0; i<100; i++) {
    p1[i].calcula_particula();
    p2[i].calcula_particula();
  }
  //Pintar
  for (int i=0; i<100; i++) {
    p1[i].pinta_particula();
    p2[i].pinta_particula();
  }
}
