

import 'package:flutter_clean_tdd/features/core/platforms/network_info.dart';
import 'package:flutter_clean_tdd/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_clean_tdd/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_clean_tdd/features/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_tdd/features/number_trivia/domain/repositories/number_trivia_repo.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaLocalDataSource localDataSource;
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const NumberTriviaRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, NumberTrivia>?> getConcreteNumberTrivia(int? number) {
    // TODO: implement getConcreteNumberTrivia
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>?> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }

}