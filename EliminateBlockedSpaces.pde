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