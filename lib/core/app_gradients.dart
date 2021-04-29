import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final _linear = LinearGradient(colors: [
    Color(0xFF8257E5),
    Color(0xFF57B6E5),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static Gradient get linear => _linear;
}
