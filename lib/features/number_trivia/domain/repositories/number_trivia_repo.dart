import 'package:dartz/dartz.dart';
import 'package:flutter_clean_tdd/features/core/error/failures.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/entities/number_trivia.dart';

/// The Abstract Respository to Fetch
///
/// [getConcreteNumberTrivia]
///
/// [getRandomNumberTrivia]
abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>?> getConcreteNumberTrivia(int? number);
 Future<Either<Failure, NumberTrivia>?> getRandomNumberTrivia();
}
