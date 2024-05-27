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
      'Qual é o nome do hobbit que herda o Um Anel no início da trilogia “O Senhor dos Anéis”?',
      ['Frodo Bolseiro', 'Bilbo Bolseiro', 'Samwise Gamgee', 'Peregrin Took'],
      'Frodo Bolseiro',
      'assets/images/fantasia/E_q1.jpg'
    ),
    Question(
      'Fantasia',
      'Qual destes filmes NÃO é baseado em um livro?',
      ['O Labirinto do Fauno', 'As Crônicas de Nárnia', 'Stardust: O Mistério da Estrela', 'A Bússola de Ouro'],
      'O Labirinto do Fauno',
      'assets/images/fantasia/E_q2.webp'
    ),
    Question(
      'Fantasia',
      'Quem é o autor dos livros que inspiraram a série de filmes “O Hobbit”?',
      ['J.K. Rowling', 'George R.R. Martin', 'J.R.R. Tolkien', 'C.S. Lewis'],
      'J.R.R. Tolkien',
      'assets/images/fantasia/E_q3.webp'
    ),
    Question(
      'Fantasia',
      'Em “Harry Potter”, qual animal representa a casa da Grifinória?',
      ['Serpente', 'Texugo', 'Leão', 'Águia'],
      'Leão',
      'assets/images/fantasia/E_q4.jpg'
    ),
    //genero: terror
    Question(
      'Terror',
      'Qual filme de terror de 1999 foi famoso por seu estilo de filmagem "found footage" (filmagem encontrada)?',
      ['O Chamado', 'Atividade Paranormal', 'A Bruxa de Blair', 'Cloverfield'],
      'A Bruxa de Blair',
      'assets/images/terror/E_q1.webp'
    ),
    Question(
      'Terror',
      'Quem é o diretor do clássico filme de terror "Psicose"?',
      ['Steven Spielberg', 'Alfred Hitchcock', 'John Carpenter', 'Wes Craven'],
      'Alfred Hitchcock',
      'assets/images/terror/E_q2.webp'
    ),
    Question(
      'Terror',
      'Qual é o nome do assassino mascarado na franquia "Pânico"?',
      ['Ghostface', 'Jason Voorhees', 'Leatherface', 'Pinhead'],
      'Ghostface',
      'assets/images/terror/E_q3.jpg'
    ),
    Question(
      'Terror',
      'Qual é o nome da protagonista de "Alien, o Oitavo Passageiro"?',
      ['Sarah Connor', 'Ellen Ripley', 'Laurie Strode', 'Nancy Thompson'],
      'Ellen Ripley',
      'assets/images/terror/E_q4.webp'
    ),
    //genero: sci-fi
    Question(
      'Sci-Fi',
      'Qual é o nome da espaçonave principal na série de filmes "Alien"?',
      ['Nostromo', 'Enterprise', 'Millennium Falcon', 'Discovery One'],
      'Nostromo',
      'assets/images/scifi/E_q1.jpg'
    ),
    Question(
      'Sci-Fi',
      'Em "De Volta para o Futuro", qual é o nome do cientista que constrói a máquina do tempo?',
      ['Dr. Who', 'Dr. Spock', 'Dr. Emmett Brown', 'Dr. Octopus'],
      'Dr. Emmett Brown',
      'assets/images/scifi/E_q2.jpg'
    ),
    Question(
      'Sci-Fi',
      'Qual filme de 1996 dirigido por Roland Emmerich mostra a Terra sendo invadida por extraterrestres no Dia da Independência dos EUA?',
      ['Guerra dos Mundos', 'Independence Day', 'Contatos Imediatos de Terceiro Grau', 'Invasão'],
      'Independence Day',
      'assets/images/scifi/E_q3.jpg'
    ),
    Question(
      'Sci-Fi',
      'Qual filme de 1982 dirigido por Steven Spielberg conta a história de um menino que faz amizade com um extraterrestre?',
      ['Contatos Imediatos de Terceiro Grau', 'E.T. - O Extraterrestre', 'O Dia em que a Terra Parou', 'Planeta dos Macacos'],
      'E.T. - O Extraterrestre',
      'assets/images/scifi/E_q4.jpg'
    )
  ];

  static List <Question> mediumQuestions = [
    //genero: fantasia
    Question(
      'Fantasia',
      'Em “O Senhor dos Anéis”, qual é o nome da cidade dos Elfos onde Frodo se recupera após ser esfaqueado?', 
      ['Rivendell', 'Lothlórien', 'Mirkwood', 'Valinor'],
      'Rivendell',
      'assets/images/fantasia/M_q1.webp'
    ),
    Question(
      'Fantasia',
      'No filme “Labirinto”, quem interpreta o Rei dos Duendes?',
      ['Tim Curry', 'David Bowie', 'Johnny Depp', 'Michael Jackson'],
      'David Bowie',
      'assets/images/fantasia/M_q2.jpg'
    ),
    Question(
      'Fantasia',
      'Quem dirigiu o filme “O Labirinto do Fauno”?',
      ['Steven Spielberg', 'Guillermo del Toro', 'Peter Jackson', 'Tim Burton'],
      'Guillermo del Toro',
      'assets/images/fantasia/M_q3.png'
    ),
    Question(
      'Fantasia',
      'Em “Harry Potter”, qual é o nome completo do personagem conhecido como Lupin?',
      ['Remus John Lupin', 'Sirius Black Lupin', 'Remus Severus Lupin', 'Remus James Lupin'],
      'Remus John Lupin',
      'assets/images/fantasia/M_q4.jpg'
    ),
    //genero: terror
    Question(
      'Terror',
      'Qual é o nome do hotel em que se passa grande parte do filme "O Iluminado"?',
      ['Overlook Hotel', 'Bates Motel', 'Torrance Inn', 'Blackwood Hotel'],
      'Overlook Hotel',
      'assets/images/terror/M_q1.jpg'
    ),
    Question(
      'Terror',
      'Em "Invocação do Mal", quais são os nomes dos investigadores paranormais principais?',
      ['Ed e Lorraine Warren', 'Sam e Dean Winchester', 'Carl e Elise Rainier', 'Roger e Carolyn Perron'],
      'Ed e Lorraine Warren',
      'assets/images/terror/M_q2.jpg'
    ),
    Question(
      'Terror',
      'Em qual filme de terror de 1980 Jack Nicholson grita "Here s Johnny!"?',
      ['Um Estranho no Ninho', 'O Iluminado', 'Chinatown', 'Batman'],
      'O Iluminado',
      'assets/images/terror/M_q3.webp'    
    ),
    Question(
      'Terror',
      'Qual é o nome do demônio que possui Regan em "O Exorcista"?',
      ['Pazuzu', 'Azazel', ' Beelzebub', 'Lilith'],
      'Pazuzu',
      'assets/images/terror/M_q4.jpg'
    ),
    //genero: sci-fi
    Question(
      'Sci-Fi',
      'Qual filme de 2014 dirigido por Christopher Nolan explora a viagem espacial através de um buraco de minhoca perto de Saturno?',
      ['Gravidade', 'Interestelar', 'A Origem', 'Perdido em Saturno'],
      'Interestelar',
      'assets/images/scifi/M_q1.jpg'
    ),
    Question(
      'Sci-Fi',
      'No filme "Duna" de 2021, qual é a substância preciosa encontrada apenas no planeta Arrakis?',
      ['Unobtainium', 'Spice', 'Vibranium', 'Adamantium'],
      'Spice',
      'assets/images/scifi/M_q2.webp'
    ),
    Question(
      'Sci-Fi',
      'Qual diretor é famoso por seu trabalho em "Blade Runner 2049" e "A Chegada"?',
      ['Christopher Nolan', 'Denis Villeneuve', 'Ridley Scott', 'James Cameron'],
      'Denis Villeneuve',
      'assets/images/scifi/M_q3.jpg'
    ),
    Question(
      'Sci-Fi',
      'Em "Matrix Reloaded", qual é o nome da cidade subterrânea que é o último refúgio da humanidade?',
      ['Avalon', 'Zion', 'Nebuchadnezzar', 'Arcádia'],
      'Zion',
      'assets/images/scifi/M_q4.jpg'
    ),
  ];

  static List <Question> hardQuestions = [
    //genero: fantasia
    Question(
      'Fantasia',
      'No filme “A Viagem de Chihiro”, qual é o nome do banho público onde Chihiro trabalha?',
      ['Banho de Espíritos', 'Banho de Deuses', 'Banho de Sonhos', 'Banho dos Deuses do Rio'],
      'Banho dos Deuses do Rio',
      'assets/images/fantasia/H_q1.jpg'
    ),
    Question(
      'Fantasia',
      'Qual é o nome da espada lendária que Aragorn usa em “O Senhor dos Anéis”?',
      ['Andúril', 'Narsil', 'Glamdring', 'Gurthang'],
      'Andúril',
      'assets/images/fantasia/H_q2.jpg'
    ),
    Question(
      'Fantasia',
      'Qual é o nome do lobo gigante que aparece em “A Bússola de Ouro”?',
      ['Fenrir', 'Hati', 'Sköll', 'Iorek Byrnison'],
      'Iorek Byrnison',
      'assets/images/fantasia/H_q3.jpg'
    ),
    Question(
      'Fantasia',
      'Em “Stardust: O Mistério da Estrela”, qual é o nome do vilão que busca a estrela caída?',
      ['Septimus', 'Lamia', 'Primus', 'Tristan'],
      'Lamia',
      'assets/images/fantasia/H_q4.jpg'
    ),
    //genero: terror
    Question(
      'Terror',
      'Qual é o título do livro fictício que aparece em "A Morte do Demônio" (Evil Dead)?',
      ['Necronomicon Ex-Mortis', 'Liber Mortis', 'Codex Infernum', 'Grimoire of the Damned'],
      'Necronomicon Ex-Mortis',
      'assets/images/terror/H_q1.webp'
    ),
    Question(
      'Terror',
      'Em "O Chamado", quantos dias as vítimas têm após assistir à fita amaldiçoada?',
      ['3 dias', '5 dias', '7 dias', '9 dias'],
      '7 dias',
      'assets/images/terror/H_q2.jpg'
    ),
    Question(
      'Terror',
      'Em "Hereditário", qual é o nome da entidade demoníaca central na trama?',
      ['Paimon', 'Azazel', 'Baphomet', 'Belial'],
      'Paimon',
      'assets/images/terror/H_q3.jpg'
    ),
    Question(
      'Terror',
      'Qual é o verdadeiro nome do assassino em "O Massacre da Serra Elétrica"?',
      ['Thomas Hewitt', 'Bubba Sawyer', 'Jedidiah Sawyer', 'Leatherface'],
      'Bubba Sawyer',
      'assets/images/terror/H_q4.jpg'
    ),
    //genero: sci-fi
    Question(
      'Sci-Fi',
      'Qual é o nome do computador a bordo da nave Discovery One no filme "2001: Uma Odisseia no Espaço"?',
      ['HAL 9000', 'GERTY', 'JARVIS', 'ED-209'],
      'HAL 9000',
      'assets/images/scifi/H_q1.webp'
    ),
    Question(
      'Sci-Fi',
      'Em "Solaris" de Andrei Tarkovsky, qual é o nome do planeta coberto por um oceano que parece ter consciência?',
      ['Giedi Prime', 'Solaris', 'Trantor', 'Klendathu'],
      'Solaris',
      'assets/images/scifi/H_q2.webp'
    ),
    Question(
      'Sci-Fi',
      'Em "Blade Runner", qual é o nome da corporação que cria os replicantes?',
      ['Cyberdyne Systems', 'Tyrell Corporation', 'Weyland-Yutani', 'Omni Consumer Products'],
      'Tyrell Corporation',
      'assets/images/scifi/H_q3.jpg'
    ),
    Question(
      'Sci-Fi',
      'Em "Donnie Darko", qual é o nome do coelho gigante que aparece para o protagonista?',
      ['Harvey', 'Frank', 'Roger', 'Max'],
      'Frank',
      'assets/images/scifi/H_q4.jpg'
    ),
  ];
}  

class Question {
  final String genero;
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String image;

  Question(this.genero, this.questionText, this.options, this.correctAnswer, this.image);
}
