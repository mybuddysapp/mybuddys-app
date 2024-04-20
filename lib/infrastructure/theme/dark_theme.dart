import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybuddys/infrastructure/theme/styles/color_styles.dart';

/* Dark Theme
|--------------------------------------------------------------------------
| Theme Config - config/theme.dart
|-------------------------------------------------------------------------- */

ThemeData darkTheme(ColorStyles color) {
  return ThemeData(
    useMaterial3: true,
    primaryColor: color.primaryContent,
    primaryColorDark: color.primaryContent,
    focusColor: color.primaryContent,
    scaffoldBackgroundColor: color.background,
    appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: color.appBarBackground,
        titleTextStyle: TextStyle(color: color.appBarPrimaryContent),
        iconTheme: IconThemeData(color: color.appBarPrimaryContent),
        elevation: 1.0,
        systemOverlayStyle: SystemUiOverlayStyle.light),
    buttonTheme: ButtonThemeData(
      buttonColor: color.primaryAccent,
      colorScheme: ColorScheme.light(primary: color.buttonBackground),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: color.primaryContent),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: color.buttonPrimaryContent,
          backgroundColor: color.buttonBackground),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: color.bottomTabBarBackground,
      unselectedIconTheme:
          IconThemeData(color: color.bottomTabBarIconUnselected),
      selectedIconTheme: IconThemeData(color: color.bottomTabBarIconSelected),
      unselectedLabelStyle: TextStyle(color: color.bottomTabBarLabelUnselected),
      selectedLabelStyle: TextStyle(color: color.bottomTabBarLabelSelected),
      selectedItemColor: color.bottomTabBarLabelSelected,
    ),
    textTheme: _textTheme(color),
    colorScheme: ColorScheme.dark(background: color.background),
  );
}

/*
|--------------------------------------------------------------------------
| Dark Text Theme
|--------------------------------------------------------------------------
*/

TextTheme _textTheme(ColorStyles colors) {
  Color primaryContent = colors.primaryContent;
  TextTheme textTheme = const TextTheme().apply(displayColor: primaryContent);
  return textTheme.copyWith(
      titleLarge: TextStyle(color: primaryContent.withOpacity(0.8)),
      labelLarge: TextStyle(color: primaryContent.withOpacity(0.8)),
      bodySmall: TextStyle(color: primaryContent.withOpacity(0.8)),
      bodyMedium: TextStyle(color: primaryContent.withOpacity(0.8)));
}
