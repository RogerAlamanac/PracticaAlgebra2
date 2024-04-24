void Persona(){
float bodySizex=70;
float bodySizey=70;
fill(0,255,255);
  ellipse(80, (height/2)-20, 50, 50);//Cap
  fill(255);
  ellipse(70,(height/2)-25, 10, 10);//Ulls (cornea)
  ellipse(90, (height/2)-25, 10, 10);
  fill(0);
  ellipse(70,(height/2)-25, 2, 2);//Ulls (pupila)
  ellipse(90,(height/2)-25, 2, 2);
  fill(255);
  arc(80, (height/2)-10, 15, 15, 0, radians(180), OPEN);//Boca
  fill(0,255,255);
  ellipse(80, (height/2) + 40, bodySizex, bodySizey);//Cos
}
