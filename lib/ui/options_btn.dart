import 'package:flutter/material.dart';
import 'text_style.dart';
import 'colors.dart';


class OptionsBtn extends StatelessWidget{
  final String caption;
  final Function onTap;
  final Color color;

  OptionsBtn({
    @required this.caption,
    @required this.onTap,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.green, width: 2.0),
          borderRadius: BorderRadius.circular(45.0),
          color: color
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            caption,
            style: color == Colors.transparent ? AppTextStyle.options : AppTextStyle.optionsWhite
          ),
        ),
      ),
    );
  }
}