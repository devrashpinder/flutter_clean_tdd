import 'dart:convert';

import 'package:flutter_clean_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(text: 'Test text', value: 1);

  test('should be subclass of Number Trivia entity', () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group("From json", () {
    test('should return a valid model when the JSON number is integer',
        () async {
      final Map<String, dynamic> triviaJSON =
          json.decode(fixture('trivia.json'));
      final triviaModel = NumberTriviaModel.fromJson(triviaJSON);
      expect(tNumberTriviaModel, triviaModel);
    });

    test('should return a valid model when the JSON number is double',
        () async {
      final Map<String, dynamic> triviaJSON =
          json.decode(fixture('trivia_double.json'));
      final triviaModel = NumberTriviaModel.fromJson(triviaJSON);
      expect(tNumberTriviaModel, triviaModel);
    });

    test('should return a valid JSON Map contaning the proper data', () async {
      final triviaToJson = tNumberTriviaModel.toJson();
      final expectedMap = {"text": "Test text", "number": 1};
      expect(triviaToJson, expectedMap);
    });
  });
}
