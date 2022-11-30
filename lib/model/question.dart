import 'package:flutter_application_1/model/answer.dart';

class Question {
  String label;
  List<Answer> answers;
  Question({required this.label, required this.answers});

  static Question quest =
      Question(label: 'Hình tam giác có mấy cạnh?', answers: [
    Answer(label: '1', isCorrect: false),
    Answer(label: '2', isCorrect: false),
    Answer(label: '3', isCorrect: true),
    Answer(label: '4', isCorrect: false),
  ]);
}
