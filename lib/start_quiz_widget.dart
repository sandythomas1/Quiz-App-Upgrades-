

import 'package:flutter/material.dart';

class StartQuizWidget extends StatelessWidget{
  const StartQuizWidget({
    super.key, 
    required this.labelNumber,
    required this.startQuizNumber
    });

  final int labelNumber;
  final void Function(int number) startQuizNumber;

  @override
  Widget build(BuildContext context) {
    return         TextButton.icon(
          icon: const Icon(Icons.arrow_right_alt),
          onPressed: () {
            startQuizNumber(labelNumber);
          },
          label: Text('Start Quiz $labelNumber'),
          );
  }
}