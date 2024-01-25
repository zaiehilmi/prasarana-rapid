import '../constant/ketersediaan.dart';

extension SediaUtil on int {
  Ketersediaan get tentukan {
    return switch (this) {
      1 => Ketersediaan.tersedia,
      0 || _ => Ketersediaan.tidakTersedia,
    };
  }
}
