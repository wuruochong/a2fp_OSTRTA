import java.util.*;

public class Board {
  
  private int[][] board = new int[50][50];  //to store coordinates of board

  public Board(){ //testing purposes
     for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        board[i][j] = j;
      }
  }
  }
  //public Board(String filename) { }
  
  public boolean isWall(int x, int y) { return getVal(x,y) < 50; }
  
  public int getVal(int x, int y) { return board[x][y]; }
  
  public void setVal (int x, int y, int val) { board[x][y] = val; }
  
  public int[][] getBoard() { return board; }
  

  void draw() {
  }
    
  void keyPressed() {
    
  } 
  
}