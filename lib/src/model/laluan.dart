/// diambil daripada routes.txt
class Laluan {
  String id;
  String idAgensi;
  String namaPendek;
  String? namaPenuh;
  int? jenisLaluan;
  String? warnaLaluan;
  String? warnaTeksLaluan;

  Laluan(
    this.id,
    this.idAgensi,
    this.namaPendek,
    this.namaPenuh,
    this.jenisLaluan,
    this.warnaLaluan,
    this.warnaTeksLaluan,
  );

  factory Laluan.dariCsv(List<dynamic> data) {
    for (final lala in data) {
      if (lala == '') print('objek null: $data');
    }
    return Laluan(
      data[0],
      data[1],
      data[2].toString(),
      data[3],
      data[4],
      data[5].toString(),
      data[6].toString(),
    );
  }
}

// [H4100, rapidkl, MS01, MRT Putrajaya Sentral ~ Dataran Putrajaya, 3, 21618C, FFFFFF]
// [S4000, rapidkl, SA01, Stesen KTM Seksyen 19 ~ Seksyen 7, 3, 8716, FFFFFF]
