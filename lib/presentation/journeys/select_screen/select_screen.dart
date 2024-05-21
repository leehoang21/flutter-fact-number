import 'package:flutter/material.dart';
import '../../../common/constants/route_list.dart';
import '../../../common/constants/strings/string_constants.dart';
import '../../../common/enums/number_type_enum.dart';
import '../../widgets/text_button_widget.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringConstants.titleSelectScreen),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButtonWidget(
              onPressed: () {
                Navigator.pushNamed(context, RouteList.homeScreen,
                    arguments: NumberType.trivia);
              },
              title: NumberType.trivia.name,
            ),
            TextButtonWidget(
              onPressed: () {
                Navigator.pushNamed(context, RouteList.homeScreen,
                    arguments: NumberType.date);
              },
              title: NumberType.date.name,
            ),
            TextButtonWidget(
              onPressed: () {
                Navigator.pushNamed(context, RouteList.homeScreen,
                    arguments: NumberType.year);
              },
              title: NumberType.year.name,
            ),
            TextButtonWidget(
              onPressed: () {
                Navigator.pushNamed(context, RouteList.homeScreen,
                    arguments: NumberType.math);
              },
              title: NumberType.math.name,
            ),
          ],
        ),
      ),
    );
  }
}
