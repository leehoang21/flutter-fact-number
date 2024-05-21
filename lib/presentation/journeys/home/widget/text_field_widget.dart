import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/constants/layout_constants.dart';
import '../../../../common/constants/strings/string_constants.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        hintText: StringConstants.inputFormat,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        enabledBorder: boder(context),
        focusedBorder: boder(context),
        prefixIcon: const Icon(Icons.input),
        labelText: StringConstants.inputNumber,
        labelStyle: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  OutlineInputBorder boder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).textTheme.bodySmall!.color!,
        width: 5.sp,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(LayoutConstants.radius),
      ),
    );
  }
}
