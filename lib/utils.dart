import 'package:intl/intl.dart';

class Utils {
  Utils._();

  static String getDayOfTheWeek(DateTime dateTime) {
    return DateFormat.EEEE().format(dateTime);
  }
}