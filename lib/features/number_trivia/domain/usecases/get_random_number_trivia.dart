import 'package:dartz/dartz.dart';
import 'package:flutter_clean_tdd/features/core/error/failures.dart';
import 'package:flutter_clean_tdd/features/core/usecase/usecase.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/repositories/number_trivia_repo.dart';

/// The Get Random Number Usecase to Fetch Trivia Number
///
///

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  const GetRandomNumberTrivia(this.repo);

  final NumberTriviaRepository repo;

  @override
  Future<Either<Failure, NumberTrivia>?> call(NoParams params) async {
    return await repo.getRandomNumberTrivia();
  }
}
