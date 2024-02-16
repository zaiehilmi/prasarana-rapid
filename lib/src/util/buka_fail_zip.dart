import 'package:archive/archive_io.dart';
import 'package:prasarana_rapid/prasarana_rapid.dart';

List<ArchiveFile> bukaFailZip(Kategori kategori) {
  final kedudukanFail = (Tetapan.filePath == null)
      ? 'out/${kategori.nama}.zip'
      : '${Tetapan.filePath}/out/${kategori.nama}.zip';

  final inputStream = InputFileStream(kedudukanFail);
  final arkib = ZipDecoder().decodeBuffer(inputStream);

  return arkib.files;
}
