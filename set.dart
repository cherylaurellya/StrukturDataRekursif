void main() {
  Set<int> number = {};
  number.add(10);
  number.add(20);
  print("Set Data: ${number}");

  number.remove(20);
  print(number);
  number.add(50);
  print(number);

  var mahasiswa = {"Heri", "Jevon", "Rendra", true, 1, 0.5};
  mahasiswa.remove("Jevon");
  print(mahasiswa);

}