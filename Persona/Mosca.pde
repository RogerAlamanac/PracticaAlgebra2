PImage mosca; 
PVector posicion; // Variable posició de la mosca
float velocidad = 4; // Velocitat mosca
boolean moscaActiva = false; 
PVector posicionMosca; // Posición de la mosca

void mosca(){
  //dibuixar mosca
  image(mosca, posicion.x, posicion.y);
  mosca.resize(80, 43);
  posicion.x += velocidad;
  
  if (posicion.x > width) {
    posicion.x = -mosca.width;
    posicion.y = random(height - mosca.height);
  }
  
}

void activarMosca() {
  //posicio inicial mosca
  posicionMosca = new PVector(0, random(height - mosca.height));
  moscaActiva = true;
}
