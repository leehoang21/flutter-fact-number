import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_facts_numbers/common/untils/internet_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'internet_checker_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  //mock functions
  final MockConnectivity connectivity = MockConnectivity();
  //functions under test
  final InternetChecker internetChecker =
      InternetChecker(connectivity: connectivity);

  test('return true when has connection', () async {
    //arrange
    when(connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.mobile);
    //act
    final bool result = await internetChecker.hasConnection();
    //assert
    expect(result, true);
    verify(connectivity.checkConnectivity()).called(1);
  });

  test('return false when no connection', () async {
    //arrange
    when(connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.none);
    //act
    final bool result = await internetChecker.hasConnection();
    //assert
    expect(result, false);
    verify(connectivity.checkConnectivity()).called(1);
  });
}
