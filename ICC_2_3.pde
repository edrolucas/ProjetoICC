import processing.serial.*;

Serial port;

import pt.citar.diablu.processing.mindset.*;

MindSet mindSet;


int throttle = 0;


void setup(){
  
  size(150,500);
  
  println(Serial.list());
  
  
  String portName = Serial.list()[2];
  port = new Serial(this,portName, 9600);
  
  mindSet = new MindSet(this,"COM3");
  
  smooth();
  
  strokeWeight(5);
  stroke(255);
  strokeCap(SQUARE);

  fill(255);

}

void draw(){
  
  background(0);

  /*
    Desenha linha horizontal em 40% da tela
    Essa linha indica o valor mínimo para ligar o atuador
  */
  line(0, height * 0.60, width, height * 0.60);

  // Desenha a linha no centro para representar o nível de atenção
  line( width*.5, height, width*.5, height*map( float( attentionLevel ) / 100, 0, 1, 1,
    0 ) );

  /* 
     Aumenta o nível de atenção para acelerar o servo
     40 = Nível mínimo para fazer algo
     100 = Atenção máxima
     30 = Valor mínimo para o servo
     180 = Valor máximo para o servo
  */
  throttle = int(map(attentionLevel, 40, 100, 30, 180));

  // Restringir valores para o intervalo do servo
  throttle = constrain(throttle, 30, 180);

  if (port.available() > 0) {
    println("Nível de atenção: " + attentionLevel);
    port.write(throttle + "v"); // Envia o valor do throttle seguido de 's' para o microcontrolador
  } else {
    println(port.available());
  }
  
}
// Killswitch, pressione K ou ESC para finalizar o programa
void keyPressed() {
  if (key == 'k' || key == ESC) {
    if (port.available() > 0) {
      port.write("0v"); // Envia comando para zerar o servo
      exit();
    }
  }
}
// Funções e variáveis do MindSet
int signalStrenght = 0;
int attentionLevel = 0;

public void attentionEvent(int attentionLevel_val) {
  attentionLevel = attentionLevel_val;
}

// Essa função é ativada quando a conexão com o NeuroSky é ideal
public void poorSignalEvent(int signalNoise) {
  // Ajuste, sinal está alto demais
  if (signalNoise == 200) {
    println("NeuroSky não está em contato com a pele");
  }

  // Intensidade do sinal
  signalStrenght = int(map((200 - signalNoise), 200, 0, 100, 0));
  println("Intensidade do sinal: " + signalStrenght + "%");
}
