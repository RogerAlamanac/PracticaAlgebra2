
void ColisionPvP() {
  if (sqrt(sq(pxDonut-pxLechuga)+sq(pyDonut-pyLechuga))<=45 && modeLechuga==true && modeDonut == false) { //1.Feta amb la formula de la distancia // CAS LECHUGA ATACA, DONUT DEFENSA
    pxLechuga = width/2+300;
    pyLechuga = height/2;
    pxDonut = width/4;
    pyDonut = height/2;
    lifes--;
    distanciaRec = 0;
    tornLechuga = true;
    tornDonut = false;
    if(lifes==2){
      LUT1 = true;
    }
    if(lifes==1){
      LUT1=false;
      LUT2=true;
    }
    if (lifes < 1) {
      modeLechuga=false;
      modeDonut = true;
      lifes=3;
      distanciaRec = 0;
      LUT1 = false;
      LUT2 = false;
    }
  }

  if (sqrt(sq(pxDonut-pxLechuga)+sq(pyDonut-pyLechuga))<=45 && modeLechuga==false && modeDonut == true) { //1.Feta amb la formula de la distancia // CAS LECHUGA DEFENSA, DONUT ATACA
    pxDonut = width/2+300;
    pyDonut = height/2;
    pxLechuga = width/4;
    pyLechuga = height/2;
    lifes--;
    distanciaRec = 0;
    tornLechuga=false;
    tornDonut = true;
    if (lifes < 1) {
      modeLechuga=true;
      modeDonut = false;
      lifes=3;
      distanciaRec = 0;
    }
  }
}

void ColisionPerson() {
  if (sqrt(sq(xBody-pxLechuga)+sq(yBody-pyLechuga)) <= 60) {
    bodySizex -= 20;
    pxLechuga = width/4;
    pyLechuga = height/2;
    tornLechuga = false;
    tornDonut = true;
  }
  if (sqrt(sq(xBody-pxDonut)+sq(yBody-pyDonut)) <= 60) {
    bodySizex += 20;
    pxDonut = width/2;
    pyDonut = height/2;
  }
}
