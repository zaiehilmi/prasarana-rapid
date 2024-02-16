import '../constant/endpoint_list.dart';

enum Ketersediaan { ya, tidak }

/// diambil daripada calendar.txt
class Kalendar {
  String idKalendar;
  Ketersediaan isnin;
  Ketersediaan selasa;
  Ketersediaan rabu;
  Ketersediaan khamis;
  Ketersediaan jumaat;
  Ketersediaan sabtu;
  Ketersediaan ahad;
  DateTime tarikhMula;
  DateTime tarikhAkhir;

  Kalendar(
    this.idKalendar,
    this.isnin,
    this.selasa,
    this.rabu,
    this.khamis,
    this.jumaat,
    this.sabtu,
    this.ahad,
    this.tarikhMula,
    this.tarikhAkhir,
  );

  factory Kalendar.dariCsv(List<dynamic> data, Kategori kategori) {
    return Kalendar(
      data[0].toString(),
      tukar(data[1]),
      tukar(data[2]),
      tukar(data[3]),
      tukar(data[4]),
      tukar(data[5]),
      tukar(data[6]),
      tukar(data[7]),
      DateTime.parse(data[8].toString()),
      DateTime.parse(data[9].toString()),
    );
  }

  @override
  String toString() =>
      'Kalendar{id: $idKalendar, isnin: $isnin, selasa: $selasa, rabu: $rabu, khamis: $khamis, jumaat: $jumaat, sabtu: $sabtu, ahad: $ahad, tarikhMula: $tarikhMula, tarikhAkhir: $tarikhAkhir}';
}

Ketersediaan tukar(int nilai) => switch (nilai) {
      0 => Ketersediaan.ya,
      int() => Ketersediaan.tidak,
    };
