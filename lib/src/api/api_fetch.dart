import 'package:dio/dio.dart';
import 'package:prasarana_rapid/src/service/tetapan.dart';

import '../constant/endpoint_list.dart';

final _options = BaseOptions(
  method: 'get',
  baseUrl: 'https://api.data.gov.my/gtfs-static/prasarana',
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 5),
);

final dio = Dio(_options);

Future<void> fetchPrasaranaApi(Kategori kategori) async {
  try {
    if (Tetapan.token != null) {
      _options.headers = {'Authorization': 'Bearer ${Tetapan.token}'};
    }

    await dio.download(
        '?category=${kategori.nama}', 'out/${kategori.nama}.zip');
  } on DioException {
    print('Masalah di Dio');
  } catch (e) {
    print(e);
  } finally {
    dio.close();
  }
}
