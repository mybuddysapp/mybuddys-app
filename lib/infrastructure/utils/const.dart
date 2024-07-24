import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Consts {
  static Future<void> intialize() async {
    await dotenv.load(fileName: ".env");
  }

  //get variables from the .env file
  static String API_URL =
      dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080/api/v1';
}

const unexpectedErrorMessage = 'Unexpected error occurred.';

const formSpacer = SizedBox(width: 16, height: 16);

/// Some padding for all the forms to use
const formPadding = EdgeInsets.symmetric(vertical: 20, horizontal: 16);

const double bottomPaddingForButton = 150.0;
const double buttonHeight = 50.0;
const double buttonWidth = 200.0;
const double pagePadding = 32.0;
const double pageBreakpoint = 768.0;
const double heroImageHeight = 250.0;
const Color lightThemeShadowColor = Color(0xFFE4E4E4);
const Color darkThemeShadowColor = Color(0xFF121212);
const Color darkSabGradientColor = Color(0xFF313236);
