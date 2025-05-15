class Question {
  final String id;
  final String type;
  final String text;
  final bool isLatex;
  final bool isImage;
  final String? imageUrl;
  final String? latexString;
  final int xp;
  final String tag;
  final String difficulty;
  final String topic;
  final String chapter;
  final List<Option> optionList;

  Question({
    required this.id,
    required this.type,
    required this.text,
    required this.isLatex,
    required this.isImage,
    this.imageUrl,
    this.latexString,
    required this.xp,
    required this.tag,
    required this.difficulty,
    required this.topic,
    required this.chapter,
    required this.optionList,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      type: json['type'],
      text: json['text'],
      isLatex: json['is_latex'],
      isImage: json['is_image'],
      imageUrl: json['image_url'],
      latexString: json['latex_string'],
      xp: json['xp'],
      tag: json['tag'],
      difficulty: json['difficulty'],
      topic: json['topic'],
      chapter: json['chapter'],
      optionList:
          (json['option_list'] as List)
              .map((option) => Option.fromJson(option))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'text': text,
      'is_latex': isLatex,
      'is_image': isImage,
      'image_url': imageUrl,
      'latex_string': latexString,
      'xp': xp,
      'tag': tag,
      'difficulty': difficulty,
      'topic': topic,
      'chapter': chapter,
      'option_list': optionList.map((option) => option.toJson()).toList(),
    };
  }
}

class Option {
  final bool isImage;
  final bool isLatex;
  final String text;
  final String? latexString;
  final String? imageUrl;
  final bool isCorrect;

  Option({
    required this.text,
    required this.isCorrect,
    this.isImage = false,
    this.isLatex = false,
    this.latexString,
    this.imageUrl,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      isImage: json['is_image'],
      isLatex: json['is_latex'],
      text: json['text'],
      latexString: json['latex_string'],
      imageUrl: json['image_url'],
      isCorrect: json['is_correct'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_image': isImage,
      'is_latex': isLatex,
      'text': text,
      'latex_string': latexString,
      'image_url': imageUrl,
      'is_correct': isCorrect,
    };
  }
}
