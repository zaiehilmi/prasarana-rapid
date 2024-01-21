class Hentian {
  String id;
  String namaHentian;
  String? huraianHentian;
  double lat;
  double lon;

  Hentian(this.id, this.namaHentian, this.huraianHentian, this.lat, this.lon);

  factory Hentian.dariCsv(List<dynamic> data) => Hentian(
        data[0].toString(),
        data[1] as String,
        data[2] != '' ? data[2].toString() : null,
        data[3] as double,
        data[4] as double,
      );
}

// [1000002, SL254 PERINDUSTRIAN BT CAVES, JLN SBC 5, 3.2336025134884, 101.68713320744]
// [1000068, PROTON (OPP),  JLN MERU, 3.1134794290864, 101.44136018059]
