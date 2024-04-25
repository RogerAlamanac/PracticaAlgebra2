//Variables
PImage lechuga;
float pxLechuga, pyLechuga;
//Functions
void Lechuga() {
  image(lechuga, pxLechuga, pyLechuga);
  lechuga.resize(50, 50);
  fill(255);
  ellipse(pxLechuga+35, pyLechuga+20, 10, 10); //Ulls cornea
  ellipse(pxLechuga+15, pyLechuga+20, 10, 10);
  fill(0);
  ellipse(pxLechuga+35, pyLechuga+20, 2, 2); //Ulls pupila
  ellipse(pxLechuga+15, pyLechuga+20, 2, 2);
  fill(255);
  arc(pxLechuga+25, pyLechuga+30, 15, 15, 0, radians(180), OPEN); //Boca
}

void MoverLechuga() {
  if (keyPressed) {
    if (key =='a') {
      if(pxLechuga>0)
      pxLechuga-=3;
      
    }
    if (key =='d') {
      if(pxLechuga<width-50)
      pxLechuga+=3;
    }
    if (key =='w') {
      if(pyLechuga>0)
      pyLechuga-=3;
    }
    if (key =='s') {
      if(pyLechuga<height-50)
      pyLechuga+=3;
    }
  }
}
