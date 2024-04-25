//Variables
float angleX=30.0;
float angleY=60.0;
boolean tornLechuga; //Per saber quan li toca moure al jugador
boolean tornDonut;
boolean modeLechuga;// Tindran mode Atac i Defensa
boolean modeDonut;
float temps;
float tempsTorn;

//Setup
void setup() {
  size(900, 700);
  //Inicialitzem
  lechuga = loadImage("Lechuga.png");
  donut = loadImage("Donut.png");
  nevera = loadImage("nevera.png");
  fondo = loadImage ("Fondo.png");
  pxLechuga=width/4;
  pyLechuga=height/2;
  pxDonut = width/2+300;
  pyDonut = height/2;
  pxNevera= width /2 - nevera.width /1.56 ;
  pyNevera= height/2 - nevera.height /1.56;
  tornLechuga = false;
  tornDonut = true; //Comença movent el donut
  modeLechuga = false;//False es mode DEFENSA
  modeDonut = true; //True es mode ATAC
  temps = 0;
  tempsTorn = 3000;
}
//Draw
void draw() {
  background(fondo);
  if (menu== true)
    drawMenu();

  if (menu == false) {
    background(199, 228, 248);
    Lechuga();
    Donut();
    Persona();
    Timer();
    if (tornDonut==true) {
      moverDonut();
    } else if (tornLechuga==true) {
      MoverLechuga();
    }
    ColisionPvP();
    ColisionPerson();
  }
}
void Timer() {
  if (tornLechuga==false&&tornDonut==true) {//Per calcular temps de torn del donut
    delay(1);
    temps = millis();
    println(temps);
  }
  if (temps>tempsTorn&&tornLechuga==false&&tornDonut==true) {
    tornLechuga=true;
    tornDonut=false;
    temps=0;
  }
  if (tornLechuga==true&&tornDonut==false) {//Per calcular temps de torn de la lechuga   
    println(temps);
  }
  if (temps>tempsTorn && tornLechuga==true && tornDonut==false) {
    tornLechuga=false;
    tornDonut=true;
    temps=0;
  }
}
