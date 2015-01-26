PFont font;
boolean initsplash = true;
int ancho =7, alto = 6, pix=100, jugador = 1;
int[][] board = new int[alto][ancho];

void setup() {
  size(700, 600); ellipseMode(CORNER);
}
int p(int y, int x) {
  return (y < 0 || x < 0 || y >= alto || x >= ancho) ? 0 : board[y][x];
}
int Ganador() { //rows,columns, diagnoals
  for (int y=0;y<alto;y++)for(int x=0;x<ancho;x++)
    if(p(y,x)!=0&&p(y,x)==p(y,x+1)&&p(y,x)==p(y,x+2)&&p(y,x)==p(y,x+3)) 
    return p(y,x);
  for (int y=0;y<alto;y++)for(int x=0;x<ancho;x++)
    if(p(y,x)!=0&&p(y,x)==p(y+1,x)&&p(y,x)==p(y+2,x)&&p(y,x)==p(y+3,x)) 
    return p(y,x);
  for (int y=0;y<alto;y++) for(int x=0;x<ancho;x++)for(int d=-1;d<=1;d+=2)
    if(p(y,x)!=0&&p(y,x)==p(y+1*d,x+1)&&p(y,x)==p(y+2*d,x+2)&&p(y,x)==p(y+3,x+3))
    return p(y,x);
  for (int y=0;y<alto;y++) for(int x=0;x<ancho;x++)
    return 0;
    
return -1;
}
int sigEspacio(int x) {
  for(int y=alto-1;y>=0; y--) if(board[y][x]==0) 
  return y;
  return -1;
  }
void mousePressed() {
  int x= mouseX /pix, y=sigEspacio(x);
  if(y>=0) {
    board [y][x] = jugador;
    jugador = jugador ==1?2:1;
  
  }  
  }
void draw(){
  if(initsplash==true){
background(#00008B);
  for(int a=0; a<5 ; a++){
  fill(#00FFFF);
  noStroke();
  ellipse(130, 100+(a*35),30, 30);
}
for(int b=0; b<5 ; b++){
  fill(#FFFF00);
  noStroke();
  ellipse(130+(b*35),240,30, 30);
}
for(int c=0; c<9 ; c++){
  fill(#FF0000);
  noStroke();
  ellipse(270, 100+(c*35),30, 30);
}
textSize(24);
fill(#778899);
text("Press SPACE and start", 250, 500);
font= loadFont("LEDCounter7-130.vlw");
textFont(font);
fill(#FFFAFA);
text("en", 310, 320);
fill(#00FF00);
text("raya", 310, 410);
}
else{
  if(Ganador()==0){
  for(int j=0;j<alto; j++) for(int i=0;i<ancho; i++){
    fill(255);
    stroke(17, 191, 193);
    strokeWeight(2);
    rect(i*pix,j*pix,pix, pix);
     if(board[j][i] >0) {
      fill(board[j][i]==1?255:0, board[j][i]==2?255:0,0); 
      noStroke();
      ellipse(i*pix, j*pix, pix, pix);
     }
     }
  }
else {
    background(0);
    fill(255);
    textSize(20);
    textAlign(CENTER);
    fill(0, 102, 153);
    text("Jugador"+Ganador(), width/2, height/2-80);
    
    textSize(50);
    fill(#FF0000);
    textAlign(CENTER);
    text("¡GANASTE!", width/2, height/2-20);
    textSize(20);
    fill(#778899);
    text("Press SPACE and start",width/2,height/2+180);
     
    if(keyPressed && key == ' ') {
      jugador=1;
        for (int y=0;y<alto;y++)for(int x=0;x<ancho;x++) board[y][x]=0;
    }
    }
 }
  }
  void keyPressed(){
   if (key == ' ')
    initsplash = false;
    }
