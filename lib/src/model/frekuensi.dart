import 'package:prasarana_rapid/src/util/util_string.dart';

import '../constant/endpoint_list.dart';

/// diambil daripada frequencies.txt
class Frekuensi {
  /// ID Asing yang diambil dari Perjalanan.idPerjalanan
  String idPerjalanan;
  DateTime masaMula;
  DateTime masaTamat;
  int headwaySecs;

  // todo: buat enum
  /// 0 atau null - frequency based trips
  /// 1 - schedule based trips
  int? exactTimes;

  Frekuensi(
    this.idPerjalanan,
    this.masaMula,
    this.masaTamat,
    this.headwaySecs,
    this.exactTimes,
  );

  factory Frekuensi.dariCsv(List<dynamic> data, Kategori kategori) => Frekuensi(
        data[0],
        data[1].toString().keDateTime,
        data[2].toString().keDateTime,
        data[3],
        data[4],
      );
}
