
import 'package:flutter_clean_tdd/features/core/platforms/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {}
void main() {
    late final mockConnectionChecker = MockInternetConnectionChecker();
    late final networkInfo = NetworkInfoImpl(mockConnectionChecker);

    group('isConnected', (){
        test('should foreward the call to InternetConnectionChecker.hasConnection', (){
          final tHasConnection = Future.value(true);
          when(() => mockConnectionChecker.hasConnection).thenAnswer((_) => tHasConnection);

          final result = networkInfo.isConnected;
          verify((() => mockConnectionChecker.hasConnection));
          expect(result, tHasConnection);
        });
    });
}