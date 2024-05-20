import 'package:flutter/material.dart';
import 'cores.dart';

class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int totalDePerguntas;

  const TelaResultado(this.pontuacao, this.totalDePerguntas);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "PONTUAÇÃO",
          style: TextStyle(fontWeight: FontWeight.bold,
           fontSize: 40
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: GradienteCores.createGradient(), 
        ),
      )
      
    );

  }
}