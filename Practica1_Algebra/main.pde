import processing.sound.*;
SoundFile sonido;
 PImage PJImage; //Textura per al PJ
void setup(){
  size(800,800); //Finestra
  //Musica
 sonido = new SoundFile(this,"AudioFons.wav" );
  sonido.play();
  MenuFoto=loadImage("FotoBackgroundMenu.jpg");
  //Tiempo
 tiempoInicial = millis();
 
  //OBSTACLES INICIALITZACIÓ
   ObstaclesX=new float[amount_obstacles];
   ObstaclesY=new float[amount_obstacles];
  for(int i = 0; i < amount_obstacles; i++){
    ObstaclesX[i] = (int)random(WidthObstacles,width-WidthObstacles-100);//Posicions on estan situats els obstacles
    ObstaclesY[i] = (int)random(HeightObstacles, height+HeightObstacles+100);
  }
  //PJS
  //Images
  PJImage=loadImage("ImatgePJ.png");//Imatge de textura del PJ
  PJImage.resize(50,50);
  imageMode(CENTER);
  //VIDA
 vidaPNJ2();
 //Posició inicial PJS
 xPJ=xPJInicial;
 yPJ=yPJInicial;
 xPNJ1=xPNJ1Inicial;
 yPNJ1=yPNJ1Inicial;
xPNJ2=xPNJ2Inicial;
yPNJ2=yPNJ2Inicial;
 
 //CONFIGURACIÓ ENEMICS
   // Inicialització dels arraysrectMode(CENTER);
 inicialX = new float[amounts_enemies];
 inicialY = new float[amounts_enemies];
 finalX = new float[amounts_enemies];
 finalY = new float[amounts_enemies];
 enemy_x = new float[amounts_enemies];
 enemy_y = new float[amounts_enemies];
 radius_enemies= new float[amounts_enemies];
 enemy_quadrant = new float [amounts_enemies];
 /*direccioX = new float[amounts_enemies];
 direccioY = new float[amounts_enemies];*/
 
 for(int i = 0;i<amounts_enemies;i++){
  inicialX[i]=100;
  inicialY[i]=(int)random(height);
  enemy_x[i]=inicialX[i];
  enemy_y[i]=inicialY[i];
 }
 //Anivellem els enemics per cada quadrant
 for(int counter=0;counter<amounts_enemies;counter++){
    if ( enemy_x[counter]<width/2.0){
      if(enemy_y[counter]<height/2.0){
        enemy_quadrant[counter] = 1;
      }
      else{
        enemy_quadrant[counter] = 4;
      }
    } 
    else{
      if (enemy_y[counter]<height/2.0){
        enemy_quadrant[counter] = 2;
      }
      else enemy_quadrant[counter] = 3;
    }    
 }

 //OBSTACLES
  WidthObstacles = 80;//Mida dels obstacles
  HeightObstacles = 50;
  amount_obstacles = 12;
  colisio = false;
  //powerups
  powerUpX = random(width);
  powerUpY = random(height);
  
  powerUpX2 = random(width);
  powerUpY2 = random(height);
  
  powerUpX3 = random(width);
  powerUpY3 = random(height);
  
  powerUpX4 = random(width);
  powerUpY4 = random(height);
  
  powerUpX5 = random(width);
  powerUpY5 = random(height);

}
//Draw - Bucle
void draw(){
  background(150);//Color de fondo
  MenuEnemies();
  if(menuEnemies==false){
    //Temps
   Tiempo();
   //OBSTACLES
   Obstacles();
   
   ColisionsObj();
  
   //Crit a la funció de PowerUps
 PowerUps();
 //Funcio PJS
  PJS();
  image(PJImage, xPJ, yPJ);
 //CONFIGURACIÓ ENEMICS
  //Pintar els NPC
 if(colisioPNJ1==true&&colisioPNJ2==true){ 
  for(int counter=0;counter<amounts_enemies;counter++){ //Creem un bucle perquè es repeteixi per a cada enemic
  movimentEnemics();
  velocitat();
  }
 }
  
 //BARRA DE VIDA
 //Generar barra de vida
 BarraVida();
 restablecerVida();//Restablir el valor de la vida al original
 if(amounts_enemies==0){
 Boss();
 dispararBala();
 }

}
}
