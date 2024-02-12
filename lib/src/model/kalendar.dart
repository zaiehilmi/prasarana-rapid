import '../constant/endpoint_list.dart';

/// diambil daripada calendar.txt
class Kalendar {
  String id;
  int isnin; // todo: tukar jadi enum Ketersediaan
  int selasa;
  int rabu;
  int khamis;
  int jumaat;
  int sabtu;
  int ahad;
  DateTime tarikhMula;
  DateTime tarikhAkhir;

  Kalendar(
    this.id,
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
    // cariParamNull(data);

    return Kalendar(
      data[0].toString(),
      data[1],
      data[2],
      data[3],
      data[4],
      data[5],
      data[6],
      data[7],
      DateTime.parse(data[8].toString()),
      DateTime.parse(data[9].toString()),
    );
  }

  @override
  String toString() =>
      'Kalendar{id: $id, isnin: $isnin, selasa: $selasa, rabu: $rabu, khamis: $khamis, jumaat: $jumaat, sabtu: $sabtu, ahad: $ahad, tarikhMula: $tarikhMula, tarikhAkhir: $tarikhAkhir}';
}
