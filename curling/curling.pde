import fisica.*;

FWorld mundo;
PImage piedra, nieve;
FCircle circulo;


void setup() {
  size (500, 1000);
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();
  mundo.setGravity(0, 0);
  FCircle circulo = new FCircle(20);

  piedra = loadImage("piedra.png");
  nieve = loadImage("nieve.jpg");
}

void draw() {
  image(nieve, 0, 0);

  pushStyle();
  fill(0, 0, 255);
  ellipse(250, 200, 215, 215);
  popStyle();

  pushStyle();
  fill(255, 255, 255);
  ellipse(250, 200, 125, 125);
  popStyle();

  pushStyle();
  fill(255, 0, 0);
  ellipse(250, 200, 50, 50);
  popStyle();

  mundo.step();
  mundo.draw();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      FCircle circulo = new FCircle(20);
      mundo.add(circulo);
      circulo.setPosition(mouseX, mouseY);
      circulo.attachImage(piedra);
      circulo.setFriction(0.000001);
      circulo.setDensity(10);
      //rebote entre cuerpos
      circulo.setRestitution(0.00001);
      //agarre al suelo
      circulo.setDamping(3);
      { 
        
        //evaluacion de ubicación para asignar puntaje
        //*PROBLEMA:* circulo.getX/Y solo da el valor desde el que sale el tejo, no considera el movimiento y la posición final

        if (dist (circulo.getX(), circulo.getY(), 250, 200 ) < 25 ) {
          print("50 puntos");
        } else if (dist (circulo.getX(), circulo.getY(), 250, 200 ) < 75 ) {
          print("100 puntos");
        } else if (dist (circulo.getX(), circulo.getY(), 250, 200 ) < 110 ) {
          print("200 puntos");
        } else {
        }
      }
    } else {
    }
  }
}
