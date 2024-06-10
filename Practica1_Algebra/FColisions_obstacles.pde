float[] ObstaclesX;//Posicions on estan situats els obstacles
float[] ObstaclesY;
float[] ObstaclesType; // Array para almacenar el tipo de forma de cada obstáculo (0 para rectángulo, 1 para círculo)
float WidthObstacles;//Mida dels obstacles
float HeightObstacles;
int amount_obstacles = 12;
boolean colisio;

void Obstacles(){ //Apliquem la tecnica del Kaleidoscopi perquè es generi a tots els quadrants i quedi simètric i bonic
  fill(255);  
  for (int i=0;i<amount_obstacles;i++){
    rectMode(CENTER);
     // Dibujar un rectángulo si el tipo es 0
    rect(ObstaclesX[i], ObstaclesY[i], WidthObstacles, HeightObstacles,28);//1r quadrant
    
 
 ColisionsObj();
}
}
 void ColisionsObj(){
 for(int i = 0;i<amount_obstacles;i++){

    for (int j = 0; j < amount_obstacles; j++) {
    float distancia = dist(xPJ, yPJ, ObstaclesX[j], ObstaclesY[j]);
    float ColisioX = (radius_pc) + (WidthObstacles / 2);
    float ColisioY = (radius_pc) + (HeightObstacles / 2);
    if (distancia < ColisioX||distancia < ColisioY) {
      // Colisio
      // Evitar superposicio
      float angulo = atan2(yPJ - ObstaclesY[i], xPJ - ObstaclesX[i]);
      float nuevaDistanciaX = ColisioX + 10; // Evitar superposición
      float nuevaDistanciaY = ColisioY + 10; // Evitar superposición
      xPJ = ObstaclesX[j] + cos(angulo) * nuevaDistanciaX;
      yPJ = ObstaclesY[j] + sin(angulo) * nuevaDistanciaY;
    }
    }
   }
 }
