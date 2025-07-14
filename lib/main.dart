import 'package:flutter/material.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void validateQuestion(bool answer) {
    bool correctAnswer = answers[questionNumber];

    if (questionNumber + 1 < questions.length) {
      questionNumber++;
    } else {
      questionNumber = 0;
    }

    if (answer == correctAnswer) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
  }

  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'You can lead a cow upstairs, but not downstairs',
    'Approximately one quarter of human bones are in the feet',
    'A slug\'s blood is green',
  ];

  int questionNumber = 0;
  List<bool> answers = [false, true, true];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                questions[questionNumber],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              color: Colors.green,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    validateQuestion(true);
                  });
                },
                child: Text("True", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    validateQuestion(false);
                  });
                },
                child: Text("False", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}
