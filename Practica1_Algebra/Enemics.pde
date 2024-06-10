//VARIABLES
float Xenemy = width/3.0;//Variables per configurar la mesura dels enemics
float Yenemy = width/3.0;
//Creador de N numeros d'enemics
float[] inicialX; //Coordenada X inicial de l'enemic
float[] inicialY; //Coordenada Y inicial 
float[] finalX; //Coordenada X final
float[] finalY; //Coordenada Y final
float[] enemy_x; //Coordenada x de l'enemic
float[] enemy_y; //Coordenada Y de l'enemic
float[] enemy_quadrant; //Quadrant on apareix l'enemic
int amounts_enemies = numEnemies; //Quantitat d'enemics
float[] radius_enemies; //Radi dels enemics
float[] vector;// vector from PC to any NPC
float[] vectorEnemies; //vector dels enemics cap al PNJ2
float magnitude;// vector size = distance between circles
boolean collided = false; //No colision by defect
float velocitat = 0.2; // Velocitat del Enemic
float maxVelocitat = 3.0; // Velocitat màxima del PNJ
float direccioX=atan2(1,1);//Direccions enemics amb moviment random
float direccioY=atan2(-1,-1);
float direccioEnemics;//Direccio enemics que segueixen al PNJ2;
int tempsO;
float distanciaPJ; //Distancia enemics amb PJ
int score = 0;
boolean accelerating = true; // Estat de l'acceleració

//FUNCIONS
//Funció velocitat
void velocitat() {
    if (accelerating) {
        velocitat += 0.01; // Augmenta la velocitat fins al valor max
        if (velocitat >= maxVelocitat) {
            accelerating = false; // Canvia l'estat a desaccelerant
        }
    } else {
        velocitat -= 0.01; // Redueix la velocitat
        if (velocitat <= 0) {
            accelerating = true; // Canvia l'estat a accelerant
        }
    }
}

//Moviment enemics
void movimentEnemics(){
  //Els enemics es mouen aleatoriament

 for(int counter=0;counter<amounts_enemies/2;counter++){
   radius_enemies[counter]=30.0;
    enemy_x[counter] += velocitat*cos(direccioX);  
    if((enemy_x[counter]>width-radius_enemies[counter])||(enemy_x[counter]<radius_enemies[counter])){
      
      direccioX=-direccioX;
    }
    enemy_y[counter] += velocitat*sin(direccioY);
    if((enemy_y[counter]>height-radius_enemies[counter])||(enemy_y[counter]<radius_enemies[counter])){
     
     direccioY=-direccioY; 
    }
    fill(255,0,0);
    ellipse(enemy_x[counter],enemy_y[counter],radius_enemies[counter],radius_enemies[counter]);
 }

 //Enemics que persegueixen el PNJ2

 for(int counter=amounts_enemies/2;counter<amounts_enemies;counter++){
   radius_enemies[counter]=30.0;
   //Calculem la direcció "estandar" dels enemics
    direccioEnemics=atan2(yPNJ2-enemy_y[counter],xPNJ2-enemy_x[counter]);
    //Calcular direcció X i Y
    direccioX=cos(direccioEnemics)*velocitat;//Calculem els angles per tal de que puguin seguir tots els enemics al PNJ2 en diferents posicions
    direccioY=sin(direccioEnemics)*velocitat;
    enemy_x[counter]+=direccioX;
    enemy_y[counter]+=direccioY;
    
    fill(255,0,0);
    ellipse(enemy_x[counter],enemy_y[counter],radius_enemies[counter],radius_enemies[counter]);
 }
}
//Colisions
 void mouseMoved(){
  vector = new float[2];
  vectorEnemies = new float[2];
  // Updating PC quadrant
  if (xPJ<width/2.0){
      if(yPJ<height/2.0){
        pc_quadrant = 1;
      }
      else{
        pc_quadrant = 4;
      }
    } else{
      if (yPJ<height/2.0){
        pc_quadrant = 2;
      }
      else pc_quadrant = 3;
    }
  // Evaluate colisions
  // We are optimizing thanks to the QuadTree
  for(int counter=0;counter<amounts_enemies;counter++){
    radius_enemies[counter]=30.0;
    // We check quadrants before the calculations
    if(pc_quadrant == enemy_quadrant[counter]){
    // The calculations
    vector[0] = enemy_x[counter] - xPJ;//Vx = NPCx - PCx 
    vector[1] = enemy_y[counter] - yPJ;//Vy = NPCy - PCy
    magnitude = sqrt(vector[0]*vector[0] + vector[1]*vector[1]); //Calculem el modul dels vectors per saber la distancia 
    // Quan el PJ colisioni amb un enemic
    if(magnitude < radius_enemies[counter] + radius_pc){//S'executa la condició si la distancia es més petita que els radis dels enemics i el del jugador, ja que voldrà dir que s'estan tocant, aixi elimina al enemic 
      radius_enemies[counter]=0;
      amounts_enemies--;
      score+=100;
      println("I just collided with ", counter);
      fill(255,0,0);
      textSize(30);
      textAlign(RIGHT,TOP);
      text("+100 Punts", 40, 120); 
    } 
    //Quan un enemic colisioni amb el NPJ2
     vectorEnemies[0] = enemy_x[counter] - xPNJ2;//Vx = Enemyx - PNJ2x 
    vectorEnemies[1] = enemy_y[counter] - yPNJ2;//Vy = Enemyy - PNJ2y
    if(magnitude < radius_enemies[counter] + radius_PNJ2){
      println("He colisionat amb PNJ2");
      vidaTotal--;
      velocitat*=-1;
    }
    //else println("Quadrant PC ", pc_quadrant, " Quadrant npc ", enemy_quadrant[counter]);
    
    if(magnitude < radius_enemies[counter] + radius_pc*2){
     direccioEnemics = -direccioEnemics;
    }
  }
}

}
