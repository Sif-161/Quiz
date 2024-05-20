import 'package:flutter/material.dart';

class GradienteCores {
  static const List<Color> gradiente = [
    Color.fromRGBO(3,1,18,1),
    Color.fromRGBO(146,0,118,1),
    Color.fromRGBO(54,0,41,1),

  ];

  static RadialGradient createGradient() {
    return const RadialGradient(
      colors: gradiente,
      center: Alignment.center,
      radius: 4.8,
      
    );
  }  
}



