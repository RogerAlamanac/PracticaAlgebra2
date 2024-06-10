float increment_temps = 0.7;
PVector desti;
ArrayList<Particula> boid1;
ArrayList<Particula> boid2;
Particula lider;

class Particula {
  // Atributs
  PVector posicio_particula;
  PVector velocitat_particula;
  PVector acceleracio_particula;
  boolean soc_lider;
  float massa_particula;
  float tamany_particula;
  float constant_desti, constant_lider, constant_friccio;
  color color_particula;
  // Constructor
  Particula(boolean l, PVector p, PVector v, float m, float tam, float const_d, float const_l, float const_f, color c) {
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
    constant_friccio = const_f;
    soc_lider = l;
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
    float modul = sqrt(vector_per_usar.x * vector_per_usar.x + vector_per_usar.y * vector_per_usar.y);
    if(modul != 0){
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
      // Calculo el modul del vector
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
    PVector xymax_voxel = new PVector(0,0);
    PVector xymin_voxel = new PVector(0,0);
    xymin_voxel.x = primer_voxel.posicio_voxel.x-0.7*primer_voxel.ample_voxel;
    xymin_voxel.y = primer_voxel.posicio_voxel.x-0.7*primer_voxel.alt_voxel;
    xymax_voxel.x = primer_voxel.posicio_voxel.x-0.7*primer_voxel.ample_voxel;
    xymax_voxel.y = primer_voxel.posicio_voxel.x-0.7*primer_voxel.alt_voxel;
    
    if((posicio_particula.x>xymin_voxel.x) && (posicio_particula.x<xymax_voxel.x) && (posicio_particula.y>xymin_voxel.y) && (posicio_particula.y<xymax_voxel.y)){
      // Som dins del voxel
      acumulador_forsa.x += primer_voxel.forsa_dins_voxel.x;
    acumulador_forsa.y += primer_voxel.forsa_dins_voxel.y;
      
    }
    // Força de friccio
    acumulador_forsa.x += -1.0 * constant_friccio * velocitat_particula.x;
    acumulador_forsa.y += -1.0 * constant_friccio * velocitat_particula.y;


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
  }

  void pinta_particula() {
    pushMatrix();
    stroke(0,255,0);
    translate(posicio_particula.x, posicio_particula.y,posicio_particula.z);
    sphere(tamany_particula);
    popMatrix();
   
  }
}
