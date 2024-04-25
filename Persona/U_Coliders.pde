void ColisionPvP(){
 if(sqrt(sq(pxDonut-pxLechuga)+sq(pyDonut-pyLechuga))<=45){ //1.Feta amb la formula de la distancia
  pxLechuga = width/2;
  pyLechuga = height/2;
 }
}

void ColisionPerson(){
 if(sqrt(sq(xBody-pxLechuga)+sq(yBody-pyLechuga)) < = 70){
  bodySizex -= 20;
  bodySizey -= 20;
 }
}
