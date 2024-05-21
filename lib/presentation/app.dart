import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/constants/layout_constants.dart';
import '../common/constants/route_list.dart';
import '../common/constants/strings/string_constants.dart';
import 'routes.dart';
import 'themes/theme_data.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        LayoutConstants.widthDefault,
        LayoutConstants.heightDefault,
      ),
      builder: (_) => MaterialApp(
        theme: appTheme(),
        darkTheme: appThemeDark(),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteList.splashScreen,
        onGenerateRoute: Routes.generateRoute,
        title: StringConstants.appTitle,
      ),
    );
  }
}
