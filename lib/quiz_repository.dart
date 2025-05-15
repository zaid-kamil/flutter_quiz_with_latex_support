import 'package:flutter_quiz_demo/models.dart';

abstract class QuizRepository {
  Future<List<Question>> getQuizzes();
  Future<Question> getQuizById(String id);
}

class QuizRepositoryImpl implements QuizRepository {
  @override
  Future<List<Question>> getQuizzes() async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));
    return [
      // Math question with latex in question and options in this format
      // ex:  r'$$\left\{\begin{array}{l}3 x-4 y=1 \\ -3 x+7 y=5\end{array}\right.$$',
      Question(
        id: '2',
        type: 'multiple_choice',
        text: r'What is the x and y in the following equation',
        isLatex: true,
        isImage: false,
        imageUrl: null,
        latexString:
            r'What is the x and y in the following equation. $$\left\{\begin{array}{l}3 x-4 y=1 \\ -3 x+7 y=5\end{array}\right.$$',
        xp: 20,
        tag: 'math',
        difficulty: 'medium',
        topic: 'algebra',
        chapter: 'equations',
        optionList: [
          Option(text: r'$$x = 1, y = 2$$', isCorrect: true, isLatex: true),
          Option(text: r'$$x = 2, y = 1$$', isCorrect: false, isLatex: true),
          Option(text: r'$$x = 0, y = 0$$', isCorrect: false, isLatex: true),
          Option(text: r'$$x = -1, y = -2$$', isCorrect: false, isLatex: true),
        ],
      ),
      // latex integration question
      Question(
        id: '3',
        type: 'multiple_choice',
        text: r'$$\int_0^1 x^2 \, dx$$',
        isLatex: true,
        isImage: false,
        imageUrl: null,
        latexString: r'$$\int_0^1 x^2 \, dx$$',
        xp: 25,
        tag: 'calculus',
        difficulty: 'hard',
        topic: 'integration',
        chapter: 'calculus',
        optionList: [
          Option(text: r'$$\frac{1}{3}$$', isCorrect: true, isLatex: true),
          Option(text: r'$$\frac{1}{2}$$', isCorrect: false, isLatex: true),
          Option(text: r'$$1$$', isCorrect: false, isLatex: true),
          Option(text: r'$$0$$', isCorrect: false, isLatex: true),
        ],
      ),
      // latex differentiation question
      Question(
        id: '4',
        type: 'multiple_choice',
        text: r'$$\frac{d}{dx} \left( x^3 + 2x^2 + 3x + 4 \right)$$',
        isLatex: true,
        isImage: false,
        imageUrl: null,
        latexString: r'$$\frac{d}{dx} \left( x^3 + 2x^2 + 3x + 4 \right)$$',
        xp: 30,
        tag: 'calculus',
        difficulty: 'medium',
        topic: 'differentiation',
        chapter: 'calculus',
        optionList: [
          Option(text: r'$$3x^2 + 4x + 3$$', isCorrect: true, isLatex: true),
          Option(text: r'$$2x^2 + 3x + 4$$', isCorrect: false, isLatex: true),
          Option(text: r'$$1$$', isCorrect: false, isLatex: true),
          Option(text: r'$$0$$', isCorrect: false, isLatex: true),
        ],
      ),
      // latex geometry question
      Question(
        id: '5',
        type: 'multiple_choice',
        text: r'$$\text{Area of a circle} = \pi r^2$$',
        isLatex: true,
        isImage: false,
        imageUrl: null,
        latexString: r'$$\text{Area of a circle} = \pi r^2$$',
        xp: 20,
        tag: 'geometry',
        difficulty: 'easy',
        topic: 'circle',
        chapter: 'geometry',
        optionList: [
          Option(text: r'$$\pi r^2$$', isCorrect: true, isLatex: true),
          Option(text: r'$$2\pi r$$', isCorrect: false, isLatex: true),
          Option(
            text: r'$$\frac{1}{2}\pi r^2$$',
            isCorrect: false,
            isLatex: true,
          ),
          Option(
            text: r'$$\frac{3}{4}\pi r^2$$',
            isCorrect: false,
            isLatex: true,
          ),
        ],
      ),
      // latex trigonometry question
      Question(
        id: '6',
        type: 'multiple_choice',
        text: r'$$\sin^2(x) + \cos^2(x) = 1$$',
        isLatex: true,
        isImage: false,
        imageUrl: null,
        latexString: r'$$\sin^2(x) + \cos^2(x) = 1$$',
        xp: 30,
        tag: 'trigonometry',
        difficulty: 'hard',
        topic: 'trigonometric identities',
        chapter: 'trigonometry',
        optionList: [
          Option(
            text: r'$$\tan(x) = \frac{\sin(x)}{\cos(x)}$$',
            isCorrect: true,
            isLatex: true,
          ),
          Option(
            text: r'$$\sin(2x) = 2\sin(x)\cos(x)$$',
            isCorrect: false,
            isLatex: true,
          ),
          Option(
            text: r'$$\cos(2x) = \cos^2(x) - \sin^2(x)$$',
            isCorrect: false,
            isLatex: true,
          ),
          Option(
            text: r'$$\sin(3x) = 3\sin(x) - 4\sin^3(x)$$',
            isCorrect: false,
            isLatex: true,
          ),
        ],
      ),
    ];
  }

  @override
  Future<Question> getQuizById(String id) {
    // Simulate a network call
    return Future.delayed(const Duration(seconds: 2), () {
      // latex trigonometry question
      return Question(
        id: id,
        type: 'multiple_choice',
        text: r'$$\sin^2(x) + \cos^2(x) = 1$$',
        isLatex: true,
        isImage: false,
        imageUrl: null,
        latexString: r'$$\sin^2(x) + \cos^2(x) = 1$$',
        xp: 30,
        tag: 'trigonometry',
        difficulty: 'hard',
        topic: 'trigonometric identities',
        chapter: 'trigonometry',
        optionList: [
          Option(
            text: r'$$\tan(x) = \frac{\sin(x)}{\cos(x)}$$',
            isCorrect: true,
          ),
          Option(text: r'$$\sin(2x) = 2\sin(x)\cos(x)$$', isCorrect: false),
          Option(
            text: r'$$\cos(2x) = \cos^2(x) - \sin^2(x)$$',
            isCorrect: false,
          ),
          Option(
            text: r'$$\sin(3x) = 3\sin(x) - 4\sin^3(x)$$',
            isCorrect: false,
          ),
        ],
      );
    });
  }
}
