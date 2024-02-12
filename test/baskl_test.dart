import 'package:archive/src/archive_file.dart';
import 'package:csv/csv.dart';
import 'package:prasarana_rapid/src/api/api_fetch.dart';
import 'package:prasarana_rapid/src/constant/endpoint_list.dart';
import 'package:prasarana_rapid/src/constant/txt_list.dart';
import 'package:prasarana_rapid/src/model/agensi.dart';
import 'package:prasarana_rapid/src/model/bentuk.dart';
import 'package:prasarana_rapid/src/model/hentian.dart';
import 'package:prasarana_rapid/src/model/kalendar.dart';
import 'package:prasarana_rapid/src/model/laluan.dart';
import 'package:prasarana_rapid/src/model/perjalanan.dart';
import 'package:prasarana_rapid/src/model/waktu_berhenti.dart';
import 'package:prasarana_rapid/src/util/baca_csv_dari_txt.dart';
import 'package:prasarana_rapid/src/util/buka_fail_zip.dart';
import 'package:prasarana_rapid/src/util/util_string.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('objek dalam bas rapidKL', () {
    final kategori = Kategori.basKL;

    test('dapatkan data dari Api',
        () async => await fetchPrasaranaApi(kategori));

    test('buka fail zip dan dapatkan nilai objek', () {
      final arkib = bukaFailZip(kategori);
      final kandunganZipSepatutnya = [
        FailTxt.agensi.nama.txt,
        FailTxt.kalendar.nama.txt,
        FailTxt.frekuensi.nama.txt,
        FailTxt.laluan.nama.txt,
        FailTxt.bentuk.nama.txt,
        FailTxt.waktuBerhenti.nama.txt,
        FailTxt.hentian.nama.txt,
        FailTxt.perjalanan.nama.txt,
      ];

      int i = 0;
      for (final f in arkib) {
        if (f.isFile) {
          expect(f.name, kandunganZipSepatutnya[i++]);

          print('$i ada fail ${f.name}\t\t${f.size}');
        }
      }
      expect(arkib.length, 9);
    });

    group('AGENSI', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(kategori);

        dapatkanKandungan(arkib, FailTxt.agensi);
      });

      test('baca agency.txt', () {
        final agensi =
            bacaCsv<Agensi>(dariTxt: FailTxt.agensi, endpoint: kategori);
        print(agensi[0].toString());
      });
    });

    group('KALENDAR', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(kategori);

        dapatkanKandungan(arkib, FailTxt.kalendar);
      });

      test('baca calendar.txt', () {
        final kalendar =
            bacaCsv<Kalendar>(dariTxt: FailTxt.kalendar, endpoint: kategori);
        print(kalendar[0].toString());
      });
    });

    group('LALUAN', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(kategori);

        dapatkanKandungan(arkib, FailTxt.laluan);
      });

      test('baca routes.txt', () {
        final laluan =
            bacaCsv<Laluan>(dariTxt: FailTxt.laluan, endpoint: kategori);
        print(laluan[0].toString());

        // laluan.forEach((element) {
        //   if (element.namaPenuh == 'T464') {
        //     print(element.toString());
        //   }
        // });
      });
    });

    group('BENTUK', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(kategori);

        dapatkanKandungan(arkib, FailTxt.bentuk);
      });

      test('baca shapes.txt', () {
        final bentuk =
            bacaCsv<Bentuk>(dariTxt: FailTxt.bentuk, endpoint: kategori);
        print(bentuk[0].toString());
      });
    });

    group('HENTIAN', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(kategori);

        dapatkanKandungan(arkib, FailTxt.hentian);
      });

      test('baca stops.txt', () {
        final temp =
            bacaCsv<Hentian>(dariTxt: FailTxt.hentian, endpoint: kategori);
        print(temp[0].toString());
      });
    });

    group('WAKTU BERHENTI', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(kategori);

        dapatkanKandungan(arkib, FailTxt.waktuBerhenti);
      });

      test('baca stop_times.txt', () {
        final temp = bacaCsv<WaktuBerhenti>(
            dariTxt: FailTxt.waktuBerhenti, endpoint: kategori);
        print(temp[0].toString());
        // for (var e in temp) {
        //   if (e.idPerjalanan == '231027011063S8') {
        //     print(e.toString());
        //   }
        // }
      });
    });

    group('PERJALANAN', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(kategori);

        dapatkanKandungan(arkib, FailTxt.perjalanan);
      });

      test('baca trips.txt', () {
        final temp = bacaCsv<Perjalanan>(
            dariTxt: FailTxt.perjalanan, endpoint: kategori);
        print(temp[0].toString());

        // for (var element in temp) {
        //   if (element.idLaluan == '30000129') {
        //     print(element.toString());
        //   }
        // }
      });
    });
  });
}

void dapatkanKandungan(List<ArchiveFile> arkib, FailTxt dariTxt,
    {int indeks = 1}) {
  final input =
      arkib.firstWhere((file) => file.name.endsWith(dariTxt.nama.txt));
  final kandungan = String.fromCharCodes(input.content);

  final rowsAsListOfValues =
      const CsvToListConverter().convert(kandungan, eol: '\n');
  print(rowsAsListOfValues.length);
  print(rowsAsListOfValues[0]);
  print(rowsAsListOfValues[indeks]);
}
