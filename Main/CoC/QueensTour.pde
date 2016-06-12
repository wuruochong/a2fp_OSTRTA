import java.util.*;
import java.io.*;

public class QueensTour{

//instance variable---------------------------------------------------------------------
    private int[][] board;

//constructor----------------------------------------------------------------------------
    public QueensTour(int n)
    {  board = new int[n][n]; }

/***
* precondition: board is filled with 0's only.
* postcondition:
* If a solution is found, board shows position of N queens,
* returns true.
* If no solution, board is filled with 0's,
* returns false.
*/
  public boolean solve() { return solveH(0); }

/**
 *Helper method for solve.
*/
  public boolean solveH(int c) {
   if (c >= board.length) return true;
   for (int r = 0; r < board.length; r++) { //to go through each row
     if (addQueen(r,c))
    { if (solveH(c+1))  return true; //solve next col
       else  removeQueen(r,c); } }
   return false;}

/** Print board, a la toString...
    Except:
    all negs and 0's replaced with underscore
    all 1's replaced with 'Q'
*/
  public void printSolution(){
      for (int r = 0; r < board.length; r++) {
        for (int c = 0; c < board.length; c++) {
            if (board[r][c] != 1) print(" _ ");
            else print(" Q ");}
          println("");}}

//================= YE OLDE SEPARATOR =================

/***
* Adds a Queen to the board by setting the pos to 1, and crosses out the invalid areas of the board by setting them to -1
* precondition:
    boards is filled with #s
* postcondition:
    If board pos is not a 0 (empty slot) return false
    Else apply general description rule and return true
*/

  private boolean addQueen(int row, int col){
    if(board[row][col] != 0){
      return false;
    }
    board[row][col] = 1; //set to QUEEN
    int offset = 1;
    while(col+offset < board[row].length){
        board[row][col+offset]--; //horizontally across
        if(row - offset >= 0){
      board[row-offset][col+offset]--; //vertically up
        }
        if(row + offset < board.length){
      board[row+offset][col+offset]--; //diagonaly down
        }
        offset++;
    }
    return true;
      }

/***
* Removes the queen at the position and sets all the slots invalidated by the Queen to an empty slot
* precondition:
    boards is filled with #s
* postcondition:
    If board pos is not a 1 (Queen) return false
      Else apply general description rule and return true
*/
  private boolean removeQueen(int row, int col){
      if(board[row][col] != 1){
        return false; }
      board[row][col] = 0;
      int offset = 1;
      while(col+offset < board[row].length){
          board[row][col+offset]++;
          if(row - offset >= 0){
            board[row-offset][col+offset]++;
          }
          if(row + offset < board.length){
            board[row+offset][col+offset]++;
          }
          offset++;
      }
      return true;
        }

/***
Used to print the board in its original int form
* precondition:
    N/A
* postcondition:
    Current state of Board printed
*/
  public String toString(){
         String ans = "";
         for(int r = 0; r < board.length; r++){
             for(int c = 0; c < board[0].length; c++)
            {ans+= board[r][c]+"  ";}
          ans+="\n";}
         return ans;}




}
