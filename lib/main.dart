import 'package:flutter/material.dart';
import 'package:flutter_quiz_demo/models.dart';
import 'package:flutter_quiz_demo/quiz_repository.dart';
import 'package:flutter_quiz_demo/screens/quiz_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.indigo,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.indigo,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: QuizScreen(repository: QuizRepositoryImpl()),
      debugShowCheckedModeBanner: false,
    );
  }
}
