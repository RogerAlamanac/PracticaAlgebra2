// 1) Acceleració = Suma Forces / massa
// 2) Velocitat nova = Velocitat antiga + Acceleració * inc Temps
// 3) Posició nova = posició antiga + Velocitat nova * inc Temps
// Utilitzarem una força de gravetat
//La partícula tindrà una velocitat inicial cap amunt

//Variables
//Particula
/*PVector pos_particula; // Posicio
PVector vel_particula; // Velocitat
PVector acc_particula; // Acceleracio
float massa_particula;
float tamany_particula;
color color_particula;
// Simulació
float increment_temps;
PVector forca;
//Setup
void setup() {
  // Inicialització
  pos_particula= new PVector(0.0, 0.0); // Posicio (metres)
  vel_particula= new PVector(0.0, 0.0); // Velocitat (m/s)
  acc_particula= new PVector(0.0, 0.0); // Acceleracio (m/s2)
  massa_particula=1.0; //Kg
  tamany_particula=80.0; //metres
  color_particula = color(255, 0, 0);
  // Simulació
  increment_temps=0.04; // Segons
  forca= new PVector(0.0, 0.0); // newtons

  //Valors inicials de la simulació
  pos_particula.x = width/2;
  pos_particula.y = height/2.0;
  vel_particula.x = 25.0; //Dreta
  vel_particula.y = -50.0; //Amunt
  forca.x = 0.0; // No hi ha gravetat horitzontal
  forca.y = 9.8; // La gravetat es vertical i cap abaix


  //Finestra
  size(800, 800);
}
//Draw
void draw() {
  background(0);
  //Calculem
  acc_particula.x=forca.x/massa_particula;
  acc_particula.y=forca.y/massa_particula;
  vel_particula.x=vel_particula.x+acc_particula.x*increment_temps;
  vel_particula.y=vel_particula.y+acc_particula.y*increment_temps;
  pos_particula.x=pos_particula.x+vel_particula.x*increment_temps;
  pos_particula.y=pos_particula.y+vel_particula.y*increment_temps;
  // Pintem
  fill(color_particula);
  ellipse(pos_particula.x,pos_particula.y, tamany_particula, tamany_particula);
}*/
