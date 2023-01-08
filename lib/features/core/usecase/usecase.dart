import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_tdd/features/core/error/failures.dart';

/// The generic abstract Use case which accept
///
/// input as Parameters [Params]
///
/// output as Model [Type]
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>?> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class Params extends Equatable {
  const Params(this.number);

  final int number;
  @override
  List<Object?> get props => [number];
}
