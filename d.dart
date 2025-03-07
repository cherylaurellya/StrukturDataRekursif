import 'dart:io';

void main() {
  print('GEROBAK FRIED CHICKEN');
  print('---------------------------------');
  print('Kode\tJenis\t\tHarga');
  print('D\tDada\t\tRp. 2.500');
  print('P\tPaha\t\tRp. 2.000');
  print('S\tSayap\t\tRp. 1.500');
  print('---------------------------------');

  List<Map<String, dynamic>> orders = [];

  while (true) {
    stdout.write('Jenis ke- (D/P/S): ');
    String? jenis = stdin.readLineSync();

    if (jenis == null || !['D', 'P', 'S'].contains(jenis.toUpperCase())) {
      print('Jenis tidak valid. Silakan coba lagi.');
      continue;
    }

    stdout.write('Jumlah Potong: ');
    int? jumlah = int.tryParse(stdin.readLineSync()!);

    if (jumlah == null || jumlah <= 0) {
      print('Jumlah tidak valid. Silakan coba lagi.');
      continue;
    }

    int harga = 0;
    String namaJenis = '';

    switch (jenis.toUpperCase()) {
      case 'D':
        harga = 2500;
        namaJenis = 'Dada';
        break;
      case 'P':
        harga = 2000;
        namaJenis = 'Paha';
        break;
      case 'S':
        harga = 1500;
        namaJenis = 'Sayap';
        break;
    }

    orders.add({'jenis': namaJenis, 'harga': harga, 'jumlah': jumlah});
    
    stdout.write('Ingin memesan lagi? (y/n): ');
    String? lanjut = stdin.readLineSync();
    if (lanjut == null || lanjut.toLowerCase() != 'y') break;
  }

  print('\nLAYAR KELUAR');
  print('GEROBAK FRIED CHICKEN');
  print('---------------------------------');
  print('No\tJenis Potong\tHarga Satuan\tBanyak Beli\tJumlah Harga');
  
  int totalBayar = 0;
  for (int i = 0; i < orders.length; i++) {
    var order = orders[i];
    int jumlahHarga = order['harga'] * order['jumlah'];
    totalBayar += jumlahHarga;
    print('${i + 1}\t${order['jenis']}\t\tRp. ${order['harga']}\t\t${order['jumlah']}\t\tRp. $jumlahHarga');
  }

  print('---------------------------------');
  print('Jumlah Bayar\t\tRp. $totalBayar');
  print('Pajak\t\t\tRp. 0'); // Misalkan pajak 0
  print('Total Bayar\t\tRp. $totalBayar');
}