import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import '../../data/datasources/local/number_local.dart';
import '../../data/datasources/remote/number_remote.dart';
import '../../data/reponsitories/number_repository_impl.dart';
import '../../domain/repositories/number_repository.dart';
import '../../domain/usecases/number_usecase.dart';
import '../../presentation/journeys/home/blocs/cubit/home_cubit.dart';
import '../configs/hive_config/hive_config.dart';
import '../untils/internet_checker.dart';

class Injector {
  static final GetIt getIt = GetIt.instance;

  static void configDependency() {
    //bloc
    getIt.registerFactory<HomeCubit>(
      () => HomeCubit(numberUsecase: getIt.get<NumberUsecase>()),
    );
    //usecase
    getIt.registerFactory(
      () => NumberUsecase(numberRepository: getIt.get<NumberRepository>()),
    );

    //repository
    getIt.registerFactory<NumberRepository>(() => NumberRepositoryImpl(
          numberLocal: getIt.get<NumberLocal>(),
          numberRemote: getIt.get<NumberRemote>(),
          internetChecker: getIt.get<InternetChecker>(),
          hiveConfig: getIt.get<HiveConfig>(),
        ));
    //datasources
    getIt.registerFactory<NumberLocal>(() => NumberLocalImpl(
          rd: getIt.get<Random>(),
          hiveConfig: getIt.get<HiveConfig>(),
        ));
    getIt.registerFactory<NumberRemote>(
        () => NumberRemoteImpl(getIt.get<Client>()));
    //common
    getIt.registerLazySingleton(
      () => HiveConfig(hive: getIt.get<HiveInterface>()),
    );
    getIt.registerLazySingleton(
        () => InternetChecker(connectivity: getIt.get<Connectivity>()));
    getIt.registerLazySingleton(() => Hive);
    getIt.registerLazySingleton(() => Connectivity());
    getIt.registerLazySingleton(() => Random());
    getIt.registerLazySingleton(() => Client());
  }
}
