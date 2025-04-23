
# 🧠 ICC – Interface Cérebro-Computador com NeuroSky e Arduino

Este projeto demonstra uma Interface Cérebro-Computador (ICC) simples utilizando o headset **NeuroSky MindWave** para controlar um **servo motor** com os níveis de atenção do usuário. Os dados do NeuroSky são capturados via **Processing**, processados e enviados para um **Arduino**, que move o servo motor de acordo com a concentração mental.

---

### 🚀 Funcionalidades

- Captura em tempo real dos dados de atenção com o NeuroSky.
- Mapeamento do nível de atenção (40–100) para ângulo de servo (30–180).
- Visualização gráfica do nível de atenção.
- Comunicação serial entre Processing e Arduino.
- Controle do servo motor baseado na sua mente (literalmente!).

---

### 🧰 Requisitos

#### Hardware:
- 1x Headset NeuroSky MindWave
- 1x Placa Arduino (UNO, Nano, etc.)
- 1x Servo Motor (como o SG90)
- Cabos e conexão USB

#### Software:
- [Processing IDE](https://processing.org/)
- [Arduino IDE](https://www.arduino.cc/en/software)
- Biblioteca do MindSet para Processing ([pt.citar.diablu.processing.mindset](https://github.com/diablucitar/mindset-processing))
- Driver do NeuroSky (ThinkGear Connector)

---

### 📷 Preview

(Sugestão: adicione aqui uma imagem ou vídeo do servo sendo controlado)

---

### ⚠️ Notas

- Os valores de atenção variam entre usuários e sessões. Pode ser necessário ajustar o mapeamento (`map(attentionLevel, 40, 100, 30, 180)`) para melhor resposta.
- Certifique-se de que o sinal do NeuroSky está estável antes de iniciar.

---

### 📄 Licença

MIT – Sinta-se livre para usar, modificar e compartilhar!
