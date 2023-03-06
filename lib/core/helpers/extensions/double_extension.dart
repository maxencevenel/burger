
import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String format() {
    var customFormat = NumberFormat("#,##0.00", "fr_fr");
    return customFormat.format(this);
  }
}