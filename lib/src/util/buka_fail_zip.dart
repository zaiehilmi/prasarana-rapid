import 'package:archive/archive_io.dart';
import 'package:prasarana_rapid/prasarana_rapid.dart';

List<ArchiveFile> bukaFailZip(JenisPerkhidmatan perkhidmatan) {
  final kedudukanFail =
      (Tetapan.filePath == null) ? 'out/${perkhidmatan.nama}.zip' : '${Tetapan.filePath}/out/${perkhidmatan.nama}.zip';

  final inputStream = InputFileStream(kedudukanFail);
  final arkib = ZipDecoder().decodeBuffer(inputStream);

  return arkib.files;
}
