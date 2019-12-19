import 'package:flutter/material.dart';
import 'text_style.dart';


class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          Text(
            'Заказы',
            style: AppTextStyle.header,
          ),
        ],
      ),
    );
  }
}