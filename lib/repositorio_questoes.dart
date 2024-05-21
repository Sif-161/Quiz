class RepositorioQuestoes {
  static List <Question> getQuestions(String dificuldade, String genero){
    switch (dificuldade) {
      case 'Fácil':
        return _getQuestionsPorGenero(genero, easyQuestions);
      case 'Médio':
        return _getQuestionsPorGenero(genero, mediumQuestions);
      case 'Difícil':
        return _getQuestionsPorGenero(genero,hardQuestions);
      default:
        return _getQuestionsPorGenero(genero, easyQuestions);

    }
  }
  
  static List<Question> _getQuestionsPorGenero(String genero, List<Question> questions) {
    switch (genero){
      case 'Fantasia':
        return questions.where((question) => question.genero == 'Fantasia').toList();
      case 'Terror':
        return questions.where((question) => question.genero == 'Terror').toList();
      case 'Ação':
        return questions.where((question) => question.genero == 'Ação').toList();
      case 'Sci-Fi':
        return questions.where((question) => question.genero == 'Sci-Fi').toList();
      default:
        return questions;
    }
  }

  static List <Question> easyQuestions = [
    //genero: fantasia
    Question(
      'Fantasia',
      'questao 1',
      ['opcao 1', 'opcao 2', 'opcao 3', 'opcao 4'],
      'opcao 1',
    ),
    Question(
      'Fantasia',
       'igiu',
        ['idhs', 'dsh9', 'dhs98', 'ewui'],
        'dhs98',
        ),
    //genero: Terror
    Question(
      'Terror',
      'questao 2',
      ['opcao 1', 'opcao 2', 'opcao 3', 'opcao 4'],
      'opcao 2',
    ),
  ];

  static List <Question> mediumQuestions = [
    //genero: fantasia
    Question(
      'Fantasia',
      'questao 1',
      ['opcao 1', 'opcao 2', 'opcao 3', 'opcao 4'],
      'opcao 1',
    ),
    //genero: Terror
    Question(
      'Terror',
      'questao 2',
      ['opcao 1', 'opcao 2', 'opcao 3', 'opcao 4'],
      'opcao 2',
    ),
  ];

  static List <Question> hardQuestions = [
    //genero: fantasia
    Question(
      'Fantasia',
      'questao 1',
      ['opcao 1', 'opcao 2', 'opcao 3', 'opcao 4'],
      'opcao 1',
    ),
    //genero: Terror
    Question(
      'Terror',
      'questao 2',
      ['opcao 1', 'opcao 2', 'opcao 3', 'opcao 4'],
      'opcao 2',
    ),
  ];
}  

class Question {
  final String genero;
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question(this.genero, this.questionText, this.options, this.correctAnswer);
}
