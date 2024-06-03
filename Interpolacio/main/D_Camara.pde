boolean isIsometric = true;

// Variables per la posició i orientació de la càmara 
float camX = 0;
float camY = 0;
float camZ = (height / 2.0) / tan(PI / 6.0); // Distancia de la càmara

// Configurar la càmara segons el modo actual
void setupCamera() {
  if (isIsometric) {
    // Càmara isomètrica
    float fov = PI / 3.0;
    float cameraZ = (height / 2.0) / tan(fov / 2.0);
    float camTargetX = width / 2.0 + camX;
    float camTargetY = height / 2.0 + camY;
    float camTargetZ = 0;
    perspective(fov, float(width) / float(height), cameraZ / 10.0, cameraZ * 10.0);
    camera(camTargetX, camTargetY, cameraZ, camTargetX, camTargetY, camTargetZ, 0, 1, 0);
  } else {
    // Cámara ortogràfica superior
    float camTargetX = width / 2.0 + camX;
    float camTargetY = height / 2.0 + camY;
    ortho(-width / 2, width / 2, -height / 2, height / 2, -10000, 10000);
    camera(camTargetX, camTargetY, camZ, camTargetX, camTargetY, 0, 0, 1, 0);
  }
}

void keyPressed(){
  if (key == 'c' || key == 'C') { //al apretar la tecla C es cambia de camera
    isIsometric = !isIsometric;
  }

  if (keyCode == UP) {
    camY -= 10;
  } else if (keyCode == DOWN) {
    camY += 10;
  } else if (keyCode == LEFT) {
    camX -= 10;
  } else if (keyCode == RIGHT) {
    camX += 10;
  }
}

  
