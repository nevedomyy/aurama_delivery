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
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: color,
          boxShadow: [
            BoxShadow(offset: Offset(2.0, 4.0), blurRadius: 6.0, color: AppColor.shadow)
          ]
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            caption,
            style: color == Colors.white ? AppTextStyle.options : AppTextStyle.optionsWhite
          ),
        ),
      ),
    );
  }
}