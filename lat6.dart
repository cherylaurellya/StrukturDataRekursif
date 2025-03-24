import 'dart:io';
import 'dart:core';

void generateAndAddRandomList(List<num> targetList, int jumlahData) {
  List<int> generatedList = List<int>.generate(jumlahData, (index) => index);

  generatedList.shuffle();
  targetList.addAll(generatedList);
}

void insertionSort<T extends Comparable<T>>(List<T> arr) {
  for (int i = arr.length - 1; i >= 0; i--) {
    for (int j = i + 1, k = i; j < arr.length; j++) {
      if (arr[j].compareTo(arr[k]) > 0) {
        break;
      } else {
        T temp = arr[k];
        arr[k] = arr[j];
        arr[j] = temp;
        k = j;
      }
    }
  }
}

void selectionSort<T extends Comparable<T>>(List<T> arr) {
  T temp;
  for (int i = arr.length - 1; i >= 0; i--) {
    int max = i;
    for (int j = i - 1; j >= 0; j--) {
      if (arr[j].compareTo(arr[max]) > 0) max = j;
    }
    temp = arr[i];
    arr[i] = arr[max];
    arr[max] = temp;
  }
}

void bubbleSort<T extends Comparable<T>>(List<T> arr) {
  int i, j;
  T temp;
  for (i = 0; i < arr.length - 1; i++) {
    for (j = 0; j < arr.length - i - 1; j++) {
      if (arr[j].compareTo(arr[j + 1]) > 0) {
        temp = arr[j + 1];
        arr[j + 1] = arr[j];
        arr[j] = temp;
      }
    }
  }
}

void shellSort<T extends Comparable<T>>(List<T> arr) {
  int i, jarak;
  bool didSwap = true;
  T temp;
  jarak = arr.length;
  while (jarak > 1) {
    jarak = (jarak / 2).floor();
    didSwap = true;
    while (didSwap) {
      didSwap = false;
      i = 0;
      while (i < (arr.length - jarak)) {
        if (arr[i].compareTo(arr[i + jarak]) > 0) {
          temp = arr[i];
          arr[i] = arr[i + jarak];
          arr[i + jarak] = temp;
          didSwap = true;
        }
        i++;
      }
    }
  }
}

void quickSort<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int q;
  if (p < r) {
    q = partition(arr, p, r);
    quickSort(arr, p, q);
    quickSort(arr, q + 1, r);
  }
}

int partition<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int i, j;
  T pivot, temp;
  pivot = arr[p];
  i = p;
  j = r;
  while (i <= j) {
    while (pivot.compareTo(arr[j]) < 0) j--;
    while (pivot.compareTo(arr[i]) > 0) i++;
    if (i < j) {
      temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      j--;
      i++;
    } else {
      return j;
    }
  }
  return j;
}

void mergeSort<T extends Comparable<T>>(List<T> arr, int l, int r) {
  int med;
  if (l < r) {
    med = (l + r) ~/ 2;
    mergeSort(arr, l, med);
    mergeSort(arr, med + 1, r);
    merge(arr, l, med, r);
  }
}

void merge<T extends Comparable<T>>(
    List<T> arr, int left, int median, int right) {
  List<T?> temp = List.filled(arr.length, null);
  int kiri1, kanan1, kiri2, kanan2, i, j;
  kiri1 = left;
  kanan1 = median;
  kiri2 = median + 1;
  kanan2 = right;
  i = left;
  while ((kiri1 <= kanan1) && (kiri2 <= kanan2)) {
    if (arr[kiri1].compareTo(arr[kiri2]) <= 0) {
      temp[i] = arr[kiri1];
      kiri1++;
    } else {
      temp[i] = arr[kiri2];
      kiri2++;
    }
    i++;
  }
  while (kiri1 <= kanan1) {
    temp[i] = arr[kiri1];
    kiri1++;
    i++;
  }
  while (kiri2 <= kanan2) {
    temp[i] = arr[kiri2];
    kiri2++;
    i++;
  }
  j = left;
  while (j <= right) {
    arr[j] = temp[j]!;
    j++;
  }
}

void testInsertionSort(List<int> dataSizes) {
  testAlgorithm<num>("Insertion Sort", dataSizes, (data) {
    insertionSort<num>(data);
  });
}

void testSelectionSort(List<int> dataSizes) {
  testAlgorithm<num>("Selection Sort", dataSizes, (data) {
    selectionSort<num>(data);
  });
}

void testBubbleSort(List<int> dataSizes) {
  testAlgorithm<num>("Bubble Sort", dataSizes, (data) {
    bubbleSort<num>(data);
  });
}

void testShellSort(List<int> dataSizes) {
  testAlgorithm<num>("Shell Sort", dataSizes, (data) {
    shellSort<num>(data);
  });
}

void testQuickSort(List<int> dataSizes) {
  testAlgorithm<num>("Quick Sort", dataSizes, (data) {
    quickSort<num>(data, 0, data.length - 1);
  });
}

void testMergeSort(List<int> dataSizes) {
  testAlgorithm<num>("Merge Sort", dataSizes, (data) {
    mergeSort<num>(data, 0, data.length - 1);
  });
}

void testAlgorithm<T extends Comparable<T>>(
    String algorithmName, 
    List<int> dataSizes,
    void Function(List<T>) runSort) {
  
  print('\n== Pengujian algoritma: $algorithmName ==');
  
  for (int size in dataSizes) {
    List<num> data = [];
    generateAndAddRandomList(data, size);
    
    print('Data size: $size');
    DateTime start = DateTime.now();
    
    runSort(data as List<T>);
    
    Duration elapsedTime = DateTime.now().difference(start);
    print('Waktu: ${elapsedTime.inMilliseconds} ms');
  }
}

void main() {
  List<int> dataSizes = [500000];
  
testInsertionSort(dataSizes);
testSelectionSort(dataSizes);
testBubbleSort(dataSizes);
testShellSort(dataSizes);
testQuickSort(dataSizes);
testMergeSort(dataSizes);
}