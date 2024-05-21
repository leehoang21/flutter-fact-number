import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/strings/string_constants.dart';
import '../../../common/enums/number_type_enum.dart';
import '../../themes/theme_color.dart';
import '../../widgets/text_button_widget.dart';
import 'blocs/cubit/home_cubit.dart';
import 'widget/display_fact_number.dart';
import 'widget/text_field_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key, required this.numberType}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final NumberType? numberType;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(numberType!.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DisplayFactNumber(),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: TextFieldWidget(
                  controller: controller,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButtonWidget(
                    onPressed: () {
                      context.read<HomeCubit>().getFactNumbers(
                            numberType!,
                            int.parse(controller.text),
                          );
                    },
                    title: StringConstants.search,
                    color: AppColor.indigoAccent,
                  ),
                  TextButtonWidget(
                    onPressed: () {
                      context
                          .read<HomeCubit>()
                          .getRandomFactNumbers(numberType!);
                    },
                    title: StringConstants.random,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
