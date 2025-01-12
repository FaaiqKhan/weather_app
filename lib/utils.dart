import 'package:intl/intl.dart';
import 'package:weather_app/enums/enums.dart';

class Utils {
  Utils._();

  static String getDayOfTheWeek(DateTime dateTime) {
    return DateFormat.EEEE().format(dateTime);
  }

  static String getAbbrOfDayOfTheWeek(DateTime dateTime) {
    return DateFormat.E().format(dateTime);
  }

  static String getTemperatureUnitInText(TemperatureUnit unit) {
    return unit == TemperatureUnit.celsius ? '°C' : '°F';
  }
}