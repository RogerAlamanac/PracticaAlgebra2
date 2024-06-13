
float distanciaColisioBoid1;
float distanciaColisioBoid2;

void ColisionsObstacles() {
  for (int i = 0; i<numCubs; i++) {// voxel v : primer_voxel){
    for (Particula p : boid1) { //Iterador que pasa per totes les partícules del array
      distanciaColisioBoid1 = sqrt((p.posicio_particula.x - voxel[i].posicio_voxel.x)*(p.posicio_particula.x - voxel[i].posicio_voxel.x) +
        (p.posicio_particula.y - voxel[i].posicio_voxel.y)*(p.posicio_particula.y - voxel[i].posicio_voxel.y) + (p.posicio_particula.z - 
        voxel[i].posicio_voxel.z)*(p.posicio_particula.z - voxel[i].posicio_voxel.z)); //Formmula de la distancia

      if (distanciaColisioBoid1 < 80) { //Si la distància es més petita que el "radi" del voxel, que s'impulsi la particula cap enrere 
        p.velocitat_particula.x = -p.velocitat_particula.x*1.5; //Perque no avanci quan colisiona, canviem velocitat de negativa
        p.velocitat_particula.y = -p.velocitat_particula.y*1.5;
        p.velocitat_particula.z = -p.velocitat_particula.z*1.5;
        println("Colisio amb ", voxel[i]);
      }
    }
  }
}
