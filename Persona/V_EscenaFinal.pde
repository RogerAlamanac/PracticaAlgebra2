

void EscenaFinal(){
  FondoLUT();
 background(fondoLUT);
 if(LechugaWin){
  Lechuga();
  DonutLuma();
  fill(255);
  textSize(32);
  text("WINNER", pxLechuga+10, pyLechuga-50);
 }
 else if(DonutWin){
  Donut();
  LechugaLuma();
  fill(255);
  textSize(32);
  text("WINNER", pxDonut+10, pyDonut-50);
 }
 
}
