import 'package:flutter/material.dart';

class Style {

  static final baseTextStyle = const TextStyle(
    fontFamily: 'Godo',
    fontWeight: FontWeight.w600
  );

  static final smallTextStyle = baseTextStyle.copyWith(
    fontSize: 10
  );

  static final boldTextStyle = baseTextStyle.copyWith(
    fontSize: 20,
    color: Colors.blue,
  );
}