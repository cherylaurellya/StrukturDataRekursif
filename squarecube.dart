int squareAux(int n, [int acc = 0]) {
  if (n == 0) 
  return acc;
  return squareAux(n - 1, acc + 2 * n -1);
}

int cubeAux(int n, [int acc = 0]) {
  if (n == 0)
return acc;
return cubeAux(n - 1, acc + 3 * n * n - 3 * n + 1);
}


void main() {
  print("Square of 5: ${squareAux(5)}");
  print("Cube of 5: ${cubeAux(5)}");
  print("Cube of 123: ${cubeAux(123)}");
}