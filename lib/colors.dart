import 'package:flutter/material.dart';

class GradienteCores {
  static const List<Color> gradiente = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
  ];

  static LinearGradient createLinearGradient() {
    return const LinearGradient(
      colors: gradiente,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }  
}



