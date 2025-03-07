void main() {
  // Variabel dan tipe data
  String nama = "Cheryl";
  int umur = 18;

  // Menampilkan informasi
  print("Nama: $nama");
  print("Umur: $umur");

  // Pengkondisian
  if (umur >= 18) {
    print("Dewasa");
  } else {
    print("Belum dewasa");
  }

  // Perulangan
  for (int i = 1; i <= 3; i++) {
    print("Angka ke-$i");
  }

  // Fungsi
  int tambah(int a, int b) {
    return a * b;
  }

  // Memanggil fungsi
  int hasil = tambah(10, 7);
  print("Hasil: $hasil");
}