void Persona(){
float bodySizex=70;
float bodySizey=70;
fill(0,255,255);
  ellipse(width/8, height/2.8, 50, 50);//Cap
  ellipse(width/8, height/1.9, bodySizex, bodySizey);//Cos
noFill();
  ellipse(width/8, height/2.8, 49, 49);//Cap contorn
  ellipse(width/8, height/1.9, bodySizex-1, bodySizey-1);//Cos contorn
}
