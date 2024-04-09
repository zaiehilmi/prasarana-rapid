import 'package:archive/src/archive_file.dart';
import 'package:csv/csv.dart';
import 'package:prasarana_rapid/prasarana_rapid.dart';
import 'package:prasarana_rapid/src/constant/txt_list.dart';
import 'package:prasarana_rapid/src/model/agensi.dart';
import 'package:prasarana_rapid/src/model/bentuk.dart';
import 'package:prasarana_rapid/src/model/frekuensi.dart';
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
    final perkhidmatan = JenisPerkhidmatan.basKL;

    test('dapatkan data dari Api', () async => await fetchPrasaranaApi(perkhidmatan));

    test('buka fail zip dan dapatkan nilai objek', () {
      final arkib = bukaFailZip(perkhidmatan);
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
        final arkib = bukaFailZip(perkhidmatan);

        dapatkanKandungan(arkib, FailTxt.agensi);
      });

      test('baca agency.txt', () {
        final agensi = bacaCsv<Agensi>(dariTxt: FailTxt.agensi, endpoint: perkhidmatan);
        print(agensi[0].toString());
      });
    });

    group('KALENDAR', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(perkhidmatan);

        dapatkanKandungan(arkib, FailTxt.kalendar);
      });

      test('baca calendar.txt', () {
        final kalendar = bacaCsv<Kalendar>(dariTxt: FailTxt.kalendar, endpoint: perkhidmatan);
        print(kalendar[0].toString());
      });
    });

    group('FREKUENSI', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(perkhidmatan);

        dapatkanKandungan(arkib, FailTxt.frekuensi);
      });

      test('baca frequencies.txt', () {
        final temp = bacaCsv<Frekuensi>(dariTxt: FailTxt.frekuensi, endpoint: perkhidmatan);
        print(temp[0].toString());
      });
    });

    group('LALUAN', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(perkhidmatan);

        dapatkanKandungan(arkib, FailTxt.laluan);
      });

      test('baca routes.txt', () {
        final laluan = bacaCsv<Laluan>(dariTxt: FailTxt.laluan, endpoint: perkhidmatan);
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
        final arkib = bukaFailZip(perkhidmatan);

        dapatkanKandungan(arkib, FailTxt.bentuk);
      });

      test('baca shapes.txt', () {
        final bentuk = bacaCsv<Bentuk>(dariTxt: FailTxt.bentuk, endpoint: perkhidmatan);
        print(bentuk[0].toString());
      });
    });

    group('HENTIAN', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(perkhidmatan);

        dapatkanKandungan(arkib, FailTxt.hentian);
      });

      test('baca stops.txt', () {
        final temp = bacaCsv<Hentian>(dariTxt: FailTxt.hentian, endpoint: perkhidmatan);
        print(temp[400].toString());

        for (var e in temp) {
          if (e.namaHentian?.toLowerCase() == 'KL178') {
            print(e.toString());
          }
        }
      });
    });

    group('WAKTU BERHENTI', () {
      test('buka fail zip dan baca kandungan', () {
        final arkib = bukaFailZip(perkhidmatan);

        dapatkanKandungan(arkib, FailTxt.waktuBerhenti);
      });

      test('baca stop_times.txt', () {
        final temp = bacaCsv<WaktuBerhenti>(dariTxt: FailTxt.waktuBerhenti, endpoint: perkhidmatan);
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
        final arkib = bukaFailZip(perkhidmatan);

        dapatkanKandungan(arkib, FailTxt.perjalanan);
      });

      test('baca trips.txt', () {
        // [route_id, service_id, trip_id, shape_id, trip_headsign, direction_id]
        final temp = bacaCsv<Perjalanan>(dariTxt: FailTxt.perjalanan, endpoint: perkhidmatan);
        print(temp[0].toString());

        for (var element in temp) {
          // if (element.idLaluan == '30000129') {
          //   print(element.toString());
          // }
          if ('weekend_U8510_U851002_0' == element.idPerjalanan) {
            print(element.idLaluan);
          }
        }
      });
    });
  });
  group('Mencari hentian bas', () {
    test('bas ni lalu mana?', () {
      final noBas = '250';
      final laluan = bacaCsv<Laluan>(dariTxt: FailTxt.laluan, endpoint: JenisPerkhidmatan.basKL);

      for (var l in laluan) {
        if (noBas == l.namaPendek) print(l.toString());
      }
    });

    test('senarai laluan yang hentian ni ada', () {
      final hentianBas = HentianBas();
      final info = hentianBas.infoHentianBas("1000577");
      print('${info.namaHentian} ${info.senaraiNoBasPadaHentian}');
    });
  });
}

void dapatkanKandungan(List<ArchiveFile> arkib, FailTxt dariTxt, {int indeks = 1}) {
  final input = arkib.firstWhere((file) => file.name.endsWith(dariTxt.nama.txt));
  final kandungan = String.fromCharCodes(input.content);

  final rowsAsListOfValues = const CsvToListConverter().convert(kandungan, eol: '\n');
  print(rowsAsListOfValues.length);
  print(rowsAsListOfValues[0]);
  print(rowsAsListOfValues[indeks]);
}
