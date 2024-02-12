import '../constant/endpoint_list.dart';

enum JenisKenderaan {
  tram,
  relBawahTanah,
  rel,
  bas,
  feri,
  tramBerkabel,
  lifUdara,
  keretaApiBukit,
  basElektrik,
  monorel
}

/// diambil daripada routes.txt
class Laluan {
  String id;
  String? idAgensi;
  String? namaPendek;
  String namaPenuh;
  JenisKenderaan jenisLaluan;
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

  factory Laluan.dariCsv(List<dynamic> data, Kategori kategori) {
    // cariParamNull(data);

    return switch (kategori) {
      Kategori.basPerantaraMrt => Laluan(
          data[0].toString(),
          data[1] == '' ? null : data[1],
          data[2] == '' ? null : data[2],
          data[3],
          tukar(data[4]),
          null,
          null,
        ),
      Kategori.basKL || Kategori.relKL => Laluan(
          data[0],
          data[1],
          data[2].toString(),
          data[3],
          data[4],
          data[5].toString(),
          data[6].toString(),
        ),
    };
  }

  @override
  String toString() {
    return 'Laluan{id: $id, idAgensi: $idAgensi, namaPendek: $namaPendek, namaPenuh: $namaPenuh, jenisLaluan: $jenisLaluan, warnaLaluan: $warnaLaluan, warnaTeksLaluan: $warnaTeksLaluan}';
  }
}

JenisKenderaan tukar(int nilai) => switch (nilai) {
      0 => JenisKenderaan.tram,
      1 => JenisKenderaan.relBawahTanah,
      2 => JenisKenderaan.rel,
      3 => JenisKenderaan.bas,
      12 => JenisKenderaan.monorel,
      int() => JenisKenderaan.feri
    };
