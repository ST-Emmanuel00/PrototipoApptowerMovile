import 'package:flutter/material.dart';

class AppTheme {
  static const inputPading = EdgeInsets.fromLTRB(20, 30, 20, 0);
  static const selectPading = EdgeInsets.fromLTRB(35, 30, 35, 0);

  static const textStyle = TextStyle(
      color: Color.fromRGBO(0, 26, 78, 1), fontWeight: FontWeight.bold);

  static const estadoColorRed = TextStyle(color: Colors.red);

  static const colorGrey = Colors.grey;

  static const estadoColorGreen = TextStyle(color: Colors.green);

  static const textColorCard = Color.fromRGBO(27, 104, 255, 1);
  static const textCard = TextStyle(
      color: Color.fromRGBO(27, 104, 255, 1), fontWeight: FontWeight.bold);
  static const textCard1 = TextStyle(color: Color.fromRGBO(184, 197, 206, 1));
  static const textCar2 = TextStyle(
      color: Color.fromRGBO(27, 104, 255, 1), fontWeight: FontWeight.bold);

  static const ApptowerBlue = Color.fromRGBO(0, 26, 78, 1);
  static const ApptowerWhite = Color.fromRGBO(248, 249, 250, 1);

  static const bordeInicial =
      BorderSide(color: Color.fromRGBO(248, 249, 250, 1));
  static const bordeSelecionado =
      BorderSide(color: Color.fromRGBO(0, 26, 78, 1));
  static const bordeError = BorderSide(color: Colors.red);
}
