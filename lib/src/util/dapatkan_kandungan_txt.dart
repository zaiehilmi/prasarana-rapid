import 'package:archive/src/archive_file.dart';
import 'package:csv/csv.dart';
import 'package:prasarana_rapid/src/util/util_string.dart';

import '../constant/txt_list.dart';

List dapatkanKandungan(
  List<ArchiveFile> arkib,
  FailTxt dariTxt,
) {
  final input =
      arkib.firstWhere((file) => file.name.endsWith(dariTxt.nama.txt));
  final kandungan = String.fromCharCodes(input.content);

  final rowsAsListOfValues =
      const CsvToListConverter().convert(kandungan, eol: '\n');

  return rowsAsListOfValues;
}
