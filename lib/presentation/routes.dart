import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/constants/route_list.dart';
import '../common/enums/number_type_enum.dart';
import '../common/injector/injector.dart';
import 'journeys/empty_screen/empty_screen.dart';
import 'journeys/home/blocs/cubit/home_cubit.dart';
import 'journeys/home/home_screen.dart';
import 'journeys/select_screen/select_screen.dart';
import 'journeys/splash/splash_screen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final NumberType? numberType = settings.arguments as NumberType?;

    switch (settings.name) {
      case RouteList.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RouteList.selectScreen:
        return MaterialPageRoute(
          builder: (_) => const SelectScreen(),
        );
      case RouteList.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Injector.getIt.get<HomeCubit>(),
            child: Home(numberType: numberType),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => EmptyScreen(routesName: settings.name),
        );
    }
  }
}
