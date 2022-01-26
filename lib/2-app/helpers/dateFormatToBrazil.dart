import 'package:intl/intl.dart';

class DateFormatToBrazil {
  static final DateFormatToBrazil _dateFormatToBraziln =
  DateFormatToBrazil._internal();
  factory DateFormatToBrazil() {
    return _dateFormatToBraziln;
  }
  DateFormatToBrazil._internal();

  String formatDate(DateTime? date) {
    if(date != null)
      return DateFormat('dd-MM-yyyy').format(date).replaceAll('-', '/');
    return "";
  }
}