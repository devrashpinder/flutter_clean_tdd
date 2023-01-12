import 'dart:convert';

import 'package:flutter_clean_tdd/features/core/error/exceptions.dart';
import 'package:flutter_clean_tdd/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_clean_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_clean_tdd/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'number_trivia_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late final NumberTriviaRemoteDataSourceImpl dataSource;
  late final MockClient mockClient;

  setUpAll(() {
    mockClient = MockClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(httpClient: mockClient);
  });
  void setUpMockHttpClientSuccess() {
   when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('trivia.json'), 200),
    );
  }
  void setUpMockHttpClientFailure() {
    when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  group('getConcreteNumberTrivia', () {
    const tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
    test(
        'should perform a GET request on a URL with number being the endpoint and with application/json header',
        () {
      setUpMockHttpClientSuccess();
      dataSource.getConcreteNumberTrivia(tNumber);
      verify(mockClient.get(
        Uri.parse(AppConstants.baseUrl + tNumber.toString()),
        headers: {'Content-Type': 'application/json'},
      ));
    });
     test(
        'should return NumberTrivia when the response code is 200(Success)',
        () async{
      setUpMockHttpClientSuccess();
      final result = await dataSource.getConcreteNumberTrivia(tNumber);
      expect(result, equals(tNumberTriviaModel));
    });

       test('should throw a ServerException when the response code is 404 or other',
        () async {
      setUpMockHttpClientFailure();
      final call =  dataSource.getConcreteNumberTrivia;
      expect(() => call(tNumber), throwsA(const TypeMatcher<ServerException>()));
    });
  });

   group('getRandomNumberTrivia', () {
    const tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
    test(
        'should perform a GET request on a URL with number being the endpoint and with application/json header',
        () {
      setUpMockHttpClientSuccess();
      dataSource.getRandomNumberTrivia();
      verify(mockClient.get(
        Uri.parse('${AppConstants.baseUrl}random'),
        headers: {'Content-Type': 'application/json'},
      ));
    });
    test('should return NumberTrivia when the response code is 200(Success)',
        () async {
      setUpMockHttpClientSuccess();
      final result = await dataSource.getRandomNumberTrivia();
      expect(result, equals(tNumberTriviaModel));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      setUpMockHttpClientFailure();
      final call = dataSource.getRandomNumberTrivia;
      expect(
          () => call(), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
