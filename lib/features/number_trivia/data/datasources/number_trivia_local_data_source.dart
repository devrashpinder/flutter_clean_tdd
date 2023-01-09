import 'dart:convert';

import 'package:flutter_clean_tdd/features/core/error/exceptions.dart';
import 'package:flutter_clean_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_clean_tdd/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NumberTriviaLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  void cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  const NumberTriviaLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  @override
  void cacheNumberTrivia(NumberTriviaModel triviaToCache)  async{
    final triviaString = json.encode(triviaToCache.toJson()).toString();
    try {
     await sharedPreferences.setString(
        AppConstants.cachedNumberTrivia, triviaString);
    }catch(e){
      
    }
    
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final triviaJson =
        sharedPreferences.getString(AppConstants.cachedNumberTrivia);
    if (triviaJson != null) {
      return Future.value(NumberTriviaModel.fromJson(json.decode(triviaJson)));
    }
    throw CacheException();
  }
}
