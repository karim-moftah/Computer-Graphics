
class Drop {

  float x = random(width);             // choose any point on the x-axis within the window
  float y = random(-200, -50);         // choose a point on the y-axis out of the window
  float step = random(1, 3);           // random step width to be used in changing y location
  float choice = random(2);            // random num (1 for o), (any other num for x)
  float xr = 15;                       // lenth of x lines


  void fall()                          // decides on where to draw the x or o object and starts outhside of the window
  {
    y+=step;

    if (y>height)                       // if the y position is down the window
      y=random(-200, -50);
  }

  void show() {
    stroke(251, 197, 49);               // the color for falling x and o
    strokeWeight(7);
    if (floor(choice)==1) {             // draw O
      noFill();
      ellipse(x, y, 30, 30);                        // (center_x, center_y, width, height)
    } else {                            // draw x
      line(x - xr, y - xr, x + xr, y + xr);         // (x1, y1, x2, y2)  --> \
      line(x + xr, y - xr, x - xr, y + xr);         // (x1, y1, x2, y2)  --> /
    }
  }
}
