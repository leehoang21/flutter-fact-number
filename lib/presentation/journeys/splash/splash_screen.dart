import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../common/constants/layout_constants.dart';
import '../../../common/constants/route_list.dart';
import '../../../common/constants/strings/string_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacementNamed(RouteList.selectScreen);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                StringConstants.appTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Text(
              StringConstants.subTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: LayoutConstants.paddingVertical58,
            ),
          ],
        ),
      ),
    );
  }
}
