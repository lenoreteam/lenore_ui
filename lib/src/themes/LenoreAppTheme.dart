import 'package:flutter/material.dart';

class LenoreAppTheme {
  final bool isDark;

  LenoreAppTheme({required this.isDark});

  ThemeData get themeData {
    return isDark
        ? ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.purple,
            primarySwatch: Colors.purple,
            shadowColor: Colors.black26,
            fontFamily: 'Roboto',
            backgroundColor: Color(0xFF424242),
            scaffoldBackgroundColor: Color(0xFF424242),
            bottomAppBarColor: Color(0xFF616161),
            textTheme: TextTheme(
              headline1: TextStyle(),
              headline2: TextStyle(),
              headline3: TextStyle(),
              headline4: TextStyle(),
              headline5: TextStyle(),
              headline6: TextStyle(),
              subtitle1: TextStyle(),
              subtitle2: TextStyle(),
              bodyText1: TextStyle(),
              bodyText2: TextStyle(),
              button: TextStyle(
                color: Colors.blue,
              ),
              caption: TextStyle(),
              overline: TextStyle(),
            ),
          )
        : ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.deepPurple,
            primarySwatch: Colors.deepPurple,
            shadowColor: Colors.black26,
            fontFamily: 'Roboto',
            backgroundColor: Color(0xFFfbfbfb),
            scaffoldBackgroundColor: Color(0xFFfbfbfb),
            bottomAppBarColor: Color(0xFFF5F5F5),
            textTheme: TextTheme(
              headline1: TextStyle(),
              headline2: TextStyle(),
              headline3: TextStyle(),
              headline4: TextStyle(),
              headline5: TextStyle(),
              headline6: TextStyle(),
              subtitle1: TextStyle(),
              subtitle2: TextStyle(),
              bodyText1: TextStyle(),
              bodyText2: TextStyle(),
              button: TextStyle(
                color: Colors.blue,
              ),
              caption: TextStyle(),
              overline: TextStyle(),
            ),
          );
  }
}
