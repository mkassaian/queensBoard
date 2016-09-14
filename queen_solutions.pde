import java.util.List;

ArrayList<int []> findSolutions(int sizeBoard) {
  ArrayList<int[]> ListOfSolutions = new ArrayList<int[]>();
  int solutionsfound = 0;
  int[] board = new int[sizeBoard];
    for (int x=0; x<=(int)pow(sizeBoard, sizeBoard); x++){
      for (int n=1; n<=sizeBoard; n++){
          board[n-1] = x%((int)pow(sizeBoard,n-1));
      }
      if (checkSolution(board, sizeBoard)){
        ListOfSolutions.add(board);
        solutionsfound+=1;
      }
    } 
    println("solutionsfound: " + solutionsfound);
 return ListOfSolutions;
}

boolean checkSolution(int[] board, int size){
  boolean Works = true;
  for (int n=1; n<=size; n++){
    for (int m=n+1; m<=size; m++){
      if (board[n-1] - board[m-1] == n-m)
        Works = false;
      if (board[n-1] - board[m-1] == m-n)
        Works = false;
      if (board[n-1] - board[m-1] == 0);
        Works = false;       
    }
  }
  return Works;
}