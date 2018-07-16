
boolean sorting = false;
int index = 0;

int HP = 0;

int size = 1000;
int elements = 1000;
int[] array = new int[elements];
float rateo = size/elements;


void setup() {
  
  size(1000, 1000);
  textSize(32);
  stroke(255, 255, 255);
  noStroke();
  
  for (int i = 0; i < elements; i++) {
   array[i] = (int)random(elements);  
  }
}


void draw() {
  
  background(0, 0, 0);
  
  for(int i = 0; i < elements; i++) {
    
    float h = ((float)array[i]/(float)elements) * size;
    
    float c = ((float)array[i]/(float)elements) * 255;
    
    fill(c, 0, 255 - c);
    
    rect(i*rateo, size, rateo, -h);
    
  }
  
  if (sorting) {
   for(int x = 0; x < 10000; x++) {sort();} 
  }
  
  if (frameCount % 15 == 0) {
   if (sorted() && sorting) {
     sorting = false;
     HP = 255;
   }
  }
  
  fill(HP, HP, HP, HP);
  text("Sorted!", size/10, size/10);
  HP--;
  
  System.out.println(frameRate);
  
}

// ---------------------------------------------------------------------------------------------

void sort() {
 
  if (array[index] > array[index + 1]) {
    
    int t = array[index + 1];
    array[index + 1] = array[index];
    array[index] = t;
    
  }
  
  if (index < elements - 2) {
    index++;
  } else {
    index = 0;
  }
    
  
}

void mouseClicked() {
 
  if (sorting  || !sorted()) {
    sorting = !sorting;
  } else {
    keyCode = 0;
    keyPressed();
  }
  
}

void keyPressed() {
 
  if (keyCode == UP) {
    
    for (int i = 0; i < elements; i++) {
     array[i] = elements-i;  
    }  
    
  } else {
  
    if (keyCode == DOWN) {
      
      for (int i = 0; i < elements; i++) {
       array[i] = (int)(-0.004*(i - 500)*(i - 500) + 1000);  
      }
      
    } else {
      
      if (keyCode == LEFT) {
        
        for (int i = 0; i < elements; i++) {
         array[i] = (int)random(elements);  
        }
    
        
      } else {
      
        if (keyCode == RIGHT) {
       
          for (int i = 0; i < elements; i++) {
           array[i] = (int)((500*Math.sin((double)i/50.0) + 500) * ((double)i/1000.0));  
          }
          
        }
    
        
        }
        
      }
  
  }
  
}

boolean sorted() {
  
 for (int i = 0; i < elements - 1; i++) {
  if (array[i] > array[i+1]) {
    return false;
  }
 }
 
 return true; 
 
}
