import java.util.List;
List<int[][]> makeMatinsList() {
int[][] solutionArray = new int[2][8];
List<int[][]> ListOfSolutions = new ArrayList<int[][]>();

for (int numtimesrun = 1; numtimesrun<=8; numtimesrun++){
for (int x = 0; x<=7; x++) {
    solutionArray[x][0] = (int) random(0,7);
    solutionArray[x][1] = (int) random(0,7);
    }
    ListOfSolutions.add(solutionArray);
}
return ListOfSolutions;
}