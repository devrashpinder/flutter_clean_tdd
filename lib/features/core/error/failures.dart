import 'package:equatable/equatable.dart';
import 'package:flutter_clean_tdd/features/core/error/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class FailureUtils {
  FailureUtils._();
  static String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerException:
        return "Server Failure";
      case CacheException:
        return "Cache Failure";
      default:
        return "Unexpected Failure";
    }
  }
}
