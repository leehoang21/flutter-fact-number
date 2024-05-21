import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_facts_numbers/common/enums/number_type_enum.dart';
import 'package:flutter_facts_numbers/common/exception/exception.dart';
import 'package:flutter_facts_numbers/domain/entities/number_entity.dart';
import 'package:flutter_facts_numbers/domain/usecases/number_usecase.dart';
import 'package:flutter_facts_numbers/presentation/journeys/home/blocs/cubit/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([NumberUsecase])
void main() {
  //mock data
  const NumberEntity mockNumberEntityData = NumberEntity(
    number: 1,
    text: 'test',
  );
  //mock functions
  final MockNumberUsecase numberUsecase = MockNumberUsecase();
  late HomeCubit homeCubit;

  group('getFactNumbers', () {
    setUp(() {
      homeCubit = HomeCubit(numberUsecase: numberUsecase);
    });

    blocTest<HomeCubit, HomeState>(
      'emit [ HomeLoading , HomeLoaded ] when getNumber() return numberEntity',
      build: () {
        when(numberUsecase.getNumber(NumberType.date, 1))
            .thenAnswer((_) async => mockNumberEntityData);
        return homeCubit;
      },
      act: (bloc) async {
        await bloc.getFactNumbers(NumberType.date, 1);
      },
      verify: (bloc) {
        verify(numberUsecase.getNumber(NumberType.date, 1)).called(1);
      },
      expect: () => [
        HomeLoading(),
        const HomeLoaded(factNumbers: mockNumberEntityData),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emit [ HomeLoading , HomeLoadedError ] when getNumber() throw exception',
      build: () {
        when(numberUsecase.getNumber(NumberType.date, 1))
            .thenThrow(ServerException());
        return homeCubit;
      },
      act: (bloc) async {
        await bloc.getFactNumbers(NumberType.date, 1);
      },
      expect: () => [
        HomeLoading(),
        isA<HomeLoadedError>(),
      ],
      verify: (bloc) {
        verify(numberUsecase.getNumber(NumberType.date, 1)).called(1);
      },
    );
  });

  group('getRandomFactNumbers', () {
    setUp(() {
      homeCubit = HomeCubit(numberUsecase: numberUsecase);
    });

    blocTest<HomeCubit, HomeState>(
      'emit [ HomeLoading , HomeLoaded ] when getNumber() return numberEntity',
      build: () {
        when(numberUsecase.getRandomNumber(NumberType.date))
            .thenAnswer((_) async => mockNumberEntityData);
        return homeCubit;
      },
      act: (bloc) async {
        await bloc.getRandomFactNumbers(NumberType.date);
      },
      verify: (bloc) {
        verify(numberUsecase.getRandomNumber(NumberType.date)).called(1);
      },
      expect: () => [
        HomeLoading(),
        const HomeLoaded(factNumbers: mockNumberEntityData),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emit [ HomeLoading , HomeLoadedError ] when getNumber() throw exception',
      build: () {
        when(numberUsecase.getRandomNumber(NumberType.date))
            .thenThrow(ServerException());
        return homeCubit;
      },
      act: (bloc) async {
        await bloc.getRandomFactNumbers(NumberType.date);
      },
      expect: () => [
        HomeLoading(),
        isA<HomeLoadedError>(),
      ],
      verify: (bloc) {
        verify(numberUsecase.getRandomNumber(NumberType.date)).called(1);
      },
    );
  });
}
