class Sandpile {
  int [][]sandpiles;
  int r;
  int b;
  int g;

  Sandpile() {
     r = 100;
     b = 100;
     g = 100;
    sandpiles = new int[width][height];
    // sand toplling animation start
    sandpiles[width/2][height/2] =1000000;
  }

  void topple() {
    int[][]pile2 = new int[width][height];
    // looping through all piles on sand
    for (int x = 0; x < width; x=x+1) {
      for (int y=0; y < height; y=y+1) {
        int number = sandpiles[x][y];
        if (number < 4) {
          pile2[x][y] = sandpiles[x][y];
        }
      }
    }

    for (int x = 0; x < width; x=x+1) {
      for (int y=0; y < height; y=y+1) {
        int number = sandpiles[x][y];
        if (number >= 4) {
          // the four grains of sand will be sent to the four neighbouring cells
          // makes it more symmertrical
          pile2[x][y] += (number -4);
          // All the neighbouring piles will +1
          //setting screen bounds, edge detection
          if (x+1 < width) {
            pile2[x+1][y]++;
          }
          if (x-1 >= 0) {
            pile2[x-1][y]++;
          }
          if (y+1 < height) {
            pile2[x][y+1]++;
          }
          if (y-1 >=0) {
            pile2[x][y-1]++;
          }
        }
      }
    }
    // sandpiles is now all 4 piles
    sandpiles = pile2;
  }
  void render() {
    // loads the pixels into the program
    loadPixels();
    // looping through all piles of sand
    for (int x = 0; x < width; x=x+1) {
      for (int y=0; y< height; y=y+1) {
        // number of sandpiles
        int number = sandpiles[x][y];
        color colour =color(255);
        // if there are zero grains of sand the colour should be black
        if  (number ==0) {
          colour = color(0,0,0);
        } else if (number ==1) {
          colour = color(r/2,g,b);          
        } else if (number ==2) {
          colour = color(r,g/2,b); 
        } else if (number ==3) {
          colour = color(r,g,b/2); 
        }


        pixels[x+y*width] = colour;
        // color is how much sand there is
      }
    }

    updatePixels();
    // this function keeps overwriting the pixels
  }
  /* Allows the user to change the colours based on these inputs
   Capital Letters decrement the value of the colours whereas 
   lower case letters increment the vaue of the colour giving more 
   of it*/
  
  void UI() {
    switch(key){
      case 'r': r += 10; break;
      case 'R': r -= 10; break;
      case 'b': b += 10; break;
      case 'B': b -= 10; break;
      case 'g': g += 10; break;
      case 'G': g -= 10; break;
      case 's': animationRunning = false; break;
    }
  }
}
