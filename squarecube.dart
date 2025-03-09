int squareAux(int n, int result) {
  if (n == 0) 
  return result;
  return squareAux(n - 1, result + 2 * n -1);
}

int square(int n) {
  return squareAux(n, 0);
}

int cubeAux(int n, int result) {
  if (n == 0)
  return result;
  return cubeAux(n - 1, result + squareAux(n, 0));
}

int cube(int n) {
  return cubeAux(n, 0);
}

void main() {
  print("Square of 5: ${square(5)}");
  print("Cube of 5: ${cube(5)}");
  print("Cube of 123: ${cube(123)}");
}