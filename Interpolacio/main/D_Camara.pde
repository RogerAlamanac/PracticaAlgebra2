boolean isIsometric = true;

// Variables per la posició i orientació de la càmara 
float camX = 0; //Coordenada X de la cam
float camY = 0; //Coordenada Y de la cam
float camZ = (height / 2.0) / tan(PI / 6.0); // Distancia de la càmara

// Configurar la càmara segons el modo actual
void setupCamera() {
  if (isIsometric) {
    // Càmara isomètrica
    float fov = PI / 3.0; //Camp de visió
    float cameraZ = (height / 2.0) / tan(fov / 2.0); //vista z de la càmara
    float camTargetX = width / 2.0 + camX; //Objectiu x de la càmara
    float camTargetY = height / 2.0 + camY; //Objetiu y de la càmara
    float camTargetZ = 0; //Objectiu Z de la càmara
    perspective(fov, float(width) / float(height), camZ / 10.0, camZ * 10.0); //Per cambiar de perspectiva
    camera(camTargetX, camTargetY, cameraZ, camTargetX, camTargetY, camTargetZ, 0, 1, 0); 
    
  } else {
    // Cámara ortogràfica superior
    ortho(-width / 2, width / 2, -height / 2, height / 2, -10000, 10000); //Configura la vista ortogràfica
    camera(camX, camY, camZ, camX, camY, 0, 0, 1, 0); //Configura la càmara en aquesta vista
  }
}

void keyPressed(){
  if (key == 'c' || key == 'C') { //al apretar la tecla C es cambia de camera
    isIsometric = !isIsometric;
  }

  if (keyCode == UP) { //Al premer la tecla de UP, la camara es mou cap a dalt
    camY -= 10;
  } else if (keyCode == DOWN) { //Al premer la tecla de DOWN, la camara es mou cap a dalt, per aixo augmenta la Y
    camY += 10;
  } else if (keyCode == LEFT) { //Al premer la tecla de LEFT, la camara es mou cap a l'esquerra
    camX -= 10;
  } else if (keyCode == RIGHT) { //Al premer la tecla de RIGHT, la camara es mou cap a la dreta
    camX += 10;
  }
}

  
