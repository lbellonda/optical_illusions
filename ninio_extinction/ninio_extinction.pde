
/*
 *     Copyright 2022 Luca Bellonda
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *          http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// tested with Processing 3.3.7

int step= 80;
int lineWidth=9;
int lineColor=0x64;
int colorBg=0xE0;
int squareWidth=8;
int squareStep = 4*step;
int offset=10;
void setup() {
  size(1200, 1200);
  drawItems();
  save("fovea_ninio.png");
}

void drawItems() {
  int translate =-0*squareStep/4; 
  translate(translate, translate);
  fill(colorBg);
  strokeWeight(lineWidth);
  stroke(lineColor);
  for ( int x = -width; x < 2*width; x+= step) {
    line( x, 0, x, height);
    line( 0, x, width, x);
    line( x, 0, x+width, height);
    line( x, 0, x-width, height);
  }
  ellipseMode(RADIUS);
  for (int y = -height; y < 2*height; y+= squareStep) {
    for (int x = -width; x < 2*width; x+= squareStep) {
      strokeWeight(2);
      fill(0);
      stroke(255);
      ellipse(x, y, squareWidth, squareWidth);
    }
  }
}
