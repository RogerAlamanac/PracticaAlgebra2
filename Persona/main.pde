//Variables
float angleX=30.0;
float angleY=60.0;
boolean tornLechuga; //Per saber quan li toca moure al jugador
boolean tornDonut;
boolean modeLechuga;// Tindran mode Atac i Defensa
boolean modeDonut;
int tempsRef;
int distanciaMax;
int tempsRecorregut;
int distanciaRec;
int lifes;
boolean LUT1;
boolean LUT2;

//Setup
void setup() {
  size(900, 700);
  //Inicialitzem
  lechuga = loadImage("Lechuga.png");
  lechugaLUT1 = loadImage("Lechuga.png");
  lechugaLUT2 = loadImage("Lechuga.png");
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
  modeLechuga = true;//False es mode DEFENSA
  modeDonut = false; //True es mode ATAC
  distanciaMax = 300;
  distanciaRec = 0;
  lifes = 3;
}
//Draw
void draw() {
  background(fondo);
  if (menu== true)
    drawMenu();

  if (menu == false) {
    background(199, 228, 248);

    Timer();
    if (tornDonut) {
      moverDonut();
      fill(0);
      textSize(16);
      text("DISTANCIA:", 810, height/2 + 250);
      text(distanciaRec, 810, height/2 + 270);
      text("TURNO: DONUT", width/10, height/2 + 250);
      text("VIDAS:", width/2, height/2 + 250);
      text(lifes, width/2 + 27, height/2 + 250);
    } else if (tornLechuga) {
      MoverLechuga();
      fill(0);
      textSize(16);
      text("DISTANCIA:", 810, height/2 + 250);
      text(distanciaRec, 810, height/2 + 270);
      text("TURNO: LECHUGA", width/10, height/2 + 250);
      text("VIDAS:", width/2, height/2 + 250);
      text(lifes, width/2 + 27, height/2 + 250);
    }
    if (!LUT1 && !LUT2)
      Lechuga();

    if (LUT1) {
      
      LUT1();
    }
    Donut();
    Persona();

    ColisionPvP();
    ColisionPerson();
  }
}
void Timer() {
  if (tornLechuga==false&&tornDonut==true&&menu==false) {//Per calcular temps de torn del donut
    println(distanciaRec);
  }
  if (distanciaRec>distanciaMax&&tornLechuga==false&&tornDonut==true&&menu==false) {
    tornLechuga=true;
    tornDonut=false;
    distanciaRec=0;
  }
  if (tornLechuga==true&&tornDonut==false&&menu==false) {//Per calcular temps de torn de la lechuga
    println(distanciaRec);
  }
  if (distanciaRec>distanciaMax && tornLechuga==true && tornDonut==false&&menu==false) {
    tornLechuga=false;
    tornDonut=true;
    distanciaRec=0;
  }
}
