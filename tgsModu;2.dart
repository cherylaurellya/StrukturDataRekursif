class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;

  Mahasiswa(this.nrp, this.nama);

  @override
  int compareTo(Mahasiswa other) {
    return nrp.compareTo(other.nrp);
  }

  @override
  String toString() {
    return 'Mahasiswa(nrp: $nrp, nama: $nama)';
  }
}

class Latihan {
  static int partition<T extends Comparable<T>>(List<T> arr, int low, int high) {
    T pivot = arr[high];
    int i = low - 1;

    for (int j = low; j < high; j++) {
      if (arr[j].compareTo(pivot) < 0) {
        i++;
        T temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }

    T temp = arr[i + 1];
    arr[i + 1] = arr[high];
    arr[high] = temp;
    return i + 1;
  }

  static void quickSort<T extends Comparable<T>>(List<T> arr, int low, int high) {
    if (low < high) {
      int pi = partition(arr, low, high);
      quickSort(arr, low, pi - 1);
      quickSort(arr, pi + 1, high);
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
      Mahasiswa("05", "Dina"),
      Mahasiswa("04", "Eko"),
    ];

    print('Data Sebelum Pengurutan:');
    display(mahasiswaList);

    DateTime startTime = DateTime.now();
    quickSort(mahasiswaList, 0, mahasiswaList.length - 1);
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