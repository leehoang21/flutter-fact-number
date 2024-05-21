import 'package:equatable/equatable.dart';

class NumberEntity extends Equatable {
  const NumberEntity({required this.number, required this.text});

  final int number;
  final String text;

  @override
  List<Object> get props => <Object>[number, text];
}
