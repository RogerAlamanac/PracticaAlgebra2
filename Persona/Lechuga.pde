//Variables
PImage lechuga;
float pxLechuga, pyLechuga;
//Functions
void Lechuga() {
  image(lechuga, pxLechuga, pyLechuga);
  lechuga.resize(50, 50);
  fill(255);
  ellipse(pxLechuga+35, pyLechuga+20, 10, 10);
  ellipse(pxLechuga+15, pyLechuga+20, 10, 10);
  fill(0);
  ellipse(pxLechuga+35, pyLechuga+20, 2, 2);
  ellipse(pxLechuga+15, pyLechuga+20, 2, 2);
  fill(255);
  arc(pxLechuga+25, pyLechuga+30, 15, 15, 0, radians(180), OPEN);
}

void MoverLechuga() {
  if (keyPressed) {
    if (key =='a') {
      pxLechuga-=20;
    }
    if (key =='d') {
      pxLechuga+=20;
    }
    if (key =='w') {
      pyLechuga-=20;
    }
    if (key =='s') {
      pyLechuga+=20;
    }
  }
}
