import 'package:csv/csv.dart';
import 'package:prasarana_rapid/src/constant/endpoint_list.dart';
import 'package:prasarana_rapid/src/constant/txt_list.dart';
import 'package:prasarana_rapid/src/model/frekuensi.dart';
import 'package:prasarana_rapid/src/model/hentian.dart';
import 'package:prasarana_rapid/src/model/kalendar.dart';
import 'package:prasarana_rapid/src/model/laluan.dart';
import 'package:prasarana_rapid/src/model/perjalanan.dart';
import 'package:prasarana_rapid/src/model/waktu_berhenti.dart';
import 'package:prasarana_rapid/src/util/string_util.dart';

import '../model/agensi.dart';
import '../model/bentuk.dart';
import 'buka_fail_zip.dart';

List<T> bacaCsv<T>({required FailTxt dariTxt, required Kategori endpoint}) {
  final arkib = bukaFailZip(endpoint);
  List<T> senaraiObjek = [];

  final input =
      arkib.firstWhere((file) => file.name.endsWith(dariTxt.nama.txt));
  final kandungan = String.fromCharCodes(input.content);

  final baris =
      const CsvToListConverter().convert(kandungan, eol: '\n').sublist(1);

  for (final b in baris) {
    final objek = switch (dariTxt) {
      FailTxt.agensi => Agensi.dariCsv(b),
      FailTxt.kalendar => Kalendar.dariCsv(b),
      FailTxt.frekuensi => Frekuensi.dariCsv(b),
      FailTxt.laluan => Laluan.dariCsv(b),
      FailTxt.bentuk => Bentuk.dariCsv(b),
      FailTxt.waktuBerhenti => WaktuBerhenti.dariCsv(b),
      FailTxt.hentian => Hentian.dariCsv(b),
      FailTxt.perjalanan => Perjalanan.dariCsv(b),
    };
    senaraiObjek.add(objek as T);
  }

  return senaraiObjek;
}
