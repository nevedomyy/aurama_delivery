import 'package:flutter/material.dart';
import 'colors.dart';


class NewOrderDecoration extends StatelessWidget{
  final List<Widget> children;

  NewOrderDecoration({@required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(offset: Offset(2.0, 4.0), blurRadius: 10.0, color: AppColor.shadow)
          ]           
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}