PVector P0, P1, P2, P3;
float C0x, C1x, C2x, C3x;
float C0y, C1y, C2y, C3y;
float u;
float posX, posY;
//Fem un array de corbes perquè vagi el líder
ArrayList<corba> corbes = new ArrayList<corba>();
int currentCorbaIndex = 0; //Per saber en quina corba estem

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
      if(i==0 || i==3){
        ellipse(punts_ctrl[i].x, punts_ctrl[i].y, 25, 25);
      }
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
