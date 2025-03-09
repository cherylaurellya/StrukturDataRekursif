
import 'dart:io';

int pascal(int row, int col) {
  if (col == 0 || col == row) {
    return 1;
} 
  return pascal(row - 1, col - 1) + pascal(row - 1, col);
}


void PascalTriangle(int row) {
  for (int i = 0; i < row; i++) {
    
    stdout.write(" " * (row - i - 1));

    for (int j = 0; j <= i; j++) {
      stdout.write("${pascal(i, j)} ");
      if (pascal(i, j) < 10) {
     
      stdout.write(" ");
    }
    }
     stdout.writeln();
   
    }
    
    }


void main() {
  PascalTriangle(5);
}