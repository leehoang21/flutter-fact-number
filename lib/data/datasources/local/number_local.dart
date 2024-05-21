import 'dart:math';

import 'package:hive_flutter/adapters.dart';

import '../../../common/configs/hive_config/hive_config.dart';
import '../../../common/exception/exception.dart';
import '../../models/number_model.dart';

abstract class NumberLocal {
  NumberModel readNumber(Box<String> box, int number);
  NumberModel readRandomNumber(Box<String> box);
  void writeNumber(Box<String> box, NumberModel numberModel);
}

class NumberLocalImpl extends NumberLocal {
  NumberLocalImpl({required this.rd, required this.hiveConfig});

  final Random rd;
  final HiveConfig hiveConfig;

  @override
  NumberModel readNumber(Box<String> box, int number) {
    final String? text = box.get(number);
    if (text == null) {
      throw CacheException();
    }
    return NumberModel(number: number, text: text);
  }

  @override
  NumberModel readRandomNumber(Box<String> box) {
    final int number = box.keyAt(rd.nextInt(box.length)) as int;
    try {
      return readNumber(box, number);
    } catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<void> writeNumber(Box<String> box, NumberModel numberModel) async {
    await box.put(numberModel.number, numberModel.text);
  }
}
