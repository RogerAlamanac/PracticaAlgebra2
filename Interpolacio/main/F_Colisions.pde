
float distanciaColisioBoid1;
float distanciaColisioBoid2;

void ColisionsObstacles() {
  for (int i = 0; i<numCubs; i++) {// voxel v : primer_voxel){
    PVector pos = posicions[i];
    for (Particula p : boid1) {
      distanciaColisioBoid1 = sqrt((p.posicio_particula.x - pos.x)*(p.posicio_particula.x - pos.x) +
        (p.posicio_particula.y - pos.y)*(p.posicio_particula.y - pos.y) + (p.posicio_particula.z - pos.z)*(p.posicio_particula.z - pos.z)); //Formmula de la distancia

      if (distanciaColisioBoid1 < 50) {
        
        p.posicio_particula.x = 100000;
        p.posicio_particula.y = 100000;
        p.posicio_particula.z = 100000;
        println("Colisio amb boid1");
      }
    }
  }
/*   for (int i = 0; i<numCubs; i++) {// voxel v : primer_voxel){
    PVector pos = posicions[i];
    for (Particula p : boid2) {
      distanciaColisioBoid2 = sqrt((p.posicio_particula.x - pos.x)*(p.posicio_particula.x - pos.x) +
        (p.posicio_particula.y - pos.y)*(p.posicio_particula.y - pos.y) + (p.posicio_particula.z - pos.z)*(p.posicio_particula.z - pos.z)); //Formmula de la distancia

      if (distanciaColisioBoid2 < 50) {
        p.posicio_particula.x = 100000;
        p.posicio_particula.y = 100000;
        p.posicio_particula.z = 100000;
        println("Colisio amb boid2");
      }
    }
  }*/
}
