import 'package:prasarana_rapid/src/util/string_util.dart';

/// diambil daripada frequencies.txt
class Frekuensi {
  String? id;
  DateTime masaMula;
  DateTime masaTamat;
  int? headwaySecs;
  int? exactTimes;

  Frekuensi(
    this.id,
    this.masaMula,
    this.masaTamat,
    this.headwaySecs,
    this.exactTimes,
  );

  factory Frekuensi.dariCsv(List<dynamic> data) => Frekuensi(
        data[0],
        data[1].toString().keDateTime,
        data[2].toString().keDateTime,
        data[3],
        data[4],
      );
}
