import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:quickalert/quickalert.dart';

QuizBrain quizBrain = QuizBrain();

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
  int finished = 0;
  void checkAnswer(bool answer) {
    if (quizBrain.onFinalQuestion() && finished > 0) {
      return;
    } else if (quizBrain.onFinalQuestion()) {
      finished++;
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: "Quiz Completed!",
      );
    }
    // Check if the question was correct
    // And add the corresponding icon to the scoreKeeper.
    if (quizBrain.validateAnswer(answer)) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      print("Question was correct!");
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      print("Question was incorrect :(");
    }
    quizBrain.goToNextQuestion();
  }

  List<Icon> scoreKeeper = [];

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
                quizBrain.getQuestionText(),
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
                    checkAnswer(true);
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
                    checkAnswer(false);
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
