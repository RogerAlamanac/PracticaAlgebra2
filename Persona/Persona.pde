void Persona(){
float bodySizex=70;
float bodySizey=70;
fill(0,255,255);
  ellipse(80, 130, 50, 50);//Cap
  fill(255);
  ellipse(70, 125, 10, 10);//Ulls (cornea)
  ellipse(90, 125, 10, 10);
  fill(0);
  ellipse(70, 125, 2, 2);//Ulls (pupila)
  ellipse(90, 125, 2, 2);
  fill(255);
  arc(80,  135, 15, 15, 0, radians(180), OPEN);//Boca
  fill(0,255,255);
  ellipse(80, 190, bodySizex, bodySizey);//Cos
noFill();
  ellipse(80, 130, 49, 49);//Cap contorn
  ellipse(80, 190, bodySizex-1, bodySizey-1);//Cos contorn
}
