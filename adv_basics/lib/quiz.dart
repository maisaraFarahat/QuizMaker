import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State {
  String activeScreen = 'start-screen';

  final List<String> chosenAnswers = [];
  @override
  void initState() {
    super.initState();
    // activeScreen = StartScreen(switchScreen);
  }

  void chooseAnswer(String answer) {
    chosenAnswers.add(answer);
    if (chosenAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
      // activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer(answer));
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      activeWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      activeWidget = ResultsScreen(
        chosenAnswers: chosenAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 48, 0, 85),
                  Color.fromARGB(255, 60, 0, 129)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: activeWidget),
      ),
    );
  }
}
