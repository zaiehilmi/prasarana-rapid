import 'package:archive/archive_io.dart';

import '../constant/endpoint_list.dart';

List<ArchiveFile> bukaFailZip(Kategori kategori) {
  final inputStream = InputFileStream('out/${kategori.nama}.zip');
  final arkib = ZipDecoder().decodeBuffer(inputStream);

  return arkib.files;
}
