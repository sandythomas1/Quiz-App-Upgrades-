// need to build stateful widget for quiz
// needs to return MaterialApp
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/select_quiz.dart';
import 'start_screen.dart';
import 'questions_screen.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  int selectedQuiz = 2;

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = 'questions-screen';
  //   });
  // }
  void switchScreen() {
    setState(() {
      activeScreen = 'select-quiz-screen';
    });
  }

  void startQuiz(int number){
    selectedQuiz = number;
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == quizQuestions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  // void restartQuiz() {
  //   setState(() {
  //     selectedAnswers = [];
  //     activeScreen = 'questions-screen';
  //   });
  // }
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'select-quiz-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
        quizNumber: selectedQuiz,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
        quizNumber: selectedQuiz,
      );
    }

    if (activeScreen == 'select-quiz-screen'){
      screenWidget = SelectQuizScreen(
        startQuizNumber: startQuiz
        );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 13, 151, 64),
                Color.fromARGB(255, 15, 132, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}