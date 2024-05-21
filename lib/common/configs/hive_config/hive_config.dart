import 'package:hive_flutter/hive_flutter.dart';

import 'hive_box_name.dart';

class HiveConfig {
  HiveConfig({required this.hive});

  late Box<String> dateBox;
  late Box<String> triviaBox;
  late Box<String> mathBox;
  late Box<String> yearBox;

  final HiveInterface hive;

  Future<void> init() async {
    await hive.initFlutter();
    await openBox();
  }

  Future<void> openBox() async {
    dateBox = await hive.openBox(HiveBoxName.dateBox);
    triviaBox = await hive.openBox(HiveBoxName.triviaBox);
    mathBox = await hive.openBox(HiveBoxName.mathBox);
    yearBox = await hive.openBox(HiveBoxName.yearBox);
  }
}
