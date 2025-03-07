void main() {
  List<dynamic> data = [];
  var item = ["Buku", "Pensil", "Penghapus"];
  data.addAll(item);
  
  void cetak() {
    for (int i = 0; i < data.length; i++) {
     print("List data ke-${i}: ${data[i]}");
  }
}
  print("List Data: ${data}");
  data.add(1);
  cetak();
   
  }