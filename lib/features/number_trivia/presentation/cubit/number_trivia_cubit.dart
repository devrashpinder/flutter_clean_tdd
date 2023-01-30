import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_tdd/features/core/error/failures.dart';
import 'package:flutter_clean_tdd/features/core/usecase/usecase.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_clean_tdd/features/number_trivia/presentation/cubit/number_trivia_state.dart';

class NumberTriviaCubit extends Cubit<NumberTriviaState> {
  NumberTriviaCubit({
    required this.getConcrete,
    required this.getRandom,
  }) : super(NumberTriviaEmptyState());

  final GetConcreteNumberTrivia getConcrete;
  final GetRandomNumberTrivia getRandom;
  
  Future<void> getConcreteNumberTrivia(int number) async{
     final response = await getConcrete.call(Params(number));
     response!.fold((failure) {
      final message = FailureUtils.mapFailureToMessage(failure);
      emit(NumberTriviaErrorState(message));
     } , (numberTrivia) {
      emit(NumberTriviaSucessState(numberTrivia));
     });
  }

   Future<void> getRandomNumber() async {
    final response = await getRandom.call(const NoParams());
    response!.fold((failure) {
      final message = FailureUtils.mapFailureToMessage(failure);
      emit(NumberTriviaErrorState(message));
    }, (numberTrivia) {
      emit(NumberTriviaSucessState(numberTrivia));
    });
  }

}
