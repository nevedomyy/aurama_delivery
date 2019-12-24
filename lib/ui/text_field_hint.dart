import 'package:flutter/material.dart';
import 'text_style.dart';
import 'colors.dart';


class AppTextFieldHint extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;

  AppTextFieldHint({
    @required this.hintText,
    @required this.controller,
    @required this.inputType
  });

  @override
  _AppTextFieldHintState createState() => _AppTextFieldHintState(hintText, controller, inputType);
}

class _AppTextFieldHintState extends State<AppTextFieldHint> {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;

  _AppTextFieldHintState(this.hintText, this.controller, this.inputType);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        cursorColor: AppColor.greenDark,
        style: AppTextStyle.text,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: AppTextStyle.hover,
        ),
      ),
    );
  }
}