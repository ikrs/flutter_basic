import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(this.answerQuestion, this.questions, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        // ...spread operator
        //map executes a function on every element in the array
        // we are telling map that he will recive List of Strings
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map(
          (answer) {
            return Answer(() => answerQuestion(answer['score']), answer['text']);
          },
        ).toList(), // check this
      ],
    );
  }
}
