import 'package:flutter/material.dart';
import 'tela_config.dart';
import 'colors.dart';

class InicialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(44, 145, 233, 1),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Informação"),
                      content: const Text("Desenvolvido por: Odilon Struduth"),
                      actions: [
                        TextButton(onPressed:() {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Fechar'),)
                      ],
                    );
                  }
                );
              },
            )
          ],
        )
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: GradienteCores.createLinearGradient(),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png',
               fit: BoxFit.cover
              ),
              ElevatedButton(onPressed:(){
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => TelaQuiz()));
                }, 
                child: const Row(
                 mainAxisSize: MainAxisSize.min,
                 children:[
                   Icon(Icons.play_arrow_rounded, color: Colors.black),
                   Text('Iniciar o Quiz', style: TextStyle(color: Colors.black),),
                  ]
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
