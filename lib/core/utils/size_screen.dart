import 'package:flutter/material.dart';

abstract class SizeScreen {
  static Size size({required BuildContext context}) {
    return MediaQuery.of(context).size;
  }
}
