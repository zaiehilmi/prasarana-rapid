import 'package:collection/collection.dart';
import 'package:prasarana_rapid/src/model/semua_data.dart';
import 'package:prasarana_rapid/src/model/waktu_berhenti.dart';
// semua laluan bas

// koordinat laluan bas

// infoLaluanBas

Future<List<WaktuBerhenti>> masaKetibaanBas(String kodLaluan) async {
  final dataLaluan = dataBas.semuaLaluan;
  final dataPerjalanan = dataBas.semuaPerjalanan;
  final dataWaktuBerhenti = dataBas.semuaWaktuBerhenti;
  List<WaktuBerhenti> wb = [];

  // Cari laluan berdasarkan kod laluan
  final turasKodLaluan = dataLaluan.singleWhereIndexedOrNull(
    (index, l) => l.namaPenuh == kodLaluan,
  );

  if (turasKodLaluan != null) {
    // Penapisan perjalanan mengikut laluan
    final turasPerjalanan = dataPerjalanan.where(
      (p) => p.idLaluan == turasKodLaluan.idLaluan,
    );

    // Guna loop 'for' untuk iterasi dan mendapatkan masa berlepas secara async
    for (var perjalanan in turasPerjalanan) {
      var masaBerlepas = dataWaktuBerhenti.firstWhere(
        (wbItem) => wbItem.idPerjalanan == perjalanan.idPerjalanan,
      );

      wb.add(masaBerlepas);
    }

    // Hapuskan pendua dan susun data berdasarkan masa ketibaan
    wb = wb.toSet().toList();
    wb.sort((a, b) {
      if (a.ketibaan == null && b.ketibaan == null) return 0;
      if (a.ketibaan == null) return 1;
      if (b.ketibaan == null) return -1;
      return a.ketibaan!.compareTo(b.ketibaan!);
    });

    // Cetak hasil untuk debugging
    print(wb.length);
    wb.asMap().forEach((i, waktuBerhenti) {
      print('$i --> ${waktuBerhenti.ketibaan}');
    });
  }

  return wb;
}
