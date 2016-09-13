//2=queen
//1=unavailable
//0=available

import java.util.List;

int dim;
int size=800;
int posx;
int posy;
boolean white=true;
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

double averageofarray(int[] board, int sz) {
  double average = 0;
  for (int x=1; x<=sz; x++) {
    average = average + board[x];
    average = average/sz;
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
  while(size%dim!=0){
    surface.setSize(size,size);
    size++;
  }
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
  fill(200, 50, 170);
  //int[] solutionArray = solutionList.get(solutionCounter);
  //for(int i=0;i<dim;i++) ellipse(size/dim*(i+1),solutionArray[i],size/dim,size/dim);
}

void setup() {
  size(800,800);
  surface.setResizable(true);
  background(0);
  noStroke();
  fill(255);
}

void draw(){      //tfw you wanted to use keyPressed() but it wont work :(
  if(keyCode==LEFT){
    solutionCounter--;
    drawCheckerboard();
    keyCode=0;
  }
  if(keyCode==RIGHT){
    solutionCounter++;
    drawCheckerboard();
    keyCode=0;
  }
  if(keyCode==ENTER){
    solutionList=findSolutions(dim); //<>//
    drawCheckerboard();
    keyCode=0;
  }
  switch(key){
    case '1':
      dim=1;
      key='0';
      break;
    case '2':
      dim=2;
      key='0';
      break;
    case '3':
      dim=3;
      key='0';
      break;
    case '4':
      dim=4;
      key='0';
      break;
    case '5':
      dim=5;
      key='0';
      break;
    case '6':
      dim=6;
      key='0';
      break;
    case '7':
      dim=7;
      key='0';
      break;
    case '8':
      dim=8;
      key='0';
      break;
    case '9':
      dim=9;
      key='0';
      break;
  }
}