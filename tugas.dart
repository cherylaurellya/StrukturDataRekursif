import 'dart:io';

void TambahItem(List<String> arr, String itemBelanja) {
  arr.add(itemBelanja);
}

void KurangiItem(List<String> arr, int nomor) {
  arr.removeAt(nomor - 1);
}

void main() {
  List<String> itemBelanja = [];

  while (true) {
    print("List Belanjaan hari ini >>");
    if (itemBelanja.isEmpty) {
      print("Daftar masih kosong......");

      print(" ");
    } else {
      for (var i = 0; i < itemBelanja.length; i++) {
        print("${i + 1}. ${itemBelanja[i]}");
      }

      print("");
    }
    print("Pilih Fitur");
    print("1. tambah item belanja");
    print("2. hapus item belanja");
    print("3. keluar");
    stdout.write("pilih dengan angka : ");
    var kondisi = stdin.readLineSync() ?? '';
    print(" ");
    if (kondisi == "1") {
      stdout.write("Tambahkan item belanjaan : ");
      String item = stdin.readLineSync() ?? '';
      TambahItem(itemBelanja, item);
    } else if (kondisi == "2") {
      stdout.write("Hapus daftar (sesuai angka): ");
      int nomor = int.parse(stdin.readLineSync() ?? '');

      KurangiItem(itemBelanja, nomor);
    } else {
      exit(0);
    }
  }
}
