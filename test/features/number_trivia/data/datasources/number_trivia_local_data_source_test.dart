import 'dart:convert';

import 'package:flutter_clean_tdd/features/core/error/exceptions.dart';
import 'package:flutter_clean_tdd/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_clean_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_clean_tdd/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'number_trivia_local_data_source_test.mocks.dart';


@GenerateMocks([
  SharedPreferences
], customMocks: [
  MockSpec<SharedPreferences>(
      as: #MockSharedPreferencesForTest,onMissingStub: OnMissingStub.returnDefault),
])
void main() {
  late final mockSharedPreferences = MockSharedPreferences();
  late final dataSource =
      NumberTriviaLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);

  group('getLastNumberTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia_cached.json')));
    test(
        'should return NumberTrivia from SharedPreferences when there is one in the cache',
        () async {
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('trivia_cached.json'));

      final result = await dataSource.getLastNumberTrivia();

      verify(
          mockSharedPreferences.getString(AppConstants.cachedNumberTrivia));
      expect(result, equals(tNumberTriviaModel));
    });

    test('should throw a Cache Exception when there is not a cached value',
        () async {
      when( mockSharedPreferences.getString(any)).thenReturn(null);

      final call = dataSource.getLastNumberTrivia;

      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('cachedNumberTrivia', () {
    final tNumberTriviaModel = NumberTriviaModel(text: 'test trivia', value: 1);
    test('should call SharedPreferences to cache the data', () async {
       //act
      dataSource.cacheNumberTrivia(tNumberTriviaModel);
      //assert
      final expectedJsonString = json.encode(tNumberTriviaModel.toJson());
      verify( mockSharedPreferences.setString(
          AppConstants.cachedNumberTrivia, expectedJsonString));
    });
  });
}
