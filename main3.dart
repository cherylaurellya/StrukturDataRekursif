
import 'quicksort.dart' as quick;
import 'sort.dart' as sort;

void main() {
  List<int> arr = [10, 7, 8, 9, 1, 5];
  int n = arr.length;
  
  sort.mergeSort(arr, 0, n - 1);
  print('Hasil Pengurutan: ');
  quick.printArray(arr); 
}