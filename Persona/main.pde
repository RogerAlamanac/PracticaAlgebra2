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
boolean gameOver;
PImage[] lifesLechuga;
PImage[] lifesDonut;
boolean LechugaWin;
boolean DonutWin;

//Setup
void setup() {
  size(900, 700);
  //Inicialitzem imatges
  lechuga = loadImage("Lechuga.png");
  donut = loadImage("Donut.png");
  nevera = loadImage("nevera.png");
  fondo = loadImage ("Fondo.png");
  fondoLUT = loadImage ("Fondo.png");
  lechugaLuma = loadImage ("Lechuga.png");
  donutLuma = loadImage("Donut.png");
  //Inicialitzem totes les variables
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
  LechugaWin = false;
  DonutWin = false;
  distanciaMax = 300;
  distanciaRec = 0;
  lifes = 3;
  numColisions=0;
  gameOver = false;
  lifesLechuga = new PImage[lifes];
  lifesDonut = new PImage[lifes];
  for (int i = 0; i < lifesLechuga.length; i++) {
    lifesLechuga[i] = loadImage( "Lechuga.png");
  }

  // Cargar las imágenes de las vidas del donut
  for (int i = 0; i < lifesDonut.length; i++) {
    lifesDonut[i] = loadImage("Donut.png");
  }
  
}
//Draw
void draw() {
  background(fondo);
  if (menu== true)
    drawMenu();

  if (menu == false) {
    background(199, 228, 248);
    Init();
    GenLifes();
    GameOverCheck();
    if (gameOver) {
      EscenaFinal();
    }
  }
}


void Timer() {
  if (tornLechuga==false&&tornDonut==true&&menu==false) {//Per calcular la distància recorreguda del donut
    println(distanciaRec);
  }
  if (distanciaRec>distanciaMax&&tornLechuga==false&&tornDonut==true&&menu==false) {
    tornLechuga=true;
    tornDonut=false;
    distanciaRec=0;
  }
  if (tornLechuga==true&&tornDonut==false&&menu==false) {//Per calcular la distància recorreguda de la lechuga
    println(distanciaRec);
  }
  if (distanciaRec>distanciaMax && tornLechuga==true && tornDonut==false&&menu==false) {
    tornLechuga=false;
    tornDonut=true;
    distanciaRec=0;
  }
}

void Info() {//Informació que surt en pantalla (vides, torn...)
  if (tornDonut) {
    moverDonut();
    fill(0);
    textSize(16);
    text("TURNO: DONUT", width/10, height/2 + 250);
  } else if (tornLechuga) {
    MoverLechuga();
    fill(0);
    textSize(16);
    text("TURNO: LECHUGA", width/10, height/2 + 250);
  }
  if (modeDonut) {
    text("ATACA: DONUT", width/2, height/10);
  } else if (modeLechuga) {
    text("ATACA: LECHUGA", width/2, height/10);
  }
  text("DISTANCIA:", 810, height/2 + 250);
  text(distanciaRec, 810, height/2 + 270);
  text("VIDAS:", width/2, height/2 + 250);
  text(lifes, width/2 + 27, height/2 + 250);
}

void Init() {
  Timer();
  Info();
  Lechuga();
  Donut();
  Persona();
  ColisionPvP();
  ColisionPerson();
}

void GameOverCheck() {//Comprovem si el joc s'ha acabat
  if (numColisions >= 3 || numColisions <=-3||LechugaWin||DonutWin) gameOver = true;
}

void GenLifes() { //Generem les vides
  if (modeLechuga) {
    for (int i = 0; i < lifesLechuga.length; i++) {
      image(lifesLechuga[i], 20 + i * 30, height - 50);
      lifesLechuga[i].resize(40, 40);
    }
  } else if (modeDonut) {
    for (int i = 0; i < lifesDonut.length; i++) {
      image(lifesDonut[i], width - 70 - i * 30, height - 50);
      lifesDonut[i].resize(40, 40);
    }
  }
}
