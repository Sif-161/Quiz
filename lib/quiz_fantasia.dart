import 'package:flutter/material.dart';
import 'dart:ui';
import 'tela_resultado.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class QuizFantasia extends StatefulWidget {
  @override
  _QuizFantasiaState createState() => _QuizFantasiaState();
}

class _QuizFantasiaState extends State<QuizFantasia> {
  int questionIndex = 0;
  int pontuacao = 0;
  int perguntaAtual = 1;
  final int duracao = 10;
  final CountDownController controle = CountDownController();

  List<Question> questions = [
    Question(
      'blabla',
      ['dgshd', 'gyag', 'odhisg', 'bajh'],
      'dgshd',
    ),
    Question(
      'b',
      ['dgshd', 'gyag', 'odhisg', 'bajh'],
      'dgshd',
    ),
  ];

  void checkAnswer(String userAnswer) {
    String correctAnswer = questions[questionIndex].correctAnswer;
    int tempoPassado = duracao - int.parse(controle.getTime() ?? '0');

    setState(() {
      if (userAnswer == correctAnswer) {
        int pontuacaoAdd = 5 + tempoPassado;
        pontuacao += pontuacaoAdd;
      }
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        perguntaAtual++;
        controle.restart();
      } else {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Spacer(),
            CircularCountDownTimer(
              duration: duracao,
              initialDuration: 0,
              controller: controle,
              width: 45,
              height: 45,
              ringColor: Colors.black,
              fillColor: Colors.blue.shade300,
              backgroundColor: Colors.transparent,
              strokeWidth: 10.0,
              strokeCap: StrokeCap.round,
              textStyle: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textFormat: CountdownTextFormat.S,
              isReverse: true,
              isReverseAnimation: true,
              isTimerTextShown: true,
              autoStart: true,
              onStart: () {},
              onComplete: () {
                if (questionIndex < questions.length - 1) {
                  setState(() {
                    questionIndex++;
                    perguntaAtual++;
                  });
                  controle.restart();
                } else {
                 
                }
              },
              onChange:(String timeStamp) {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/castle.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.89,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 7,
                    child: Center(
                      child: Text(
                        questions[questionIndex].questionText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 330,
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 3.8,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 10.3,
                          children: questions[questionIndex].options.map((option){
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: ElevatedButton(onPressed: () => checkAnswer(option), 
                              child: Text(option)),
                            );
                          }).toList()
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question(this.questionText, this.options, this.correctAnswer);
}
