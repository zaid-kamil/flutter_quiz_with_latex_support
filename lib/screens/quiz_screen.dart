import 'package:flutter/material.dart';
import 'package:flutter_quiz_demo/models.dart';
import 'package:flutter_quiz_demo/quiz_repository.dart';
import 'package:flutter_quiz_demo/widgets/question_view.dart';
import 'package:flutter_quiz_demo/widgets/option_view.dart';

class QuizScreen extends StatefulWidget {
  final QuizRepository repository;

  const QuizScreen({super.key, required this.repository});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int selectedOptionIndex = -1;
  bool isLoading = true;
  int totalQuestions = 5; // Total number of questions in the quiz

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    setState(() {
      isLoading = true;
    });

    try {
      final loadedQuestions = await widget.repository.getQuizzes();
      setState(() {
        questions = loadedQuestions;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Show error
    }
  }

  void _selectOption(int index) {
    setState(() {
      selectedOptionIndex = index;
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptionIndex = -1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: Colors.indigo,
        body: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    if (questions.isEmpty) {
      return Scaffold(
        body: const Center(
          child: Text(
            "No questions available",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text('Level ${currentQuestionIndex + 1}'),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     // Handle back navigation
        //     Navigator.of(context).pop();
        //   },
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${currentQuestionIndex + 1}/$totalQuestions',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Question counter
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!, width: 4),
              ),
              child: Center(
                child: Text(
                  (question.xp).toString(),
                  style: const TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Question card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: QuestionView(question: question),
              ),
            ),

            const SizedBox(height: 24),

            // Options
            ...List.generate(question.optionList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: OptionView(
                  option: question.optionList[index],
                  index: index,
                  isSelected: index == selectedOptionIndex,
                  onSelect: () => _selectOption(index),
                ),
              );
            }),

            const Spacer(),

            // Next button
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: selectedOptionIndex >= 0 ? _nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  disabledBackgroundColor: Colors.white.withValues(alpha: .5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.indigo),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
