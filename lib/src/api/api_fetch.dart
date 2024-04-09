import 'dart:io';

import 'package:dio/dio.dart';
import 'package:prasarana_rapid/src/service/tetapan.dart';
import 'package:prasarana_rapid/src/util/kira_hash.dart';

import '../constant/endpoint_list.dart';

final _options = BaseOptions(
  method: 'get',
  baseUrl: 'https://api.data.gov.my/gtfs-static/prasarana',
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 5),
);

final dio = Dio(_options);

Future<void> fetchPrasaranaApi(
  JenisPerkhidmatan perkhidmatan, {
  bool semakPerubahan = true,
}) async {
  final kedudukanFail =
      (Tetapan.filePath == null) ? 'out/${perkhidmatan.nama}.zip' : '${Tetapan.filePath}/out/${perkhidmatan.nama}.zip';
  final laluanApi = '?category=${perkhidmatan.nama}';

  try {
    if (Tetapan.token != null) {
      _options.headers = {'Authorization': 'Bearer ${Tetapan.token}'};
    }

    final response = await dio.get(laluanApi);
    final etag = response.headers.value('etag').toString();

    final failBelumWujud = !File(kedudukanFail).existsSync();

    if (failBelumWujud) {
      print('Memuat turun data...');
      await dio.download(laluanApi, kedudukanFail);
    } else {
      if (semakPerubahan && bandingHash(kedudukanFail, etag)) {
        print('Terdapat perubahan pada pelayan. Memuat turun data baru...');
        await dio.download(laluanApi, kedudukanFail);
      }
    }

    print('Selesai memuat API');
  } on DioException {
    print('Masalah di Dio');
  } catch (e) {
    print(e);
  } finally {
    dio.close();
  }
}
