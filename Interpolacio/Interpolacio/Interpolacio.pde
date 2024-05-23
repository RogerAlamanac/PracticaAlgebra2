PVector P0, P1, P2, P3;
float C0x, C1x, C2x, C3x;
float C0y, C1y, C2y, C3y;
float u;
float posX, posY;
corba la_primera_corba;

//CLASSE CORBA
class corba {
  PVector[] punts_ctrl; //Per on passa
  PVector[] coefs; // Governen l'eqüació
  color color_corva; // Pintar-la
  int gruix_corva; //Pintar-la
  int num_punts; //Cada qun volem pintar un punt
  //Constructor
  corba(PVector[] pc, int np) {
    punts_ctrl = new PVector[4]; //Hi ha 4 punts de control
    coefs = new PVector[4];
    for (int i=0; i<4; i++) {
      punts_ctrl[i] = new PVector(0.0, 0.0);
      coefs[i] = new PVector (0.0, 0.0);
      // Copiem els 4 punts de ctrl que ens han passat
      punts_ctrl[i] = pc[i];
    }
    num_punts = np;
  }

    //Mètodes
    void Calcular_coefs() {
      //Necessitem les equcions de la corba d'interpolació
      // C0 = P0
      coefs[0].x = punts_ctrl[0].x;
      coefs[0].y = punts_ctrl[0].y;
      // C1 = -5.5P0+9P1-4.5P2+P3
      coefs[1].x = -3*punts_ctrl[0].x+3*punts_ctrl[1].x;
      coefs[1].y = -3*punts_ctrl[0].y+3*punts_ctrl[1].y;
      //C2 = 9P0-22.5P1+18P2-4.5P3
      coefs[2].x = 3*punts_ctrl[0].x-6*punts_ctrl[1].x +3*punts_ctrl[2].x;
      coefs[2].y = 3*punts_ctrl[0].y-6*punts_ctrl[1].y +3*punts_ctrl[2].y;
      // C3= -4.5P0+13.5P1-13.5P2+4.5P3
      coefs[3].x = -punts_ctrl[0].x+3*punts_ctrl[1].x - 3*punts_ctrl[2].x+punts_ctrl[3].x;
      coefs[3].y = -punts_ctrl[0].y+3*punts_ctrl[1].y - 3*punts_ctrl[2].y+punts_ctrl[3].y;
    }

    void pintar() {
      //Comencem pintant els punts_ctrl
      fill(255, 0, 0);
      strokeWeight(3);
      stroke(255);
      for (int i = 0; i<4; i++) {
        ellipse(punts_ctrl[i].x, punts_ctrl[i].y, 25, 25);
      }
      //Seguim pintant punts corba --> son tants com decidim
      stroke(255, 255, 0);
      strokeWeight(15);
      //corba(u) = C0 + C1*u +c2*u2 + C3*u3,
      PVector punt_a_pintar;
      punt_a_pintar = new PVector(0.0, 0.0);
      float interval;
      interval = 1.0/num_punts;
      for (float u=0.0; u<=1.0; u+=interval) {
        punt_a_pintar.x= coefs[0].x + coefs[1].x*u + coefs[2].x*sq(u)+coefs[3].x*sq(u)*u;
        punt_a_pintar.y= coefs[0].y + coefs[1].y*u + coefs[2].y*sq(u)+coefs[3].y*sq(u)*u;
        point(punt_a_pintar.x, punt_a_pintar.y);
      }
    }

    void pintarCaixa() {
      stroke(255);
      line(punts_ctrl[0].x, punts_ctrl[0].y, punts_ctrl[1].x, punts_ctrl[1].y);
      line(punts_ctrl[1].x, punts_ctrl[1].y, punts_ctrl[3].x, punts_ctrl[3].y);
      line(punts_ctrl[3].x, punts_ctrl[3].y, punts_ctrl[2].x, punts_ctrl[2].y);
      line(punts_ctrl[2].x, punts_ctrl[2].y, punts_ctrl[0].x, punts_ctrl[0].y);
    }
  }
  void setup() {
    size(800, 600, P3D);
    //CORBA
    PVector p[];
    p = new PVector[4];
    p[0] = new PVector(100, 500, 300);
    p[1] = new PVector(300, -500, 400);
    p[2] = new PVector(400, 400, 250);
    p[3] = new PVector(700, 100, 100);
    // Crido al construcotr de la corba
    la_primera_corba = new corba(p, 100);
    
    //BOLA
    P0 = new PVector(p[0].x, p[0].y, p[0].z);
    P1 = new PVector(p[1].x, p[1].y, p[1].z);
    P2 = new PVector(p[2].x, p[2].y, p[2].z);
    P3 = new PVector(p[3].x, p[3].y, p[3].z);

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
    background(0);
    //BOLA
    // Actualiza posició elipse
    interpolate(u);

    fill(0, 0, 255);
    ellipse(posX, posY, 50, 50);

    // Incrementa u
    u += 0.005;
    if (u > 1) {
      u = 0;
    }

    //Pintar la CORBA
    la_primera_corba.pintar();
    la_primera_corba.Calcular_coefs();
    la_primera_corba.pintarCaixa();
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
  void interpolate(float u) {
    float u2 = u * u;
    float u3 = u * u * u;

    posX = C0x + C1x * u + C2x * u2 + C3x * u3;
    posY = C0y + C1y * u + C2y * u2 + C3y * u3;
  }
  
