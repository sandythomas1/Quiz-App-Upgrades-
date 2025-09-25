import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          icon: const Icon(Icons.arrow_right_alt,size: 24,),
          onPressed: () {
            startQuizNumber(labelNumber);
          },
          label: Text('Start Quiz $labelNumber',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
            ),
        );
    }
  }