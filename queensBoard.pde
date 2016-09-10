//initialize a blank array
//give 8 and array to emile
//he gives back a cleared out array
//put a queen in the first availible spot
//repeat
//if you get near bottom and it doesnt work, break
//mark spot as 0 and move queen to next one
//2=queen
//1=unavailable
//0=available


int posx;
int posy;
int x=0;
int y=0;
int numQueens=0;
boolean yes=true;


int[][] eliminateBlockedSpaces(int[][] board) {
  for (int x = 0; x<8; x++) { //horizontal movement
    for (int y = 0; y<8; y++) { // vertical movement
      if (board[x][y] == 2) { //look for 2's (queens)
        for (int xx = 0; xx<8; xx++) { //once found, put 1s in places with same y
          if (xx!=x)
            board[xx][y] = 1;
        }
        for (int yy =0; yy<8; yy++)
        { //once found, put 1s in places with same x
          if (yy != y)
            board[x][yy] = 1;
        }
        if (x!=0) {
          for (int diagonalW=1; diagonalW < x; diagonalW++) {
            if (y-diagonalW>=0)
              board[x-diagonalW][y-diagonalW] = 1;
            if (y+diagonalW<8)
              board[x-diagonalW][y+diagonalW] = 1;
          }
        }
        if (x!=7) {
          for (int diagonalE=1; diagonalE + x < 8; diagonalE++) {
            if (y-diagonalE>0) 
              board[x+diagonalE][y-diagonalE] = 1;
            if (y+diagonalE < 8)
              board[x+diagonalE][y+diagonalE] = 1;
          }
        }
      }
    }
  }
  return board;
}


int[] PlaceQueen(int[][] board){
  for (int y = 0; y<=8; y++){
    for (int x = 0; x<=8; x++){
      if(board[x][y]== 0){
        int[] queenLoc= new int[2];
        queenLoc[0] = x;
        queenLoc[1] = y; 
        return queenLoc;
      }
    }
  }
int[] noLoc = new int[1];
noLoc[0] = -1;
return noLoc;
}


void setup(){
  size(800,800);
  background(0);
  fill(255);
  noStroke();
  int[][] board = new int[8][8];
}

void draw(){
  while(posx<800){
    while(posy<800){
      if(yes){
        rect(posx,posy,100,100);
      }
      yes=!yes;
      posy+=100;
    }
    yes=!yes;
    posx+=100;
    posy=0;
  }
}

void keyPressed(){
  if(key==' '){
    yes=true;
    posx=0;
    posy=0;
    background(0);
  }
}