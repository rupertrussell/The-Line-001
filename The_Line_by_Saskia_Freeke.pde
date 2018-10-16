
// Based on MCCC: The Line 2 by Saskia Freeke  
// https://www.openprocessing.org/sketch/276904

int count = 0;
int saveEvery = 5;
int lastSave = 0;
float t;
float theta;
int maxFrameCount = 100;
float rot;

void setup() {
  //  size(1540, 540, P2D);
  size(7700, 7700);
  noFill();
  strokeWeight(6);
}

void draw() {
  background(#FFD460);
  pushMatrix();
  t = (float)frameCount/maxFrameCount;
  theta = TWO_PI*t;

  for ( int x= -500; x <= 7700 + 500; x += 25) {
    for (int y= -290; y <= 7700 + 290; y += 50) {
      float offSet = x+y*10;    
      float sz1 = map(sin(-theta+offSet), 0, 1, 0, 50);

      if ( y%30==0) {
        stroke(#F07B3F);
      } else if (y%20==0) {
        stroke(#2D4059);
      } else {
        stroke(#EA5455);
      }

      rotLines(x, y, sz1);
    }
  }

  rot = rot + TWO_PI/800; 

  popMatrix();
  count ++;
  if (count == lastSave + saveEvery) {
    save("frame_"+ count + ".png");
    lastSave = count;
    println(count);
  }
}

void rotLines(float xPos, float yPos, float s1) {
  pushMatrix();
  translate(xPos, yPos);  
  rotate(rot);
  line(0-s1, 0-s1, 0+s1, 0+s1);
  popMatrix();
}
