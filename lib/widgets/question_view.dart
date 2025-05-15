import 'package:flutter/material.dart';
import 'package:flutter_quiz_demo/models.dart';
import 'package:latext/latext.dart';

class QuestionView extends StatelessWidget {
  final Question question;

  const QuestionView({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    if (question.isLatex) {
      return LaTexT(
        laTeXCode: Text(
          question.latexString ?? question.text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      );
    } else if (question.isImage && question.imageUrl != null) {
      return Column(
        children: [
          Image.network(
            question.imageUrl!,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Text('Failed to load image'));
            },
          ),
          const SizedBox(height: 12),
          Text(
            question.text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else {
      return Text(
        question.text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      );
    }
  }
}
