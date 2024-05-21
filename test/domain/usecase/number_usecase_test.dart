import 'package:flutter_facts_numbers/common/enums/number_type_enum.dart';
import 'package:flutter_facts_numbers/domain/entities/number_entity.dart';
import 'package:flutter_facts_numbers/domain/repositories/number_repository.dart';
import 'package:flutter_facts_numbers/domain/usecases/number_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'number_usecase_test.mocks.dart';

@GenerateMocks([NumberRepository])
void main() {
  //mock data
  const NumberEntity mockNumberLocalData = NumberEntity(
    number: 1,
    text: 'test',
  );
  //mock functions
  final MockNumberRepository numberRepository = MockNumberRepository();
  //function under test
  final NumberUsecase numberUsecase = NumberUsecase(
    numberRepository: numberRepository,
  );

  test(
    'should get the number entity from the repository',
    () async {
      // arrange
      when(numberRepository.getNumber(NumberType.date, 1))
          .thenAnswer((_) async => mockNumberLocalData);
      // act
      final result = await numberUsecase.getNumber(NumberType.date, 1);
      // assert
      expect(result, isA<NumberEntity>());
      verify(numberRepository.getNumber(NumberType.date, 1)).called(1);
    },
  );

  test(
    'should get the random number entity from the repository',
    () async {
      // arrange
      when(numberRepository.getRandomNumber(NumberType.date))
          .thenAnswer((_) async => mockNumberLocalData);
      // act
      final result = await numberUsecase.getRandomNumber(NumberType.date);
      // assert
      expect(result, isA<NumberEntity>());
      verify(numberRepository.getRandomNumber(NumberType.date)).called(1);
    },
  );
}
