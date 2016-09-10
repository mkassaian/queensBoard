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
int numQueens=0;

int[][] eliminateBlockedSpaces(int sizeOfArray, int[][] board) {
  for (int x = 0; x<sizeOfArray; x++) { //horizontal movement
    for (int y = 0; y<sizeOfArray; y++) { // vertical movement
      if (board[x][y] == 2) { //look for 2's (queens)
        for (int xx = 0; xx<sizeOfArray; xx++) { //once found, put 1s in places with same y
          if (xx!=x)
            board[xx][y] = 1;
        }
        for (int yy =0; yy<sizeOfArray; yy++)
        { //once found, put 1s in places with same x
          if (yy != y)
            board[x][yy] = 1;
        }
        if (x!=0) {
          for (int diagonalW=1; diagonalW < x; diagonalW++) {
            if (y-diagonalW>=0)
              board[x-diagonalW][y-diagonalW] = 1;
            if (y+diagonalW<sizeOfArray)
              board[x-diagonalW][y+diagonalW] = 1;
          }
        }
        if (x!=sizeOfArray -1) {
          for (int diagonalE=1; diagonalE + x < sizeOfArray; diagonalE++) {
            if (y-diagonalE>0) 
              board[x+diagonalE][y-diagonalE] = 1;
            if (y+diagonalE < sizeOfArray);
            board[x+diagonalE][y+diagonalE] = 1;
          }
        }
      }
    }
  }
  return board;
}


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
  if(keyCode==ENTER&&sizeOfArray>=8&&numQueens<8){
    int[][] board = new int[sizeOfArray][sizeOfArray];
    int x=0;
    int y=0;
    while(x<sizeOfArray&&y<sizeOfArray){
      board[x][y]=2;
      numQueens++;
      board=eliminateBlockedSpaces(sizeOfArray,board);
      x++;
      while(board[x][y]!=0){
        y++;
      }
    }
    for(y=0;y<8;y++){
      x=0;
      while(x<8){
        print(board[x][y] + ", ");
        x++;
      }
      println();
    }
  }
}