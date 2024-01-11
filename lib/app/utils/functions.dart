import 'package:intl/intl.dart';

class Fun {
  Fun._();

  static NumberFormat get formatRupiah {
    return NumberFormat.simpleCurrency(
      decimalDigits: 0,
      locale: 'id',
      name: '',
    );
  }
}
