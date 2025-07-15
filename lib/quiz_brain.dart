import 'question.dart';

class QuizBrain {
  // store all questions
  final List<Question> _questionBank = [
    Question('You can lead a cow upstairs, but not downstairs', false),
    Question('Approximately one quarter of human bones are in the feet', true),
    Question('A slug\'s blood is green', true),
  ];
  // starting question number
  int _questionNumber = 0;

  // returns the current question number
  int get questionNumber => _questionNumber;
  // returns the amount of questions
  int get questionBankLength => _questionBank.length;

  // Checks if the user is on the final question
  bool onFinalQuestion() {
    if (_questionNumber == questionBankLength - 1) {
      return true;
    }
    return false;
  }

  // Move to the next question if the user is not on the final question
  void goToNextQuestion() {
    if (!onFinalQuestion()) {
      _questionNumber++;
    }
  }

  // returns a boolean wether the answer input is correct for the question
  bool validateAnswer(bool answer) {
    if (_getCorrectAnswer() == answer) {
      return true;
    }
    return false;
  }

  // returns the correct answer for the current question
  bool _getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  // returns the question text of the current question
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }
}
