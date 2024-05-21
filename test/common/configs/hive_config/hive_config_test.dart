import 'package:flutter_facts_numbers/common/configs/hive_config/hive_box_name.dart';
import 'package:flutter_facts_numbers/common/configs/hive_config/hive_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'hive_config_test.mocks.dart';

@GenerateMocks([Box, HiveInterface])
void main() {
  //mock functions
  final MockHiveInterface hive = MockHiveInterface();
  final MockBox<String> box = MockBox();
  //functions under test
  final HiveConfig hiveConfig = HiveConfig(hive: hive);
  test('init hive config success', () async {
    //arrange
    when(hive.openBox(HiveBoxName.dateBox)).thenAnswer((_) async => box);
    when(hive.openBox(HiveBoxName.triviaBox)).thenAnswer((_) async => box);
    when(hive.openBox(HiveBoxName.mathBox)).thenAnswer((_) async => box);
    when(hive.openBox(HiveBoxName.yearBox)).thenAnswer((_) async => box);
    //act
    await hiveConfig.init();
    //assert
    expect(hiveConfig.dateBox, isA<Box<String>>());
    expect(hiveConfig.triviaBox, isA<Box<String>>());
    expect(hiveConfig.yearBox, isA<Box<String>>());
    expect(hiveConfig.mathBox, isA<Box<String>>());
    verifyInOrder([
      hive.openBox(HiveBoxName.dateBox),
      hive.openBox(HiveBoxName.triviaBox),
      hive.openBox(HiveBoxName.mathBox),
      hive.openBox(HiveBoxName.yearBox),
    ]);
  });
}
