import 'package:flutter_clean_tdd/features/core/platforms/network_info.dart';
import 'package:flutter_clean_tdd/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_clean_tdd/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_clean_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_clean_tdd/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late final NumberTriviaRepositoryImpl repository;
  late final MockRemoteDataSource mockRemoteDataSource;
  late final MockLocalDataSource mockLocalDataSource;
  late final MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getConcreteNumberTrivia', (){
    // DATA FOR THE MOCKS AND ASSERTIONS
    // We'll use these three variables throughout all the tests
    const tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel(value: tNumber, text: 'test trivia');
    final NumberTrivia tNumberTrivia = tNumberTriviaModel;

    test('should check if device is online', ()async{
      when(() => mockNetworkInfo.isConnected).thenAnswer((invocation) async=> true);
      repository.getConcreteNumberTrivia(tNumber);
      verify(() => mockNetworkInfo.isConnected);
    });

  });
}
