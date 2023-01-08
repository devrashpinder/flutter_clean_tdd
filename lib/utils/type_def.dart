
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_tdd/features/core/error/failures.dart';

typedef RESPONSE<T> = Future<Either<Failure, T>>;