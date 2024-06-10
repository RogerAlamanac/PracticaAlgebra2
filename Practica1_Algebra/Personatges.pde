//r(alpha)= P + alpha * V
//V = Q - P
//Q = posicio final
//P = posicio inicial
//Variables
 float alpha = 0.05;//10 pasos/Velocitat
 float xPJ = width;
 float yPJ = height;
 float xPJInicial = CENTER;
 float yPJInicial = CENTER;
 float xPNJ1 = width/2.0;//Mida PNJ1
 float yPNJ1 = height/2.0;
 float xPNJ1Inicial = 30;//Posicio inicial del PNJ1
 float yPNJ1Inicial = 700;
 float xPNJ2 = width/4.0;//Mida PNJ2
 float yPNJ2 = height/4.0;
 float xPNJ2Inicial = 700;//Posicio inicial del PNJ2
 float yPNJ2Inicial = 50;
 boolean colisioPNJ1 = false;
 boolean colisioPNJ2 = false;
 int pc_quadrant;
 int radius_pc;
 int radius_PNJ2;
 int vidaTotal = 3; // Vida total del jugador
int vidaActual = vidaTotal; // Vida actual del jugador


//FUNCIONS
//Dibuixar Personatges 
void PJS(){
   fill(255,0,0);//Color PJ
   if(sqrt((mouseX - xPJ)*(mouseX - xPJ) + (mouseY - yPJ) * (mouseY-yPJ)) > 50){//PJ
 xPJ = (1-alpha)*xPJ+alpha*mouseX; //Hem de fer l'equació paramètrica de la recta per tal de que sempre pugui seguir el PJ (r(alpha)= P + alpha * V)
 yPJ = (1-alpha)*yPJ+alpha*mouseY;
   }
  ellipse(xPJ,yPJ, 50, 50);//Pintar el PJ
  //Pintar PNJ
  //PNJ = (1-alpha)PNJ+alpha*PJ
 fill(100,255,255); //Color PNJ1
 trobaPNJ();
 if(colisioPNJ1){
  if(sqrt((xPJ - xPNJ1)*(xPJ - xPNJ1) + (yPJ - yPNJ1) * (yPJ-yPNJ1)) > 60){//PNJ1
 xPNJ1 = (1-alpha)*xPNJ1+alpha*xPJ; //Hem de fer l'equació paramètrica de la recta per tal de que sempre pugui seguir el PJ (r(alpha)= P + alpha * V)
 yPNJ1 = (1-alpha)*yPNJ1+alpha*yPJ;
  }
 }
  ellipse(xPNJ1, yPNJ1, 40, 40);
  //PNJ2
  fill(0,0,255); //Color PNJ2
 if(colisioPNJ2){
   if(sqrt((xPNJ1 - xPNJ2)*(xPNJ1 - xPNJ2) + (yPNJ1 - yPNJ2) * (yPNJ1-yPNJ2)) > 50){//PNJ2
   xPNJ2= (1-alpha)*xPNJ2+alpha*xPNJ1; //Hem de fer l'equació paramètrica de la recta per tal de que sempre pugui seguir el PNJ1
   yPNJ2= (1-alpha)*yPNJ2+alpha*yPNJ1;
   }
 }
 ellipse(xPNJ2, yPNJ2, 30, 30);
 fill(100, 150, 20); 
}

void trobaPNJ() {
  if(xPJ < xPNJ1Inicial+40&&xPJ+40>xPNJ1Inicial&&yPJ<yPNJ1Inicial&&yPJ < yPNJ1Inicial+40&&yPJ+40>yPNJ1Inicial){
    colisioPNJ1=true;
    println("AAAAAAAAA");
  }
  
  if(xPJ < xPNJ2Inicial+30&&xPJ+30>xPNJ2Inicial&&yPJ<yPNJ2Inicial&&yPJ < yPNJ2Inicial+30&&yPJ+30>yPNJ2Inicial){
    if(colisioPNJ1){
      colisioPNJ2=true;
      println("EEEEEEE");
    }
  }
}
