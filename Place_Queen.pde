int [] PlaceQueen(int sizeOfArray,int[][] board){
  for (int y = 0; y<= sizeOfArray; y++){
    for (int x = 0; x<= sizeOfArray; x++){
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