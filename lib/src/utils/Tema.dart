import 'package:flutter/material.dart';

class TemaSwitch with ChangeNotifier {
  ThemeData _tema;

  TemaSwitch(this._tema);

  getTema() => _tema;

  setTema(ThemeData tema) {
    this._tema = tema;
    notifyListeners();
  }
}

final miTemaObscuro = ThemeData(
    dialogBackgroundColor: Colors.white,
    indicatorColor: Color.fromRGBO(1, 10, 1, 0.8),
    canvasColor: Colors.black,
    brightness: Brightness.dark,
    buttonTheme: ButtonThemeData(minWidth: 10),
    fontFamily: 'Futura',
    primaryColor: Color(0xff000000),
    dividerColor: Color(0xff0077C8),
    cardColor: Color(0xff000000),
    applyElevationOverlayColor: true,
    cardTheme: CardTheme(shape: Border.all(color: Color(0xff000000), width: 5)),
    backgroundColor: Colors.black,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Color(0xff0077C8),
        backgroundColor: Color(0xff000000),
        elevation: 10),
    accentColor: Color(0xffFFFFFF),
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
    textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: Color(0xff0077C8).withOpacity(0.2)));

final miTema = ThemeData(
    dialogBackgroundColor: Colors.white,
    indicatorColor: Color.fromRGBO(229, 241, 249, 0.8),
    brightness: Brightness.light,
    buttonTheme: ButtonThemeData(minWidth: 10),
    fontFamily: 'Futura',
    primaryColor: Color(0xff0077C8),
    dividerColor: Color(0xff0077C8),
    cardColor: Color(0xffFFFFFF),
    backgroundColor: Colors.white,
    accentColor: Color(0xff003C71),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff0077C8),
        elevation: 10),
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black45)));
