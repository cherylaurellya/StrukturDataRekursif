import 'sort2.dart';

void main() {
  generateRandomArray(1000);
  DateTime start = DateTime.now();
  print("Hasil Pengurutan: ${arr}");
  mergeSort(arr, 0, arr.length - 1);
  print(arr);
  DateTime end = DateTime.now();
  print("waktu eksekusi: ${end.difference(start).inMilliseconds} ms}");
}