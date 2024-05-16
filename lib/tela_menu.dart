import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class TelaQuiz extends StatefulWidget {
  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class _TelaQuizState extends State<TelaQuiz> {
  int questionIndex = 0;
  int score = 0;
  int perguntaAtual = 1;
  List <Question> questions = [
    Question('Quem pintou a Mona Lisa?', 
    ['Leornado da Vinci', 'Vincent Van Gogh', 'Pablo Picasso', 'Claude Monet'],
    'Leornado da Vinci',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqWRpa_xrwaPLKt_LADjacrbdsaEBIhgpi88Llcm3nyw&s'),

    Question('Qual o maior planeta do nosso sistema solar?',
    ['Júpiter', 'Saturno', 'Netuno', 'Mercúrio'],
    'Júpiter',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Planets2013-unlabeled.jpg/390px-Planets2013-unlabeled.jpg'),

  ];

  void checkAnswer(String userAnswer) { 
   String correctAnswer = questions[questionIndex].correctAnswer;
   
   setState((){
     if(userAnswer == correctAnswer){
       score++;
     }
     if (questionIndex < questions.length - 1){
       questionIndex++;
       perguntaAtual++;
     }else{

     }
   });
  }

  void resetQuiz() {
  setState(() {
    questionIndex = 0;
    score = 0;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, 
      title: Row(
        children: [
          const Spacer(),
          Text('$perguntaAtual / ${questions.length}'),
        ],
      )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 7,
                child: Image.network(
                  questions[questionIndex].imageUrl,
                )
            ),
            Expanded(
              flex: 7,
              child: Center(
                child: Text(
                  questions[questionIndex].questionText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22.0, color: Colors.black),
                ),
              )
            ), 
            Container(
            alignment: Alignment.center,
            child:Column( 
              children: questions[questionIndex].options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 83, 170, 241)),
                  onPressed: () => checkAnswer(option),
                    child:Text(option, style: const TextStyle(color: Colors.black),),
              )
              );
            }).toList(),
            )
          ),
        ]
      )
    );
  }      
}

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String imageUrl;
  Question(this.questionText, this.options, this.correctAnswer, this.imageUrl);
}