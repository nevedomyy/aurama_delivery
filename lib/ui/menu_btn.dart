import 'package:flutter/material.dart';


class MenuBtn extends StatelessWidget{
  final String caption;
  final Function onTap;
  final Color color;

  MenuBtn({
    @required this.caption,
    @required this.onTap,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: Text(
            caption,
            style: TextStyle(color: color, fontSize: 18.0, fontFamily: 'Oswald-Medium')
          ),
        ),
      ),
    );
  }
}