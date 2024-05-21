import 'package:hive_flutter/adapters.dart';
import '../../common/configs/hive_config/hive_config.dart';
import '../../common/enums/number_type_enum.dart';
import '../../common/untils/internet_checker.dart';
import '../../domain/entities/number_entity.dart';
import '../../domain/repositories/number_repository.dart';
import '../datasources/local/number_local.dart';
import '../datasources/remote/number_remote.dart';
import '../models/number_model.dart';

class NumberRepositoryImpl extends NumberRepository {
  NumberRepositoryImpl({
    required this.numberLocal,
    required this.numberRemote,
    required this.internetChecker,
    required this.hiveConfig,
  });

  final InternetChecker internetChecker;
  final NumberLocal numberLocal;
  final NumberRemote numberRemote;
  final HiveConfig hiveConfig;

  @override
  Future<NumberEntity> getNumber(NumberType type, int number) async {
    return _get(type, number);
  }

  @override
  Future<NumberEntity> getRandomNumber(NumberType type) {
    return _get(type);
  }

  Future<NumberEntity> _get(NumberType type, [int? number]) async {
    if (await internetChecker.hasConnection()) {
      final NumberModel numberModel;

      if (number == null) {
        numberModel = await numberRemote.getRandomNumber(type.name);
      } else {
        numberModel = await numberRemote.getNumber(type.name, number);
      }

      numberLocal.writeNumber(_box(type), numberModel);

      return numberModel;
    } else {
      if (number == null) {
        return numberLocal.readRandomNumber(_box(type));
      } else {
        return numberLocal.readNumber(_box(type), number);
      }
    }
  }

  Box<String> _box(NumberType type) {
    switch (type) {
      case NumberType.date:
        return hiveConfig.dateBox;
      case NumberType.math:
        return hiveConfig.mathBox;
      case NumberType.trivia:
        return hiveConfig.triviaBox;
      case NumberType.year:
        return hiveConfig.yearBox;
    }
  }
}
