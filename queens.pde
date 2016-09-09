//initialize a blank array
//give sizeofarray and array to emile
//he gives back a cleared out array
//put a queen in the first availible spot
//repeat
//if you get near bottom and it doesnt work, break
//mark spot as 0 and move queen to next one
//2=queen
//1=unavailable
//0=available






int sizeOfArray;
int size=600;
int posx;
int posy;
boolean yes=true;

void setup(){
  size(600,600);
  surface.setResizable(true);
  background(0);
  fill(255);
  noStroke();
}

void draw(){}

void keyPressed(){
  if(key=='0') sizeOfArray=sizeOfArray*10;
  if(key=='1') sizeOfArray=sizeOfArray*10+1;
  if(key=='2') sizeOfArray=sizeOfArray*10+2;
  if(key=='3') sizeOfArray=sizeOfArray*10+3;
  if(key=='4') sizeOfArray=sizeOfArray*10+4;
  if(key=='5') sizeOfArray=sizeOfArray*10+5;
  if(key=='6') sizeOfArray=sizeOfArray*10+6;
  if(key=='7') sizeOfArray=sizeOfArray*10+7;
  if(key=='8') sizeOfArray=sizeOfArray*10+8;
  if(key=='9') sizeOfArray=sizeOfArray*10+9;
  if(key==' '){
    sizeOfArray=0;
    yes=true;
    posx=0;
    posy=0;
    size=600;
    background(0);
    keyCode=0;
    surface.setSize(600,600);
  }
  if(keyCode==ENTER&&sizeOfArray>=8){
    int[][] board = new int[sizeOfArray][sizeOfArray];
    int numQueens=0;
    int x=0;
    int y=0;
    while(x<sizeOfArray&&y<sizeOfArray){
      board[x][y]=2;
      numQueens++;
      board=eliminateDeadElements(sizeOfArray,board);
      x++;
      while(board[x][y]!=0){
        y++;
      }
    }
  }
}