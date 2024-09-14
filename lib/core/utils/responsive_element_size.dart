import 'package:flutter/material.dart';

double responsiveElementSize(Size size) {
  if (size.width > 1100) {
    return size.width * 0.5;
  } else if (size.width > 900) {
    return size.width * 0.55;
  } else if (size.width > 600) {
    return size.width * 0.6;
  } else {
    return size.width;
  }
}
