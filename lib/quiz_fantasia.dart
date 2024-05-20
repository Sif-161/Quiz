import 'package:flutter/material.dart';
import 'dart:async';
import 'tela_resultado.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart'; 

class QuizFantasia extends StatefulWidget {
  @override
  _QuizFantasiaState createState() => _QuizFantasiaState();
}

class _QuizFantasiaState extends State<QuizFantasia> {
  int questionIndex = 0;
  int score = 0;
  int perguntaAtual = 1;
  int totalTime = 60;
  int remainingTime = 0;
  Timer? timer;

  List <Question> questions = [
    Question('blabla',
      ['dgshd', 'gyag', 'odhisg', 'bajh'],
      'dgshd'
    ),
  ];

  @override
  void initState() {
    super.initState();
    remainingTime = totalTime;
  }

void startTimer() {
  timer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (remainingTime > 0) {
      setState(() {
        remainingTime--;
      });
    } else {
      nextQuestion();
    }
  });
}

void nextQuestion(){
  setState((){
    questionIndex++;
    perguntaAtual++;
    remainingTime = totalTime;
  });
}

@override
void dispose(){
  timer?.cancel();
  super.dispose();
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
            Text(
              '  $perguntaAtual / ${questions.length}',
              style: const TextStyle(fontSize: 30,
                color: Colors.black
              ),
            ),
            const Spacer(),
            CircularCountDownTimer(
              duration: Duration(seconds: totalTime),
              controller: CountDownController(),
              width: 200,
              height: 200,
              ringColor: Colors.grey,
              fillColor: Colors.blue,
              backgroundColor: Colors.transparent,
              ringGradient: null,
              fillGradient: null,
              backgroundGradient: null,
              strokeCap: StrokeCap.round,
              textStyle: const TextStyle(
                fontSize: 24.0,
                color:Colors.black,
              ),
              textFormat: CountDownTextFormat.S,
              isReverse: false,
              isReverseAnimation: false,
              isTimerTextShown: false,
              autoStart: false,
              onStart: () {},
              onComplete: (){
                nextQuestion();
              },
              onChange: (String timeStamp){},
              timeFormatterFunction: null,
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
          Center(
            child: Container(
              color: Colors.white,
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
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question(this.questionText,  this.options,  this.correctAnswer);
}