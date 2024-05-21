part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  const HomeLoaded({required this.factNumbers});

  final NumberEntity factNumbers;
}

class HomeLoadedError extends HomeState {
  const HomeLoadedError({required this.error});

  final String error;
}
