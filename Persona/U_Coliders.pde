int numColisions;//Numero de colisions contra la persona
void ColisionPvP() { //Colisió de Lechuga i Donut
  if (sqrt(sq(pxDonut-pxLechuga)+sq(pyDonut-pyLechuga))<=45 && modeLechuga==true && modeDonut == false) { //1.Feta amb la formula de la distancia // CAS LECHUGA ATACA, DONUT DEFENSA
    pxLechuga = width/2+300;
    pyLechuga = height/2;
    pxDonut = width/4;
    pyDonut = height/2;
    lifes--;
    distanciaRec = 0;
    tornLechuga = true;
    tornDonut = false;
    if (lifesLechuga.length > 0) {
      PImage[] newLifesLechuga = new PImage[lifesLechuga.length - 1];
      arrayCopy(lifesLechuga, 0, newLifesLechuga, 0, newLifesLechuga.length);
      lifesLechuga = newLifesLechuga;
    }
    if (lifes < 1) {
      modeLechuga=false;
      modeDonut = true;
      tornLechuga = false;
      tornDonut = true;
      lifes=3;
      distanciaRec = 0;
      LUT1 = false;
      LUT2 = false;
      pxDonut = width/2+300;
      pyDonut = height/2;
      pxLechuga = width/4;
      pyLechuga = height/2;
      GenLifes();
    }
  }

  if (sqrt(sq(pxDonut-pxLechuga)+sq(pyDonut-pyLechuga))<=45 && modeLechuga==false && modeDonut == true) { //1.Feta amb la formula de la distancia // CAS LECHUGA DEFENSA, DONUT ATACA
    pxDonut = width/2+300;
    pyDonut = height/2;
    pxLechuga = width/4;
    pyLechuga = height/2;
    lifes--;
    activarMosca();
    distanciaRec = 0;
    tornLechuga=false;
    tornDonut = true;
    if (lifesDonut.length > 0) {
      PImage[] newLifesDonut = new PImage[lifesDonut.length - 1];
      arrayCopy(lifesDonut, 0, newLifesDonut, 0, newLifesDonut.length);
      lifesDonut = newLifesDonut;
      if (lifes < 1) {
        modeLechuga=true;
        modeDonut = false;
        tornLechuga = true;
        tornDonut = false;
        lifes=3;
        distanciaRec = 0;
        pxDonut = width/4;
        pyDonut = height/2;
        pxLechuga = width/2+300;
        pyLechuga = height/2;
        GenLifes();
        
      }
    }
  }
}
void ColisionPerson() { //Colisió amb la persona
  if (modeLechuga) { //La lechuga només colisiona (aprima) la persona quan ataca
    if (sqrt(sq(xBody-pxLechuga)+sq(yBody-pyLechuga)) <= 60) {
      bodySizex -= 20;
      pxLechuga = width/4;//Resetear les posicions pel canvi de mode
      pyLechuga = height/2;
      pxDonut = width/2+300;
      pyDonut = height/2;
      tornLechuga = false;//Resetear els torns
      tornDonut = true;
      distanciaRec = 0;
      modeLechuga=false;
      modeDonut=true;
      lifes = 3;//Resetear les vides
      GenLifes();
      numColisions--;
      activarMosca();
    }
  }
  if (modeDonut) {//El donut només colisiona (engreixa) la persona quan ataca
    if (sqrt(sq(xBody-pxDonut)+sq(yBody-pyDonut)) <= 60) {
      bodySizex += 20;
      pxDonut = width/4;
      pyDonut = height/2;
      pxLechuga = width/2+300;
      pyLechuga = height/2;
      tornLechuga = true;
      tornDonut = false;
      modeLechuga=true;
      modeDonut = false;
      lifes = 3;
      GenLifes();
      activarMosca();
      distanciaRec = 0;
      numColisions++;
    }

    if (numColisions>=3) {
      DonutWin = true;
    } else if (numColisions <= -3) {
      LechugaWin = true;
    }
  }
}
