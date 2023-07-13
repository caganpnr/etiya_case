import 'package:flutter/material.dart';

extension ColorExtension on String {
  /// returns the given color codes such as "c7f458ff" as "0XFFc7f458"
  Color toColor() {
    final hexString = this;
    final buffer = StringBuffer()
      ..write('0XFF')
      ..write(hexString.substring(0, 6));
    return Color(int.parse(buffer.toString()));
  }
}
