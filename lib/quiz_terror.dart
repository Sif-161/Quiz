import 'package:flutter/material.dart';
import 'dart:ui';
import 'tela_resultado.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'repositorio_questoes.dart';

class QuizTerror extends StatefulWidget {
  final String dificuldade;
  final String genero;
  const QuizTerror(this.dificuldade, this.genero);

  @override
  _QuizTerrorState createState() => _QuizTerrorState();
}

class _QuizTerrorState extends State<QuizTerror> {
  int questionIndex = 0;
  int pontuacao = 0;
  final int duracao = 10;
  int perguntaAcertada = 0;
  Map<String, Color> buttonColors = {};
  final CountDownController controle = CountDownController();
  bool isPergunta = false;
  late List <Question> questions;

  @override
  void initState(){
    super.initState();
    questions = RepositorioQuestoes.getQuestions(widget.dificuldade, widget.genero);
  }
  void checkAnswer(String userAnswer) {
    String correctAnswer = questions[questionIndex].correctAnswer;
    int tempoRestante = int.parse(controle.getTime() ?? '0');
    if(isPergunta) return;

    setState(() {
        isPergunta = true;
        if(userAnswer == correctAnswer) {
          perguntaAcertada++;
          int pontuacaoAdd = 5 + tempoRestante;
          pontuacao += pontuacaoAdd;
          buttonColors[userAnswer] = Colors.green;
        } else {
          buttonColors[userAnswer] = Colors.red;
          buttonColors[correctAnswer] = Colors.green;
        }
        
    });
    Future.delayed(Duration(seconds: 1), () {
      setState((){
        if(questionIndex < questions.length - 1){
          questionIndex++;
          controle.restart();
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TelaResultado(pontuacao, questions.length, perguntaAcertada)));
        }
        isPergunta = false;
      });
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
              fillColor: Colors.red,
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
                  });
                  controle.restart();
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaResultado(pontuacao, questions.length, perguntaAcertada)));
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
            'assets/images/terror/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.89,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        questions[questionIndex].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(
                        questions[questionIndex].questionText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
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
                          childAspectRatio: 3,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 10.3,
                          children: questions[questionIndex].options.map((option){
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: buttonColors[option]), onPressed: () => checkAnswer(option), 
                              child: Text(option, style: const TextStyle(color: Colors.black),)),
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