
import 'package:flutter_clean_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_clean_tdd/features/number_trivia/presentation/cubit/number_trivia_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


import 'number_trivia_cubit_test.mocks.dart';

@GenerateMocks([GetConcreteNumberTrivia])
@GenerateMocks([GetRandomNumberTrivia])
void main() {
  late final NumberTriviaCubit cubit;
  late final MockGetConcreteNumberTrivia mockGetConcrete;
  late final MockGetRandomNumberTrivia mockGetRandom;

  setUpAll((){
     mockGetConcrete = MockGetConcreteNumberTrivia();
     mockGetRandom = MockGetRandomNumberTrivia();
     cubit = NumberTriviaCubit(getConcrete: mockGetConcrete, getRandom: mockGetRandom);
  });

  group('GetConcreteNumberTrivia', (){
     const tNumberString = '1';
     final tNumberParsed = int.parse(tNumberString);
     const tNumberTrivia = NumberTrivia(text: 'test trivia', number: 1);
      
    test('should get data from the concrete usecase', () async* {
      //arrange
      // when(mockGetConcrete(any))
      //     .thenAnswer((_) async => Right(tNumberTrivia));
      //act
      
      // await untilCalled(mockGetRandomNumberTrivia(any));

      // //assert
      // verify(mockGetConcreteNumberTrivia(Params(number: tNumberParsed)));
    });
  });
}