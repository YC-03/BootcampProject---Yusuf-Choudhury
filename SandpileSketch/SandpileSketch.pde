Sandpile sandpile;
boolean animationRunning;

void setup() {
  size(300, 300);
  sandpile = new Sandpile();
  animationRunning = true;
}
void draw() {
  if (animationRunning){
  sandpile.render();
  for (int i=0; i<100; i=i+1) {
    sandpile.topple(); // Center cell is now toppled
    }
  }
  else{
    text("Thanks for watching the animation", width/2, height/2, width/2, height/2);
    textAlign(CENTER);
    textSize(48);
    color(255,255,255);
    // Doesn't allow delay when stopping the animation
    frameRate(0);
  }
}
void keyPressed() {
  // calls the key from the sandpile class 
  sandpile.UI();
}
