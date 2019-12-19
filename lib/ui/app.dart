import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'colors.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: AppColor.green,
      ),
      home: MenuPage(),
    );
  }
}