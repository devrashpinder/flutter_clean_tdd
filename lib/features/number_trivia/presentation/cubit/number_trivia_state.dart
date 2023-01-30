
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaState extends Equatable {}

class NumberTriviaLoadingState extends NumberTriviaState {
  @override
  List<Object?> get props => [];

}
class NumberTriviaEmptyState extends NumberTriviaState {
  @override
  List<Object?> get props => [];
}
class NumberTriviaSucessState extends NumberTriviaState {
  
  NumberTriviaSucessState(this.trivia);

  final NumberTrivia trivia;
  
  @override
  List<Object?> get props => [trivia];
}
class NumberTriviaErrorState extends NumberTriviaState {
  
  NumberTriviaErrorState(this.message);

  final String message;
  
  @override
  List<Object?> get props => [message];
}