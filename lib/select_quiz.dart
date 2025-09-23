


import 'package:flutter/material.dart';
import 'package:quiz_app/start_quiz_widget.dart';

class SelectQuizScreen extends StatelessWidget{
  const SelectQuizScreen({
    super.key,
    required this.startQuizNumber,
  });

  final void Function(int number) startQuizNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StartQuizWidget(labelNumber: 1, startQuizNumber: startQuizNumber),
        const SizedBox(height: 16,),
        StartQuizWidget(labelNumber: 2, startQuizNumber: startQuizNumber),
        const SizedBox(height: 16,),
        StartQuizWidget(labelNumber: 3, startQuizNumber: startQuizNumber),
      ],
      );
  }
}
