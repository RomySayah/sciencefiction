import java.io.FilenameFilter;

PImage[] img1= new PImage[585];
PImage[] small;
PImage[] large;
PImage[] smile;
PImage[] mersive;

int smallN;
int largeN;
int screenshots = 0;

// float rgb
float[] reds;
float[] greens;
float[] blues;
PImage red;
int blue;
int green;

int nCol = 15;
int nRow = 8;
int w = 200;
int h = 200;
int nPics;

int nColL = 4;
int nRowL = 2;
int wL = 750;
int hL = 800;
int nPicsL;

int nColS = 2;
int nRowS = 1;
int wS = 1500;
int hS = 1600;
int nPicsS;

int numFrames = 73;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[73];

void setup(){
 imageMode(CENTER);
 frameRate(24);
 size(3000,1600);
 String path = sketchPath();
 String[] filenames =listFileNames(path);
 
 reds = new float[img1.length];
 greens = new float[img1.length];
 blues = new float [img1.length];

 
 //count the number of img.width<cuttoff
 for (int i = 1; i<img1.length; i++){
   img1[i] = loadImage(filenames[i]);
   img1[i].loadPixels();
   float avgR = 0;
   float avgG = 0;
   float avgB = 0;
   for (int j =0; j<img1[i].pixels.length;j++){
    float r = red(img1[i].pixels[j]);
    avgR += r;
    float g = green(img1[i].pixels[j]);
    avgG += g;
    float b = blue(img1[i].pixels[j]);
    avgB += b;
   }
   avgR /= img1[i].pixels.length;
   reds[i] = avgR;
   avgG /= img1[i].pixels.length;
   greens[i] = avgG;
   avgB /= img1[i].pixels.length;
   blues[i] = avgB;
   //print(reds[12]+"x");
   //print(greens[12]+"x");
 }

 
 for (int i= 1; i<img1.length;i++){
   if (img1[i].width<143){
     smallN++;
     // call function saveAsSmall
     img1[i].save("small/img"+(smallN-1)+".png");
   }
 }
 small = new PImage[120];
 for(int i= 0; i <small.length;i++){
  small[i]= loadImage("small/img"+i+".png"); 
 }
 
 for (int i= 1; i<img1.length;i++){
   if (img1[i].width>800){
     largeN++;
     // call function saveAsSmall
     //img1[i].save("large/img"+(largeN-1)+".png");
   }
 }
 //print(largeN);
 large = new PImage[8];
 for(int i= 0; i <large.length;i++){
  large[i]= loadImage("large/img"+i+".png"); 
 }
 
 
 smile = new PImage[4];
 for (int i = 0; i <smile.length; i++){
   smile[i] = loadImage("smile/img"+i+".png");
 }
 

 nPics = nCol*nRow;
 nPicsL = nColL*nRowL;
 nPicsS = nColS*nRowS;
 print("Done");

 
}
 
void draw(){
  
  if(keyPressed){
   if(key == 'r' || key == 'R'){
     imageMode(CENTER);

     for (int i = 0; i <img1.length; i++){
       
       if (reds[i]>180 && greens[i]<90 && blues[i]<90){
         image(img1[i],0, 0, 3000,1600); 
        }
    
       if (reds[i]>120 && greens[i]<180 && blues[i]<180){
         image(img1[i],random(width), random(height), img1[i].width*0.2,img1[i].height*0.2); 
       }
       
     }
    }else if (key == 'g' || key == 'G'){
      imageMode(CENTER);
      
      for (int i = 0; i <img1.length; i++){    
       if (greens[i]>120 && reds[i]<180 && blues[i]<180){
         image(img1[i],random(width), random(height), img1[i].width*0.2,img1[i].height*0.2); 
       }
     }
      
    }else if (key == 'b' || key == 'B'){
      imageMode(CENTER);
      
      for (int i = 0; i <img1.length; i++){
       if (blues[i]>120 && reds[i]<180 && greens[i]<180){
         image(img1[i],random(width), random(height), img1[i].width*0.2,img1[i].height*0.2); 
       }
     }      
      
    }else if (key == 's' || key == 'S'){
      imageMode(CENTER);

      background(0);
       for (int i = 0; i< nCol; i++){
        for (int j = 0; j< nRow; j++){
         int index = nCol*j + i;
         image(small[index], w*(i+0.5), h*(j+0.5), 200, 200); 
        }
       } 
    }else if (key == 'l' || key == 'L'){
      background(0);
       for (int i = 0; i< nColL; i++){
        for (int j = 0; j< nRowL; j++){
         int index = nColL*j + i;
         image(large[index], wL*(i+0.5), hL*(j+0.5), 750, 800); 
        }
       } 
    }else if (key == '3'){
      imageMode(CORNER);
      background(0);
        image(smile[0],0,0,1500,1600);
        image(smile[1],1500,0,1500,1600);     
    }else if (key == '4'){
      imageMode(CORNER);
      background(0);
        image(smile[2],0,0,1500,1600);
        image(smile[3],1500,0,1500,1600);
    }else if (key == '0'){
      background(0);
      textSize(20);
      text("Welcome to your subconscious",1300,250);
      textSize(18);
      text("To go into immersive mode press X",1300,300);
      textSize(14);
      text("To see the redish images press R",1300,400);
      text("To see the greenish images press G",1300,450);
      text("To see the blueish images press B",1300,500);
      text("To see the images you cared least about press S",1300,550);
      text("To see the images you cared most about press L",1300,600);
      text("To see the images you smiled on press 3, 4",1300,650);
     
    }else if (key == 'p'){
      screenshots++;
      //saveFrame("mersive/mersive"+screenshots+".png");
     
    }
 }
 

 
}
  
  
  
 

String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}
