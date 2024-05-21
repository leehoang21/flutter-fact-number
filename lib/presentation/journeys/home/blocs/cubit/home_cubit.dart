import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../common/constants/failure_contant.dart';
import '../../../../../common/enums/number_type_enum.dart';
import '../../../../../common/exception/exception.dart';
import '../../../../../domain/entities/number_entity.dart';
import '../../../../../domain/usecases/number_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.numberUsecase}) : super(HomeInitial());
  final NumberUsecase numberUsecase;

  Future<void> getFactNumbers(NumberType numberType, int number) async {
    _get(numberType, number);
  }

  Future<void> getRandomFactNumbers(NumberType numberType) async {
    _get(numberType);
  }

  Future<void> _get(NumberType numberType, [int? number]) async {
    emit(HomeLoading());
    try {
      final NumberEntity factNumbers;
      if (number == null) {
        factNumbers = await numberUsecase.getRandomNumber(numberType);
      } else {
        factNumbers = await numberUsecase.getNumber(numberType, number);
      }
      emit(HomeLoaded(factNumbers: factNumbers));
    } on ServerException catch (_) {
      emit(const HomeLoadedError(error: Failure.serverFailure));
    } on CacheException catch (_) {
      emit(const HomeLoadedError(error: Failure.cacheFailure));
    }
  }
}
