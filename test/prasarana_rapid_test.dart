import 'package:csv/csv.dart';
import 'package:prasarana_rapid/src/api/api_fetch.dart';
import 'package:prasarana_rapid/src/constant/endpoint_list.dart';
import 'package:prasarana_rapid/src/constant/txt_list.dart';
import 'package:prasarana_rapid/src/model/kalendar.dart';
import 'package:prasarana_rapid/src/util/baca_csv_dari_txt.dart';
import 'package:prasarana_rapid/src/util/buka_fail_zip.dart';
import 'package:prasarana_rapid/src/util/util_string.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    group('test api', () {
      test('pastikan api boleh dijalankan',
          () async => await fetchPrasaranaApi(Kategori.relKL));

      test('muat turun jika fail zip tiada di lokasi setempat', () async {});

      test('muat turun jika terdapat perubahan di pelayan', () => null);
    });

    test('buka fail zip dan baca baris pertama', () {
      final arkib = bukaFailZip(Kategori.basKL);

      final input = arkib
          .firstWhere((file) => file.name.endsWith(FailTxt.agensi.nama.txt));
      final kandungan = String.fromCharCodes(input.content);

      final rowsAsListOfValues =
          const CsvToListConverter().convert(kandungan, eol: '\n');
      print(rowsAsListOfValues.length);
      print(rowsAsListOfValues[0]);
      print(rowsAsListOfValues[1]);
      // print(rowsAsListOfValues[2]);
      // print(rowsAsListOfValues[3]);
    });

    test('baca fail txt', () {
      final agensi = bacaCsv<Kalendar>(
          dariTxt: FailTxt.kalendar, endpoint: Kategori.basKL);
      // print(agensi.length);
      print('==${agensi[1].id}==');
    });
  });
}
// [agency_id, agency_name, agency_url, agency_timezone, agency_phone, agency_lang]
// [rapidkl, Rapid KL, http://www.myrapid.com.my, Asia/Kuala_Lumpur, 60378852585, en]
