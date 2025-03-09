import 'dart:io';

int pascal(int row, int col) {
  if (col == 0 || col == row) {
    return 1;
  } else {
    return pascal(row - 1, col - 1) + pascal(row -1, col);
  }

}

void printPascal(int n) {
  for (int i = 0; i < n; i++) {
    stdout.write("F${i+1}");

    for (int j = 0; j <= 1; j++) {
  stdout.write("${pascal(i, j)}");
}
  }
  print("");
  
}

void main() {
  stdout.write("Masukan jumlah baris segitigas pascal: ");
  int n = int.parse(stdin.readLineSync()!);

  printPascal(n);
}
