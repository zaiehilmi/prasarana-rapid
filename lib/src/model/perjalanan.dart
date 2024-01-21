class Perjalanan {
  String? idLaluan;
  String? idPerkhidmatan;
  String? idPerjalanan;
  String? idBentuk;
  String? petunjukPerjalanan;
  int? idArah;

  Perjalanan(
    this.idLaluan,
    this.idPerkhidmatan,
    this.idPerjalanan,
    this.idBentuk,
    this.petunjukPerjalanan,
    this.idArah,
  );

  factory Perjalanan.dariCsv(List<dynamic> data) => Perjalanan(
        data[0] as String,
        data[1] as String,
        data[2] as String,
        data[3] != '' ? data[3] as String : null,
        data[4] != '' ? data[4] as String : null,
        data[5] as int,
      );
}

// [H4100, weekday, weekday_H4100_H410002_0, H410002, , 0]
