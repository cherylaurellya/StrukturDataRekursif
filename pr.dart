import 'dart:io';

void main() {
  // Definisi menu
  Map<String, Map<String, dynamic>> menu = {
    "D": {"Jenis": "Dada", "Harga": 2500.00},
    "P": {"Jenis": "Paha", "Harga": 2000.00},
    "S": {"Jenis": "Sayap", "Harga": 1500.00},
  };

  // Tampilkan menu
  displayMenu(menu);
  
  List<Map<String, dynamic>> pesanan = [];
  
  stdout.write('Masukkan banyak jenis pesanan: ');
  int? banyakJenis = int.tryParse(stdin.readLineSync() ?? '');
  
  if (banyakJenis == null || banyakJenis <= 0) {
    print('Input tidak valid! Masukan lagi!');
    return;
  }

  // Proses input pesanan
  for (int i = 1; i <= banyakJenis; i++) {
    print('\nJenis ke-$i:');
    stdout.write('Jenis Potong[D/P/S]: ');
    String? kode = stdin.readLineSync()?.toUpperCase();
    
    if (kode == null || !menu.containsKey(kode)) {
      print('Kode pesanan tidak valid!');
      i--;
      continue;
    }

    stdout.write('Banyak Potong: ');
    int? jumlah = int.tryParse(stdin.readLineSync() ?? '');
    
    if (jumlah == null || jumlah <= 0) {
      print('Jumlah tidak valid!');
      i--;
      continue;
    }

    pesanan.add({
      'jenis': menu[kode]!['Jenis'],
      'harga': menu[kode]!['Harga'],
      'jumlah': jumlah,
    });
  }

  // Tampilkan struk
  tampilkanStruk(pesanan);
}

void displayMenu(Map<String, Map<String, dynamic>> menu) {
  print("\nGEROBAK FRIED CHICKEN");
  print("======================================");
  print("Kode\tJenis\t\tHarga");
  print("======================================");
  menu.forEach((kode, item) {
    print("$kode\t${item['Jenis']}\t\tRp. ${item['Harga'].toStringAsFixed()}");
  });
  print("======================================");
  
}

void tampilkanStruk(List<Map<String, dynamic>> pesanan) {
  print("\nGEROBAK FRIED CHICKEN");
  print("=======================================");
  print("No\tJenis\tHarga\tBanyak\tTotal");
  print("=======================================");
  
  double totalBayar = 0;
  for (int i = 0; i < pesanan.length; i++) {
    var item = pesanan[i];
    double total = item['harga'] * item['jumlah'];
    totalBayar += total;
    
    print("${i + 1}\t${item['jenis']}\t${item['harga']}\t${item['jumlah']}\t$total");
  }
  
  print("=========================================");
  print("Jumlah Bayar : Rp. $totalBayar");
  int pajak = totalBayar ~/ 10; // Pembagian integer untuk 10%
  print("Pajak        : Rp. $pajak");
  print("Total Bayar  : Rp. ${totalBayar + pajak}");
  print("==========================================");
}
