import 'package:fluttertoast/fluttertoast.dart';

abstract class ShowToast {
  static Future<bool?> show({required String msg}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
