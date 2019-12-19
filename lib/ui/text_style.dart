import 'package:flutter/material.dart';
import 'colors.dart';


class AppTextStyle{
  static TextStyle get intro1 => TextStyle(color: AppColor.blue, fontSize: 70.0, fontFamily: 'Impact', fontStyle: FontStyle.italic);
  static TextStyle get intro1White => TextStyle(color: AppColor.blue, fontSize: 30.0, fontFamily: 'Impact', fontStyle: FontStyle.italic, shadows: [Shadow(color: Colors.white, blurRadius: 4.0)]);
  static TextStyle get intro2 => TextStyle(color: Colors.white, fontSize: 34.0, fontFamily: 'Roboto-Regular');
  static TextStyle get header => TextStyle(color: AppColor.blue, fontSize: 24.0, fontFamily: 'Roboto-Black');
  static TextStyle get title => TextStyle(color: AppColor.blue, fontSize: 20.0, fontFamily: 'Roboto-Regular');
  static TextStyle get options => TextStyle(color: AppColor.blue, fontSize: 12.0, fontFamily: 'Roboto-Regular');
  static TextStyle get optionsWhite => TextStyle(color: Colors.white, fontSize: 12.0, fontFamily: 'Roboto-Regular');
  static TextStyle get items => TextStyle(color: AppColor.blue, fontSize: 14.0, fontFamily: 'Roboto-Regular');
  static TextStyle get text => TextStyle(color: AppColor.blue, fontSize: 16.0, fontFamily: 'Roboto-Regular');
  static TextStyle get textBold => TextStyle(color: AppColor.blue, fontSize: 16.0, fontFamily: 'Roboto-Bold');
  static TextStyle get textBlack => TextStyle(color: AppColor.blue, fontSize: 16.0, fontFamily: 'Roboto-Black');
  static TextStyle get textBig => TextStyle(color: AppColor.blue, fontSize: 18.0, fontFamily: 'Roboto-Regular');
  static TextStyle get textBigBold => TextStyle(color: AppColor.blue, fontSize: 18.0, fontFamily: 'Roboto-Bold');
  static TextStyle get hover => TextStyle(color: AppColor.green, fontSize: 16.0, fontFamily: 'Roboto-Regular');
  static TextStyle get hoverBig => TextStyle(color: AppColor.green, fontSize: 18.0, fontFamily: 'Roboto-Regular');
}