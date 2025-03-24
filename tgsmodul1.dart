class Mahasiswa implements Comparable<Mahasiswa> {
  String nim;
  String nama;

  Mahasiswa(this.nim, this.nama);

  @override
  int compareTo(Mahasiswa other) {
    return nim.compareTo(other.nim);
  }

  @override
  String toString() {
    return 'Mahasiswa($nim, $nama)';
  }
}

class Latihan {
  static void bubbleSort<T extends Comparable<T>>(List<T> arr) {
    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (arr[j].compareTo(arr[j + 1]) > 0) {
          // Swap
          T temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }
      }
    }
  }

  static void display<T>(List<T> data) {
    for (var item in data) {
      print(item);
    }
  }

  static void main() {
    List<Mahasiswa> mahasiswaList = [
      Mahasiswa("02", "Budi"),
      Mahasiswa("01", "Andi"),
      Mahasiswa("03", "Candra"),
    ];

    print('Data Sebelum Pengurutan:');
    display(mahasiswaList);

    DateTime startTime = DateTime.now();
    bubbleSort(mahasiswaList);
    DateTime endTime = DateTime.now();

    Duration elapsedTime = endTime.difference(startTime);
    print('Data Setelah Pengurutan:');
    display(mahasiswaList);
    print('Waktu: ${elapsedTime.inMilliseconds} ms');
  }
}

void main() {
  Latihan.main();
}