float increment_temps = 0.7;
PVector desti;
Particula[] boid1;
//ArrayList<Particula> boid2;
Particula lider;

class Particula {
  // Atributs
  PVector posicio_particula;
  PVector velocitat_particula;
  PVector acceleracio_particula;
  boolean soc_lider;
  float massa_particula;
  float tamany_particula;
  float constant_desti, constant_lider, constant_friccio, constant_vent;
  color color_particula;
  boolean activarFriccio = true;
  boolean activarVent = true;
  // Constructor
  Particula(boolean l, PVector p, PVector v, float m, float tam, float const_d, float const_l, float const_f, float const_v, color c) {
    posicio_particula = new PVector(0.0, 0.0);
    velocitat_particula = new PVector(0.0, 0.0);
    acceleracio_particula = new PVector(0.0, 0.0);

    posicio_particula.set(p);
    velocitat_particula.set(v);

    massa_particula = m;
    tamany_particula = tam;
    color_particula = c;

    constant_lider = const_l;
    constant_desti = const_d;
    soc_lider = l;
    constant_friccio = const_f;
    constant_vent = const_v;
  }
  // Metodes
  void calcula_particula() {
    PVector acumulador_forsa;
    PVector vector_per_usar;
    acumulador_forsa = new PVector(0.0, 0.0);
    vector_per_usar = new PVector(0.0, 0.0);
    // Solver Euler
    // 0) Acumular les forces
    // Força cap al desti
    vector_per_usar.x = lider.posicio_particula.x - posicio_particula.x;
    vector_per_usar.y = lider.posicio_particula.y - posicio_particula.y;
    // Calcular modul
    float modul = sqrt(vector_per_usar.x * vector_per_usar.x + vector_per_usar.y * vector_per_usar.y); //distancialider
    if (modul != 0) {
      // Fer el vector unitari (Vector / modul)
      vector_per_usar.x /= modul;
      vector_per_usar.y /= modul;
      // Multipliquem el vector per la seva constant associada
      vector_per_usar.x *= constant_desti;
      vector_per_usar.y *= constant_desti;
      // Ara el vector ja és la força que necessitem per anar al destí
      acumulador_forsa.x = vector_per_usar.x;
      acumulador_forsa.y = vector_per_usar.y;
    }

    // Força cap al lider
    if (!soc_lider) {
      // Calculo el vector del boid al lider
      vector_per_usar.x = lider.posicio_particula.x - posicio_particula.x;
      vector_per_usar.y = lider.posicio_particula.y - posicio_particula.y;
      // Calculo el modul del vector //Component x del vector de la distancia
      modul = sqrt(vector_per_usar.x * vector_per_usar.x + vector_per_usar.y * vector_per_usar.y);
      // Faig unitari el vector(Vector / modul)
      vector_per_usar.x /= modul;
      vector_per_usar.y /= modul;
      // Multiplico el vector per la constant
      vector_per_usar.x *= constant_lider;
      vector_per_usar.y *= constant_lider;
      // Afegeixo la força al acomulador de forces
      acumulador_forsa.x += vector_per_usar.x;
      acumulador_forsa.y += vector_per_usar.y;
    }
    //Força de voxels
    // He de comprovar si la particula esta a dins del voxel o no
    // Anem a calcular els valors Xmin, Ymin, Xmax, Ymax del voxel
    //ULL! Aixo esta esta fatal pq es podria precalcular i fer nomes 1 cop
    // Perque aquests valors no canvien
    PVector xymax_voxel = new PVector(0, 0);
    PVector xymin_voxel = new PVector(0, 0);

  for(int i = 0; i<numCubs;i++){
    xymin_voxel.x = voxel[i].posicio_voxel.x-0.7*voxel[i].ample_voxel;
    xymin_voxel.y = voxel[i].posicio_voxel.y-0.7*voxel[i].alt_voxel;
    xymax_voxel.x = voxel[i].posicio_voxel.x-0.7*voxel[i].ample_voxel;
    xymax_voxel.y = voxel[i].posicio_voxel.y-0.7*voxel[i].alt_voxel;

    if ((posicio_particula.x>xymin_voxel.x) && (posicio_particula.x<xymax_voxel.x) && (posicio_particula.y>xymin_voxel.y) && (posicio_particula.y<xymax_voxel.y)) {
      // Som dins del voxel
      acumulador_forsa.x += voxel[i].forsa_dins_voxel.x;
      acumulador_forsa.y += voxel[i].forsa_dins_voxel.y;
    }
  }
    
    // Força de friccio
    if (activarFriccio) {
      acumulador_forsa.x += -1.0 * constant_friccio * velocitat_particula.x;
      acumulador_forsa.y += -1.0 * constant_friccio * velocitat_particula.y;
      textSize(100);
      text("Fricció: Activada", 1000, 800);
      fill(255);
    } else {
      textSize(100);
      text("Fricció: Desactivada", 1000, 800);
      fill(255);
    }

    // Força del vent
    if (activarVent) {
      acumulador_forsa.x += -1.0 * constant_vent * velocitat_particula.x;
      acumulador_forsa.y += -1.0 * constant_vent * velocitat_particula.y;
      textSize(100);
      text("Vent: Activat", 1000, 900);
      fill(255);
    } else {
      textSize(100);
      text("Vent: Desactivat", 1000, 900);
      fill(255);
    }

    // 1) Acceleracio
    acceleracio_particula.x = acumulador_forsa.x / massa_particula;
    acceleracio_particula.y = acumulador_forsa.y / massa_particula;
    // 2) Velocitat
    velocitat_particula.x = velocitat_particula.x
      + acceleracio_particula.x * increment_temps;
    velocitat_particula.y = velocitat_particula.y
      + acceleracio_particula.y * increment_temps;
    // 3) Posicio
    posicio_particula.x = posicio_particula.x
      + velocitat_particula.x * increment_temps;
    posicio_particula.y = posicio_particula.y
      + velocitat_particula.y * increment_temps;

    // Col·lisions amb altres partícules
    for (int i = 0; i < boid1.length; i++) {
      Particula other = boid1[i];
      if (other != this) { //Si una altre particula no es ella mateixa
        float dx = posicio_particula.x - other.posicio_particula.x; //Component x del vector de la distancia
        float dy = posicio_particula.y - other.posicio_particula.y;  //Component y del vector de la distancia
        float dist = sqrt(dx * dx + dy * dy); // Fem modul per saber la distancia
        if (dist < tamany_particula + other.tamany_particula) {
          // NNormalitzem el vector de la colisio
          float normalX = dx / dist; //Component x
          float normalY = dy / dist; //Component y

          // Calculem la velocitat relativa, que es la diferencia de velocitat entre les dues particules, per poder fer el impuls/repulsió
          float relativaX = velocitat_particula.x - other.velocitat_particula.x;
          float relativaY = velocitat_particula.y - other.velocitat_particula.y;

          // Calculem la velocitat del vector normal
          float vn = relativaX * normalX + relativaY * normalY;

          // Si s'esten separant/repelent, que no faci res
          if (vn < 0) {
            // Calcula el impuls
            float j = -vn * 0.05;
            float ix = j * normalX; //Coordenada X de la força del impu
            float iy = j * normalY;

            // Aplica el impuls
            velocitat_particula.x -= ix;
            velocitat_particula.y -= iy;
            other.velocitat_particula.x += ix;
            other.velocitat_particula.y += iy;
          }
        }
      }
    }
  }


  void pinta_particula() {
    pushMatrix();
    //stroke(random(0,255), random(0,255), random(0,255));
    noStroke();
    translate(posicio_particula.x, posicio_particula.y, posicio_particula.z);
    sphere(tamany_particula);
    popMatrix();
  }
  
  void checkFriccio() {
    if (activarFriccio) println("Friccio activada");
    else println("Friccio desactivada");
  }

  void checkVent() {
    if (activarVent) println("Vent activat");
    else println("Vent desactivat");
  }
}
