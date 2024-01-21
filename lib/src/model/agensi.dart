/// diambil dari agency.dart
class Agensi {
  String? id;
  String? namaAgensi;
  String? url;
  String? zonWaktu;
  String? noTel;
  String? bahasa;

  Agensi(
    this.id,
    this.namaAgensi,
    this.url,
    this.zonWaktu,
    this.noTel,
    this.bahasa,
  );

  factory Agensi.dariCsv(List<dynamic> data) {
    return Agensi(
      data[0] as String,
      data[1] as String,
      data[2] as String,
      data[3] as String,
      data[4].toString(),
      data[5] as String,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return '''
    ''';
  }
}
