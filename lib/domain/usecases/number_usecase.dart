import '../../common/enums/number_type_enum.dart';
import '../entities/number_entity.dart';
import '../repositories/number_repository.dart';

class NumberUsecase {
  NumberUsecase({required this.numberRepository});
  final NumberRepository numberRepository;

  Future<NumberEntity> getNumber(NumberType type, int number) async {
    return numberRepository.getNumber(type, number);
  }

  Future<NumberEntity> getRandomNumber(NumberType type) async {
    return numberRepository.getRandomNumber(type);
  }
}
