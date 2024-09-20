import 'package:intl/intl.dart';

class MyDateUtil {
  static String convertDateTime({required String historyAsText}) {
    final DateTime dateTime = DateTime.parse(historyAsText);
    return DateFormat('yyyy/MM/dd').format(dateTime);
  }

  static DateTime currentDateTimeFromDevice() {
    return DateTime.now();
  }

  static DateTime covertStringToDate({required String date}) {
    return DateTime.parse(date);
  }
}
