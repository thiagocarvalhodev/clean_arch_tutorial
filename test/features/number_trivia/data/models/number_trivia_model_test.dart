import 'dart:convert';

import 'package:clean_arch_tutorial/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_arch_tutorial/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final NumberTriviaModel tNumberTriviaModel =
      NumberTriviaModel(number: 1, text: 'Text');
  test('should be a subclass of NumberTrivia entity', () {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer', () {
      // arrange
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('trivia.json'));

      // act
      final result = NumberTriviaModel.fromJson(jsonMap);

      // assert
      expect(result, tNumberTriviaModel);
    });

    test('should return a valid model when the JSON number is an double', () {
      // arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('trivia_double.json'));

      // act
      final result = NumberTriviaModel.fromJson(jsonMap);

      // assert
      expect(result, tNumberTriviaModel);
    });

    group('toJson', () {
      test('should return a Map with exactly data of NumberTrivia model', () {
        // arrange

        // act
        final Map<String, dynamic> result = tNumberTriviaModel.toJson();
        // assert
        final jsonExpected = {
          'text': tNumberTriviaModel.text,
          'number': tNumberTriviaModel.number
        };

        expect(result, jsonExpected);
      });
    });
  });
}
