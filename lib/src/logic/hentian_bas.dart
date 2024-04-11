import 'package:prasarana_rapid/prasarana_rapid.dart';
import 'package:prasarana_rapid/src/constant/kod_respon.dart';
import 'package:prasarana_rapid/src/model/semua_data.dart';
import 'package:collection/collection.dart';

void main() async {
  final hentianBas = HentianBas();

  // hentianBas.infoHentianBas('12001515');
  hentianBas.infoHentianBas('KL1690');
}

class HentianBas {
  final SemuaData sd = SemuaData.instance;

  HentianBas() {
    sd.semuaHentian.sort((a, b) => a.idHentian.compareTo(b.idHentian));
  }

  ({
    String? namaHentian,
    List<String>? senaraiNoBasPadaHentian,
  }) infoHentianBas(String idHentian) {
    String? namaHentian;
    List<String>? senaraiBas;

    // dapatkan maklumat hentian bas
    var turasHentianBas = sd.semuaHentian.singleWhereOrNull((h) => h.idHentian == idHentian);

    if (turasHentianBas != null) {
      namaHentian = turasHentianBas.namaHentian;

      // cari senarai laluan bas yang berhenti pada hentian bas tu
      // Laluan.namaPendek <- Perjalanan.idLaluan <- WaktuBerhenti.idPerjalanan
      final turasWaktuBerhenti =
          sd.semuaWaktuBerhenti.firstWhereOrNull((wb) => turasHentianBas.idHentian == wb.idHentian);

      if (turasWaktuBerhenti != null) {
        final turasPerjalanan =
            sd.semuaPerjalanan.singleWhereOrNull((p) => turasWaktuBerhenti.idPerjalanan == p.idPerjalanan);

        final turasLaluan = sd.semuaLaluan.where((l) => turasPerjalanan?.idLaluan == l.idLaluan);

        for (var laluan in turasLaluan) {
          print(laluan.idLaluan);
          // print(laluan.namaPendek ?? laluan.namaPenuh);
          // senaraiBas!.add(laluan.namaPendek ?? laluan.namaPenuh);
        }
      }
    } else {
      namaHentian = KodRespon.takJumpa.huraian;
    }

    print(namaHentian);
    return (namaHentian: namaHentian, senaraiNoBasPadaHentian: senaraiBas);
  }

  void infoLaluan() {}

  void lakarLaluanPadaPeta() {}
}
