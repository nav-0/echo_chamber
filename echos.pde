int cols = 400;
int rows = 400;
float[][] effect = new float[cols][rows];
float[][] cause = new float[cols][rows];
float damping = 0.99999; //Within (0, 1)

void setup() {
  size(400, 400);
  colorMode(RGB);
  cause[cols/2][rows/2] = 255; //Drop
}


void draw() {
  loadPixels();
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      effect[i][j] = (cause[i-1][j] + cause[i+1][j] + cause[i][j-1] +
                      cause[i][j+1]) / 2 - effect[i][j];
      effect[i][j] = effect[i][j] * damping;
      int wavePoint = i + j * cols;
      pixels[wavePoint] = color(effect[i][j]*250, 0, 0);
    }
  }
  updatePixels();

  float[][] temp = cause;
  cause = effect;
  effect = temp;
}
