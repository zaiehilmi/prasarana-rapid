import 'package:archive/archive_io.dart';

import '../constant/endpoint_list.dart';

List<ArchiveFile> bukaFailZip(Kategori kategori) {
  final inputStream = InputFileStream('out/${kategori.nama}.zip');
  final arkib = ZipDecoder().decodeBuffer(inputStream);

  for (final f in arkib.files) {
    if (f.isFile) {
      print('ada fail ${f.name}\t\t${f.size}');
    }
  }

  return arkib.files;
}
