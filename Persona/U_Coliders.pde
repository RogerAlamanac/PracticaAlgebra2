void ColisionPvP(){
 if(sqrt(sq(pxDonut-pxLechuga)+sq(pyDonut-pyLechuga))<=50){ //1.Feta amb la formula de la distancia
  pxLechuga = width/2;
  pyLechuga = height/2;
 }
}
