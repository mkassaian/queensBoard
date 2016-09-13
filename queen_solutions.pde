import java.util.List;

List<int []> findSolutions(int sizeBoard) {
  List<int[]> ListOfSolutions = new ArrayList<int[]>();
  int[] board = new int[sizeBoard];
  int startingvalue=0;
  for (int x = 1; x<=sizeBoard; x++){
    startingvalue = startingvalue + (int)pow(sizeBoard, x);
  }
    for (int x=startingvalue; x<=pow(sizeBoard, sizeBoard); x++){
      for (int n=1; n<=sizeBoard; n++){
        if ((x%(int)pow(sizeBoard, n))!=0)
          board[n] = x%((int)pow(sizeBoard,n));
        else
          board[n] = 8;
      }
      if (checkSolution(board, sizeBoard));
        ListOfSolutions.add(board);  
  }
  
 return ListOfSolutions;
}
double averageofarray(int[] board, int size) {
  double average = 0;
  for (int x=1; x<=size; x++) {
    average = average + board[x];
    average = average/size;
  }
  return average;
}

boolean checkSolution(int[] board, int size){
  boolean Works = true;
  for (int n=1; n<=size; n++){
    for (int m=n+1; m<=size; m++){
      if (board[n] - board[m] == n-m)
        Works = false;
      if (board[n] - board[m] == m-n)
        Works = false;
      if (board[n] - board[m] == 0);
        Works = false;       
    }
  }
  return Works;
}