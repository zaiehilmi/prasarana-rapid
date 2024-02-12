import '../constant/endpoint_list.dart';

//telah disemak
class Bentuk {
  String id;
  double lat;
  double lon;
  int susunan;

  Bentuk(
    this.id,
    this.lat,
    this.lon,
    this.susunan,
  );

  factory Bentuk.dariCsv(List<dynamic> data, Kategori kategori) {
    var intLat = 0.0;
    var intLon = 0.0;
    // cariParamNull(data);
    if (data[1].runtimeType == int || data[2].runtimeType == int) {
      intLat = data[1] + 0.0;
      intLon = data[2] + 0.0;
    }
    return Bentuk(
      data[0].toString(),
      data[1].runtimeType == int ? intLat : data[1],
      data[2].runtimeType == int ? intLon : data[2],
      data[3],
    );
  }
}
