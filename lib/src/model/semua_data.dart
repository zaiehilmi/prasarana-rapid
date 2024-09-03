// Singleton dengan muat-bila-perlu
import 'package:prasarana_rapid/src/model/perjalanan.dart';
import 'package:prasarana_rapid/src/model/waktu_berhenti.dart';

import '../../prasarana_rapid.dart';
import '../constant/txt_list.dart';
import '../util/baca_csv_dari_txt.dart';
import 'hentian.dart';
import 'laluan.dart';

/// Gabungan semua maklumat dari bas KL dan bas perantara MRT
class SemuaData {
  static SemuaData? _semuaData;

  SemuaData._();

  static SemuaData get instance => _semuaData ??= SemuaData._();

  List<Hentian> get semuaHentian => _semuaDataDaripadaJadual(failTxt: FailTxt.hentian);

  List<WaktuBerhenti> get semuaWaktuBerhenti => _semuaDataDaripadaJadual(failTxt: FailTxt.waktuBerhenti);

  List<Laluan> get semuaLaluan => _semuaDataDaripadaJadual(failTxt: FailTxt.laluan);

  List<Perjalanan> get semuaPerjalanan => _semuaDataDaripadaJadual(failTxt: FailTxt.perjalanan);

  List<J> _semuaDataDaripadaJadual<J>({required FailTxt failTxt}) {
    // final basKL = bacaCsv<J>(dariTxt: failTxt, endpoint: JenisPerkhidmatan.basKL);
    final basMRT = bacaCsv<J>(dariTxt: failTxt, endpoint: JenisPerkhidmatan.basPerantaraMrt);

    // basMRT.addAll(basKL);

    // buang data sama
    basMRT.toSet().toList();

    // susun mengikut aturan semakin menaik
    // basMRT.toSet().toList().sort((a, b) => lajurA?.compareTo(lajurB));
    // basMRT.toSet().toList().sort((a, b) => a.idHentian.compareTo(b.idHentian));
    return basMRT;
  }
}

final SemuaData dataBas = SemuaData.instance;
