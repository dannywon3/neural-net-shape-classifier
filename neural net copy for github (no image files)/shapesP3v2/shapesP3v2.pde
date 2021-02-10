void setup() {
  size(64, 64);
}

void draw() {
  
  for (int i = 0; i < 3; i++) {
    background(255);
    pushMatrix();
    strokeWeight(4);
    float r = random(8, 24);
    float x = random(r, width - r);
    float y = random(r, height - r);
    stroke(random(100), random(100), random(100));
    
    translate(x, y);
    if (i == 0) {
      // circles (detected like a charm)
      circle(0, 0, r*2);
      saveFrame("data/circle####.png");
    } else if (i == 1) {
      // squares (detected like a charm)
      rotate(random(-0.1, 0.1));
      rectMode(CENTER);
      square(0, 0, r*2);
      saveFrame("data/square####.png");
    } else if (i == 2) {
      // triangles (doggy doo doo detection. the one
      // on ur website is different to this code
      // i THINK that the circle and square is unchanged
      // but the triangle has some specific 'random()'
      // instead of the 'r'. I would think it'd be close
      // to random(8, 16) but ive tried so many similar
      // ones, i honestly dont know anymore. 
      // although the principles needed to get the project
      // working are all the same, so it isnt really important
      // what the actual values are. similar to how the gravity
      // value of my dino game isnt really important. if i were
      // to recreate it, id do it better with diff tools, and
      // in a job situation, id be using the principles, no where
      // near this random value for this one random project
      rotate(random(0, 360));
      triangle(0, -r, r, r, -r, r);
      saveFrame("data/triangle####.png");
    }
    popMatrix();
  }
    
  if (frameCount == 1000) {
    exit();
  }
  
}
