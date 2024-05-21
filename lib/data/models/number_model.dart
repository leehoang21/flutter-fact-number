import '../../domain/entities/number_entity.dart';

class NumberModel extends NumberEntity {
  const NumberModel({required int number, required String text})
      : super(number: number, text: text);

  factory NumberModel.fromJson(Map<String, dynamic> json) {
    return NumberModel(
      number: json['number'] as int,
      text: json['text'] as String,
    );
  }
}
