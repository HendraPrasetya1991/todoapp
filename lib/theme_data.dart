import 'package:flutter/material.dart';

import 'constants/colors.dart';

final themeData = ThemeData(
  scaffoldBackgroundColor: kBackGroundColor,
  textTheme: ThemeData.dark().textTheme.copyWith(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
