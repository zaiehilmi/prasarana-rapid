/// diambil daripada calendar.txt
class Kalendar {
  String id;
  int isnin;
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

  factory Kalendar.dariCsv(List<dynamic> data) {
    for (final lala in data) {
      if (lala == '') print('objek null: $data');
    }

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
}
