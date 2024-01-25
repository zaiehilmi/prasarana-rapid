import 'package:prasarana_rapid/src/util/util_string.dart';

import '../constant/endpoint_list.dart';

class WaktuBerhenti {
  String idPerjalanan;
  DateTime? ketibaan;
  DateTime? pelepasan;
  int idBerhenti;
  int susunanBerhenti;
  String? petunjuk;

  WaktuBerhenti(
    this.idPerjalanan,
    this.ketibaan,
    this.pelepasan,
    this.idBerhenti,
    this.susunanBerhenti,
    this.petunjuk,
  );

  factory WaktuBerhenti.dariCsv(List<dynamic> data, Kategori kategori) =>
      WaktuBerhenti(
        data[0],
        data[1].toString().keDateTime,
        data[2].toString().keDateTime,
        data[3],
        data[4],
        data[5].toString().jadiNullJikaTiadaData,
      );

  @override
  String toString() =>
      'WaktuBerhenti{idPerjalanan: $idPerjalanan, ketibaan: $ketibaan, pelepasan: $pelepasan, idBerhenti: $idBerhenti, susunanBerhenti: $susunanBerhenti, petunjuk: $petunjuk}';
}

// [weekend_U8510_U851002_0, 06:30:00, 06:30:00, 1004342, 1, Kompleks Mahkamah Jalan Duta]
// [weekday_T7570_T757002_0, 06:01:16, 06:01:16, 1008428, 4, SEKSYEN 27 SHAH ALAM]
