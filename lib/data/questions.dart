import 'package:quiz_app/models/quiz_question.dart';

import '../models/quiz_question.dart';

final quizQuestions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestion('How are Flutter UIs built?', [
    'By combining widgets in code',
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];

final questions2 = [
  QuizQuestion(
    'Which programming language is primarily used to write Flutter apps?',
    [
      'Dart',
      'Java',
      'Kotlin',
      'Swift',
    ],
  ),
  QuizQuestion(
    'What command is used to create a new Flutter project?',
    [
      'flutter create project_name',
      'flutter new project_name',
      'flutter init project_name',
      'flutter start project_name',
    ],
  ),
  QuizQuestion(
    'Which widget is used for creating infinite scrolling lists in Flutter?',
    [
      'ListView.builder',
      'SingleChildScrollView',
      'GridView',
      'Column',
    ],
  ),
  QuizQuestion(
    'What is the root widget of a Flutter app?',
    [
      'MaterialApp',
      'Scaffold',
      'Container',
      'AppBar',
    ],
  ),
  QuizQuestion(
    'Which widget provides structure for the visual interface (like app bar, body, floating button)?',
    [
      'Scaffold',
      'Container',
      'MaterialApp',
      'SafeArea',
    ],
  ),
  QuizQuestion(
    'Which method is called once when a StatefulWidget is inserted into the widget tree?',
    [
      'initState()',
      'build()',
      'setState()',
      'dispose()',
    ],
  ),
  QuizQuestion(
    'Which method is used to free resources in a StatefulWidget?',
    [
      'dispose()',
      'deactivate()',
      'endState()',
      'destroy()',
    ],
  ),
  QuizQuestion(
    'What does the “hot reload” feature in Flutter do?',
    [
      'Updates code changes instantly without losing the current app state',
      'Restarts the app completely',
      'Rebuilds the entire project from scratch',
      'Clears cache and restarts the emulator',
    ],
  ),
  QuizQuestion(
    'Which widget is used to add padding around other widgets?',
    [
      'Padding',
      'Container',
      'SizedBox',
      'Margin',
    ],
  ),
  QuizQuestion(
    'Which layout widget arranges its children in a horizontal or vertical direction?',
    [
      'Row and Column',
      'Stack',
      'ListView',
      'GridView',
    ],
  ),
];

final questions3 = [
  QuizQuestion(
    'Which widget allows stacking widgets on top of each other?',
    [
      'Stack',
      'Column',
      'Row',
      'ListView',
    ],
  ),
  QuizQuestion(
    'What widget is typically used for long lists of scrollable items with separators?',
    [
      'ListView.separated',
      'ListView.builder',
      'GridView.count',
      'Column',
    ],
  ),
  QuizQuestion(
    'Which widget is best for responsive design that adapts to screen size?',
    [
      'LayoutBuilder',
      'Container',
      'Row',
      'Padding',
    ],
  ),
  QuizQuestion(
    'What is the function of the SafeArea widget?',
    [
      'Avoids system UI intrusions like notches and status bars',
      'Adds padding to any widget',
      'Restricts widgets to safe memory usage',
      'Improves app security',
    ],
  ),
  QuizQuestion(
    'Which Flutter widget is used to make an area scrollable?',
    [
      'SingleChildScrollView',
      'Column',
      'Expanded',
      'Align',
    ],
  ),
  QuizQuestion(
    'Which widget allows you to create flexible space distribution in a Row or Column?',
    [
      'Expanded',
      'SizedBox',
      'Spacer',
      'Align',
    ],
  ),
  QuizQuestion(
    'Which Flutter widget is commonly used for navigation between screens?',
    [
      'Navigator',
      'Scaffold',
      'MaterialApp',
      'AppBar',
    ],
  ),
  QuizQuestion(
    'What does the FutureBuilder widget do?',
    [
      'Builds widgets based on the result of a Future',
      'Builds widgets based on a Stream',
      'Builds widgets for infinite scrolling lists',
      'Builds widgets lazily in a grid',
    ],
  ),
  QuizQuestion(
    'Which widget is used to detect user gestures like taps or swipes?',
    [
      'GestureDetector',
      'Listener',
      'InkWell',
      'Detector',
    ],
  ),
  QuizQuestion(
    'Which widget provides a way to manage state across multiple widgets in the app?',
    [
      'InheritedWidget',
      'StatefulWidget',
      'StatelessWidget',
      'FutureBuilder',
    ],
  ),
];



List<QuizQuestion> GetQuestions(int listnumber){
  if (listnumber == 1){
    return quizQuestions;
  }  
  else if (listnumber == 2){
    return questions2;
  }
  else{
    return questions3;
  }
}