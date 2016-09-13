//2=queen
//1=unavailable
//0=available

import java.util.List;

int dim;
int size=800;
int posx;
int posy;
boolean white=true;
int board[][] = new int[8][8];
int solutionCounter;
List<int[]> solutionList;

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
void drawCheckerboard() {
  fill(255);
  while (posx<size) {
    while (posy<size) {
      if (white) rect(posx, posy,size/dim,size/dim);
      white=!white;
      posy+=size/dim;
    }
    if(dim%2==0)white=!white;
    posx+=size/dim;
    posy=0;
  }
  keyCode=0;
  dim=0;
  fill(200, 50, 170);
  int[] solutionArray = solutionList.get(solutionCounter);
  for(int i=0;i<dim;i++) ellipse(size/dim*(i+1),solutionArray[i],size/dim,size/dim);
}

void setup() {
  size(800, 800);
  surface.setResizable(true);
  background(0);
  noStroke();
  fill(255);
}

void keyPressed() {
  if(keyCode==LEFT){
    solutionCounter--;
    drawCheckerboard();
  }
  if(keyCode==RIGHT){
    solutionCounter++;
    drawCheckerboard();
  }
  if(dim!=0&&keyCode==ENTER){
    while(size%dim!=0){
      size++;
      surface.setSize(size,size);
    }
    solutionList=findSolutions(dim); //<>//
    drawCheckerboard();
  }
  if(key=='0') dim*=10;
  if(key=='1') dim=dim*10+1;
  if(key=='2') dim=dim*10+2;
  if(key=='3') dim=dim*10+3;
  if(key=='4') dim=dim*10+4;
  if(key=='5') dim=dim*10+5;
  if(key=='6') dim=dim*10+6;
  if(key=='7') dim=dim*10+7;
  if(key=='8') dim=dim*10+8;
  if(key=='9') dim=dim*10+9;
}