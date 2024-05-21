import 'dart:math';
import 'package:flutter_facts_numbers/common/configs/hive_config/hive_config.dart';
import 'package:flutter_facts_numbers/common/exception/exception.dart';
import 'package:flutter_facts_numbers/data/datasources/local/number_local.dart';
import 'package:flutter_facts_numbers/data/models/number_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'number_local_test.mocks.dart';

@GenerateMocks([Random, HiveConfig, Box])
void main() {
  //mock data
  const NumberModel mockNumberModelData = NumberModel(
    number: 42,
    text: 'The answer is 42.',
  );
  //mock functions
  final MockRandom rd = MockRandom();
  final MockHiveConfig hiveConfig = MockHiveConfig();
  final MockBox<String> box = MockBox();
  //functions under test
  final NumberLocalImpl numberLocal =
      NumberLocalImpl(rd: rd, hiveConfig: hiveConfig);

  group('test readNumber()', () {
    test('return NumberModel when get text success', () async {
      //arrange
      when(box.get(42)).thenAnswer((_) => 'The answer is 42.');
      //act
      final NumberModel result = numberLocal.readNumber(box, 42);
      //assert
      expect(
        result,
        isA<NumberModel>(),
      );
      verify(box.get(42)).called(1);
    });

    test('throw CacheException when get text fail', () async {
      //arrange
      when(box.get(42)).thenAnswer((_) => null);
      //act
      final Function call = numberLocal.readNumber;
      //assert
      expect(
        // ignore: avoid_dynamic_calls
        () => call(box, 42),
        throwsA(isA<CacheException>()),
      );

      verify(box.get(42)).called(1);
    });
  });

  group('test getRandomNumber()', () {
    test('return NumberModel when get key success', () async {
      //arrange
      when(box.get(42)).thenAnswer((_) => 'The answer is 42.');
      when(box.length).thenReturn(2);
      when(rd.nextInt(2)).thenAnswer((_) => 1);
      when(box.keyAt(1)).thenReturn(42);
      //act
      final NumberModel result = numberLocal.readRandomNumber(box);
      //assert
      expect(
        result,
        isA<NumberModel>(),
      );
      verify(box.get(42)).called(1);
      verify(box.length).called(1);
      verify(rd.nextInt(2)).called(1);
      verify(box.keyAt(1)).called(1);
    });

    test('throw CacheException when get key fail', () async {
      //arrange
      when(box.length).thenReturn(2);
      when(rd.nextInt(2)).thenAnswer((_) => 1);
      when(box.keyAt(1)).thenReturn(42);
      when(box.get(42)).thenAnswer((_) => null);
      //act
      final Function call = numberLocal.readRandomNumber;
      //assert
      expect(
        // ignore: avoid_dynamic_calls
        () => call(box),
        throwsA(isA<CacheException>()),
      );
      verify(box.length).called(1);
      verify(rd.nextInt(2)).called(1);
      verify(box.keyAt(1)).called(1);
    });
  });

  test('box.put() is called to cache data', () {
    numberLocal.writeNumber(box, mockNumberModelData);

    verify(box.put(42, 'The answer is 42.')).called(1);
  });
}
