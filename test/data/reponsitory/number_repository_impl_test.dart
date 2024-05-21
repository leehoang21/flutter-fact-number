import 'package:flutter_facts_numbers/common/configs/hive_config/hive_config.dart';
import 'package:flutter_facts_numbers/common/enums/number_type_enum.dart';
import 'package:flutter_facts_numbers/common/untils/internet_checker.dart';
import 'package:flutter_facts_numbers/data/datasources/local/number_local.dart';
import 'package:flutter_facts_numbers/data/datasources/remote/number_remote.dart';
import 'package:flutter_facts_numbers/data/models/number_model.dart';
import 'package:flutter_facts_numbers/data/reponsitories/number_repository_impl.dart';
import 'package:flutter_facts_numbers/domain/entities/number_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'number_repository_impl_test.mocks.dart';

@GenerateMocks([InternetChecker, NumberLocal, NumberRemote, HiveConfig, Box])
void main() {
  //mock data
  const NumberModel mockNumberLocalData = NumberModel(
    number: 1,
    text: 'test',
  );
  //mock functions
  final MockInternetChecker internetChecker = MockInternetChecker();
  final MockNumberLocal numberLocal = MockNumberLocal();
  final MockNumberRemote numberRemote = MockNumberRemote();
  final MockHiveConfig hiveConfig = MockHiveConfig();
  final MockBox<String> box = MockBox();
  //functions under test
  final NumberRepositoryImpl numberRepositoryIpmpl = NumberRepositoryImpl(
    internetChecker: internetChecker,
    numberLocal: numberLocal,
    numberRemote: numberRemote,
    hiveConfig: hiveConfig,
  );

  group('test getNumber()', () {
    test('is Internet connected', () async {
      //arrange
      when(internetChecker.hasConnection()).thenAnswer((_) async => true);
      when(numberRemote.getNumber('date', 1))
          .thenAnswer((_) async => mockNumberLocalData);
      when(hiveConfig.dateBox).thenReturn(box);

      //act
      final NumberEntity result =
          await numberRepositoryIpmpl.getNumber(NumberType.date, 1);
      //assert
      expect(
        result,
        isA<NumberEntity>(),
      );
      verify(numberLocal.writeNumber(box, mockNumberLocalData)).called(1);
      verify(numberRemote.getNumber('date', 1)).called(1);
      verify(hiveConfig.dateBox).called(1);
      verify(internetChecker.hasConnection()).called(1);
    });

    test('is not Internet connected', () async {
      //arrange
      when(internetChecker.hasConnection()).thenAnswer((_) async => false);
      when(hiveConfig.dateBox).thenReturn(box);
      when(numberLocal.readNumber(box, 1)).thenReturn(mockNumberLocalData);
      //act
      final NumberEntity result =
          await numberRepositoryIpmpl.getNumber(NumberType.date, 1);
      //assert
      expect(
        result,
        isA<NumberEntity>(),
      );
      verify(numberLocal.readNumber(box, 1)).called(1);
      verify(hiveConfig.dateBox).called(1);
      verify(internetChecker.hasConnection()).called(1);
    });
  });

  group('test getRandomNumber()', () {
    test('is Internet connected', () async {
      //arrange
      when(internetChecker.hasConnection()).thenAnswer((_) async => true);
      when(numberRemote.getRandomNumber('date'))
          .thenAnswer((_) async => mockNumberLocalData);
      when(hiveConfig.dateBox).thenReturn(box);
      //act
      final NumberEntity result =
          await numberRepositoryIpmpl.getRandomNumber(NumberType.date);
      //assert
      expect(
        result,
        isA<NumberEntity>(),
      );
      verify(numberLocal.writeNumber(box, mockNumberLocalData)).called(1);
      verify(numberRemote.getRandomNumber('date')).called(1);
      verify(hiveConfig.dateBox).called(1);
      verify(internetChecker.hasConnection()).called(1);
    });

    test('is not Internet connected', () async {
      //arrange
      when(internetChecker.hasConnection()).thenAnswer((_) async => false);
      when(hiveConfig.dateBox).thenReturn(box);
      when(numberLocal.readRandomNumber(box)).thenReturn(mockNumberLocalData);
      //act
      final NumberEntity result =
          await numberRepositoryIpmpl.getRandomNumber(NumberType.date);
      //assert
      expect(
        result,
        isA<NumberEntity>(),
      );
      verify(numberLocal.readRandomNumber(box)).called(1);
      verify(hiveConfig.dateBox).called(1);
      verify(internetChecker.hasConnection()).called(1);
    });
  });
}
