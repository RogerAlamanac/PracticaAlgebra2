
void ColisionPvP(){
 if(sqrt(sq(pxDonut-pxLechuga)+sq(pyDonut-pyLechuga))<=45){ //1.Feta amb la formula de la distancia
  pxLechuga = width/4;
  pyLechuga = height/2;
 }
}

void ColisionPerson(){
  if(sqrt(sq(xBody-pxLechuga)+sq(yBody-pyLechuga)) <= 60){
  bodySizex -= 20;
  pxLechuga = width/2;
  pyLechuga = height/2;
 }
 if(sqrt(sq(xBody-pxDonut)+sq(yBody-pyDonut)) <= 60){
  bodySizex += 20;
  pxDonut = width/2;
  pyDonut = height/4;
 }
}
