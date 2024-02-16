import 'package:prasarana_rapid/src/constant/endpoint_list.dart';

/// diambil dari agency.dart
class Agensi {
  String? idAgensi;
  String namaAgensi;
  String url;
  String zonWaktu;
  String? noTel;
  String? bahasa;

  Agensi(
    this.idAgensi,
    this.namaAgensi,
    this.url,
    this.zonWaktu,
    this.noTel,
    this.bahasa,
  );

  factory Agensi.dariCsv(List<dynamic> data, Kategori kategori) =>
      switch (kategori) {
        Kategori.basPerantaraMrt => Agensi(
            null,
            data[0] as String,
            data[1] as String,
            data[2] as String,
            data[3] as String,
            data[4].toString(),
          ),
        Kategori.basKL || Kategori.relKL => Agensi(
            data[0] as String,
            data[1] as String,
            data[2] as String,
            data[3] as String,
            data[4].toString(),
            data[5] as String,
          )
      };

  @override
  String toString() =>
      'Agensi{id: $idAgensi, namaAgensi: $namaAgensi, url: $url, zonWaktu: $zonWaktu, noTel: $noTel, bahasa: $bahasa}';
}
