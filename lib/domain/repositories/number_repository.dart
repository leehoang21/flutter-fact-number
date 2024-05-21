import '../../common/enums/number_type_enum.dart';
import '../entities/number_entity.dart';

abstract class NumberRepository {
  Future<NumberEntity> getNumber(NumberType type, int number);
  Future<NumberEntity> getRandomNumber(NumberType type);
}
