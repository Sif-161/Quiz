import 'package:flutter/material.dart';
import 'cores.dart';
import 'tela_inicial.dart';

class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int totalDePerguntas;
  final int perguntaCerta;

  const TelaResultado(this.pontuacao, this.totalDePerguntas, this.perguntaCerta);

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
           fontSize: 40,
           color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: GradienteCores.createGradient(), 
        ),
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Você completou o Quiz', style: TextStyle(fontSize: 24, color: Colors.white)),
              const SizedBox(height: 20),
              Text('Pontos: $pontuacao', style: const TextStyle(fontSize: 24, color: Colors.white)),
              const SizedBox(height: 20),
              Text('Você acertou $perguntaCerta de $totalDePerguntas', style: const TextStyle(fontSize: 24, color: Colors.white)),
              const SizedBox(height: 20),
              ElevatedButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaInicial()),
                );
              }, 
                child: const Text('Voltar', style: TextStyle(fontSize: 24)),
              )

            ]
          ),

        )
      )
    );
  }
}