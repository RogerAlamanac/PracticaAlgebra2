Voxel[] voxel;

class Voxel {
  //Atributs
  PVector forsa_dins_voxel;
  PVector posicio_voxel;
  float alt_voxel, ample_voxel;
  color color_voxel;

  //Constructor
  Voxel(PVector f, PVector p, float amp, float alt, color c) {
    forsa_dins_voxel = new PVector (0.0, 0.0);
    posicio_voxel = new PVector (0.0, 0.0, 0.0);
    forsa_dins_voxel = f;
    posicio_voxel = p;
    alt_voxel = alt;
    ample_voxel = amp;
    color_voxel = c;
  }

  void pintar_voxel() {
    stroke(color_voxel);
    rectMode (CENTER);
    box(cubSize);
    box(posicio_voxel.x, posicio_voxel.y, posicio_voxel.z);
  }
}
