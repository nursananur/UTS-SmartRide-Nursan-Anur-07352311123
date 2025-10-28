import 'dart:math';  // impor libarary untuk fungsi random

abstract class Transportasi {  // clas utama trasportasi
  String nama;  // atribut dari nama transportasi
  double tarif;  // atrbut tarif dasar
  Transportasi(this.nama, this.tarif); // kontrsuktor 
  double hitung(int jp); // metod abstrak untuk menghutung btotal biaya
}

class Taksi extends Transportasi { // turunan dari kelas trasnportasi
  double jarak; // jarak yang akan di tempuh
  Taksi(super.nama, super.tarif, this.jarak);  // konstruktor
  @override
  double hitung(int jp) => tarif*jarak;  // perhitungan total biaya taksi
}

class Bus extends Transportasi {  // turunan dri kelas transpotasi
  bool wifi;
  Bus(super.nama, super.tarif, this.wifi); // konstruktr
  @override
  double hitung(int jp) => tarif*jp + (wifi ? 5000 : 0); // tambahan biaya 5000 jika ada waifi tersedia
}

class Pesawat extends Transportasi {  // turunana dri class trasnportasi
  String kelas; // jenis kelas penerbangan
  Pesawat(super.nama, super.tarif, this.kelas); // konstruktor dengan parameter kelas
  @override
  double hitung(int jp) => tarif*jp * (kelas == 'Bisnis' ? 1.5 : 1.0); // jika menggunakan kelas  bisnis, tarif 1.5x
}

void main() { // daftar penumpang beserta jenis tranposrtasi dan jumlah perjalanan
  var list = [
    {'t': Taksi('Taksi', 5000, 15), 'n': 'Nursan','jp': 2}, // nama penumpang nursan
    {'t': Bus('Bus', 4000, true), 'n': 'Tanti', 'jp': 5}, // nama penumpang bus adalah tanti
    {'t': Pesawat('Pesawat Garuda', 800000, 'Bisnis'), 'n': 'Dzakira', 'jp': 1},  // nama penumpang pesawat adalah dzakira
  ];

for (var d in list) { // perulanngan untuk menampilkan hasil perhitungan tiap penumpang
  var t= d['t'] as Transportasi; // ambil objaek transportasi
  var jp= d['jp'] as int; // ambil jumlah perjalanan
  var total= t.hitung(jp); // hitung total biaya
  print('${d['n']} naik ${t.nama}: Rp${total.toStringAsFixed(0)} (ID-${Random().nextInt(999)})');

}
}