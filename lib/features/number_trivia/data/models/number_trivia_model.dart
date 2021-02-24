import 'package:clean_arch_tutorial/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({String text, int number})
      : super(number: number, text: text);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      NumberTriviaModel(
          number: (json['number'] as num).toInt(), text: json['text']);

  Map<String, dynamic> toJson() => {'text': text, 'number': number};
}
