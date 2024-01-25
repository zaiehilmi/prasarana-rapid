extension StringUtil on String {
  String get txt => '$this.txt';

  DateTime get keDateTime {
    final harini = DateTime.now();
    var tarikh = this;
    if (length != 8) tarikh = '0$this';

    return DateTime.parse('${harini.year}-01-01 $tarikh');
  }

  String? get jadiNullJikaTiadaData => this != '' ? this : null;

  String get hurufPertamaBesar => this[0].toUpperCase() + substring(1);
}
