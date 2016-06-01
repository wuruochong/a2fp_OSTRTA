import java.util.*;

public class Board {
  
  private int[][] board;  //to store coordinates of board

  public Board(String filename) {

  }
  
  public boolean isWall(int x, int y) { return board[x][y] < 50; }
  
  public int getVal(int x, int y) { return board[x][y]; }
  
  public void setVal (int x, int y, int val) { board[x][y] = val; }
  
  public int[][] getBoard() { return board; }
  

  void draw() {
  }
    
  void keyPressed() {
    
  } 
  
}