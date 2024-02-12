import '../constant/endpoint_list.dart';

enum ArahPerjalanan { satuArah, berbalik }

class Perjalanan {
  String idLaluan;
  String idPerkhidmatan;
  String idPerjalanan;
  String? idBentuk;
  String? petunjukPerjalanan;
  ArahPerjalanan? idArah;

  Perjalanan(
    this.idLaluan,
    this.idPerkhidmatan,
    this.idPerjalanan,
    this.idBentuk,
    this.petunjukPerjalanan,
    this.idArah,
  );

  factory Perjalanan.dariCsv(List<dynamic> data, Kategori kategori) =>
      Perjalanan(
        data[0].toString(),
        data[1].toString(),
        data[2] as String,
        data[3] != '' ? data[3].toString() : null,
        data[4] != '' ? data[4].toString() : null,
        tukar(data[5] as int),
      );

  @override
  String toString() =>
      'Perjalanan{idLaluan: $idLaluan, idPerkhidmatan: $idPerkhidmatan, idPerjalanan: $idPerjalanan, idBentuk: $idBentuk, petunjukPerjalanan: $petunjukPerjalanan, idArah: $idArah}';
}

ArahPerjalanan? tukar(int? nilai) => switch (nilai) {
      0 => ArahPerjalanan.satuArah,
      1 => ArahPerjalanan.berbalik,
      int() || null => null,
    };
