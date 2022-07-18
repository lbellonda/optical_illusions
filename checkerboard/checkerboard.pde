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

int colorBg1=0xE0;
int colorBg2=0x80;
int squares =9;
int circleRadius = 25;
void setup() {
  size(1000, 1000);
  drawItems(true);
  save("checkerboard_out.png");
  drawItems(false);
  save("checkerboard_in.png");
}

void drawItems(boolean bulge) {
  rectMode(CORNER);
  noStroke();
  int step = width/squares;
  int row = 0;
  boolean evenRow = false;
  boolean evenColumn = false;
  for ( int y = 0; y < height; y+= step) {
    for ( int x = 0; x < width; x+= step) {
      boolean cond = (evenRow && evenColumn)||(!evenRow && !evenColumn);
      fill(cond ^ bulge? colorBg1: colorBg2);
      rect( x, y, x+step, y+step);
      evenColumn = ! evenColumn;
    }
    evenRow = ! evenRow;
  }
  ellipseMode(RADIUS);
  boolean [] values = {true, false,true, false,false, true, false, true};
  for ( int y = step, yy=0; y < height-step; y+= step, yy++) {
    for ( int x = step, xx=0; x < width-step; x+= step, xx++) {
      boolean cond =values[xx];
      if(values[yy]) {
        cond = !cond;
      }
      fill(cond? 255: 0);
      ellipse( x, y, circleRadius, circleRadius);
    }
  }
  stroke(0xC0);
  strokeWeight(3);
    for ( int x = step; x < width-step; x+= step) {
      line(x, step, x, height-step); 
      line(step, x, width-step, x);
    }
}
