import 'package:flutter_facts_numbers/data/models/number_model.dart';
import 'package:flutter_facts_numbers/domain/entities/number_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //mock data
  const NumberModel mockNumberModelData = NumberModel(
    number: 1,
    text: 'test',
  );
  const Map<String, dynamic> mockJsonData = {
    'number': 1,
    'text': 'test',
  };

  test('number Model is subclass of Number entity', () {
    //assert
    expect(
      mockNumberModelData,
      isA<NumberEntity>(),
    );
  });

  test('fromJson return a valid model', () {
    //act
    final NumberModel result = NumberModel.fromJson(mockJsonData);
    //assert
    expect(
      result,
      mockNumberModelData,
    );
  });
}
