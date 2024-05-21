import 'package:flutter/material.dart';
import 'common/configs/hive_config/hive_config.dart';
import 'common/injector/injector.dart';
import 'presentation/app.dart';

Future<void> main() async {
  Injector.configDependency();
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.getIt.get<HiveConfig>().init();
  runApp(const App());
}
