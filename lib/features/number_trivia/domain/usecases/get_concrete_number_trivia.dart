import 'package:dartz/dartz.dart';
import 'package:flutter_clean_tdd/features/core/error/failures.dart';
import 'package:flutter_clean_tdd/features/core/usecase/usecase.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/repositories/number_trivia_repo.dart';

/// The Get Concrete Number Usecase to Fetch Trivia Number
///
/// [Params]
///

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  const GetConcreteNumberTrivia(this.repo);
  
  final NumberTriviaRepository repo;

  @override
  Future<Either<Failure, NumberTrivia>?> call(Params params) async {
    return await repo.getConcreteNumberTrivia(params.number);
  }

}
