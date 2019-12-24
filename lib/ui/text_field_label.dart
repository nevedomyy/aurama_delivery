import 'package:flutter/material.dart';
import 'text_style.dart';
import 'colors.dart';


class AppTextFieldLabel extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType inputType;

  AppTextFieldLabel({
    @required this.labelText,
    @required this.controller,
    @required this.inputType
  });

  @override
  _AppTextFieldLabelState createState() => _AppTextFieldLabelState(labelText, controller, inputType);
}

class _AppTextFieldLabelState extends State<AppTextFieldLabel> {
  final TextEditingController controller;
  final String labelText;
  final TextInputType inputType;

  _AppTextFieldLabelState(this.labelText, this.controller, this.inputType);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      cursorColor: AppColor.greenDark,
      style: AppTextStyle.text,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyle.hover,
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(0)
      ),
    );
  }
}