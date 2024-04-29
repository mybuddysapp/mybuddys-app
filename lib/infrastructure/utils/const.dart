import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Consts {
  static Future<void> intialize() async {
    await dotenv.load(fileName: ".env");
  }

  // String HOST = 'http://192.168.1.202';

//  String HOST = 'http://localhost';
//   String URL = '$HOST:8080';

  // String API_URL = '$URL/api/v1';

  //get variables from the .env file
  static String API_URL =
      dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080/api/v1';
  static String SUPABASE_URL =
      dotenv.env['API_AUTH_URL'] ?? 'http://localhost:8000';
  static String APPWRITE_URL =
      dotenv.env['API_APPWRITE_URL'] ?? 'http://localhost/v1';

// const String API_URL = 'http://192.168.1.134:8080/api/v1';

//SUPABASE
  static const String SUPABASE_ANON_KEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE';
}

const unexpectedErrorMessage = 'Unexpected error occurred.';

const API_URL = 'http://192.168.1.202:8080/api/v1';

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

// const REFRESH_TOKEN_KEY = 'refresh_token';
// const BACKEND_TOKEN_KEY = 'backend_token';
// const GOOGLE_ISSUER = 'https://accounts.google.com';
// const GOOGLE_CLIENT_ID_IOS =
//     '410853899126-ntqs7q26a6tgdojvv0lc3bereofhh48d.apps.googleusercontent.com';
// const GOOGLE_REDIRECT_URI_IOS =
//     'com.googleusercontent.apps.$GOOGLE_CLIENT_ID_IOS:/oauthredirect';
// const GOOGLE_CLIENT_ID_ANDROID =
//     '410853899126-m1v047p789ro0ie5123b2dak8idt9q9r.apps.googleusercontent.com';
// const GOOGLE_REDIRECT_URI_ANDROID =
//     'com.googleusercontent.apps.$GOOGLE_CLIENT_ID_ANDROID:/oauthredirect';
// const GOOGLE_CLIENT_ID_WEB =
//     '410853899126-08kp7cmr16bnf77mm3ov172kut1l106v.apps.googleusercontent.com';
// // const GOOGLE_REDIRECT_URI_WEB = 'http://localhost';
//
// String clientID() {
//   if (Platform.isAndroid) {
//     return GOOGLE_CLIENT_ID_ANDROID;
//   } else if (Platform.isIOS) {
//     return GOOGLE_CLIENT_ID_IOS;
//   }
//   return '';
// }
//
// String redirectUrl() {
//   if (Platform.isAndroid) {
//     return GOOGLE_REDIRECT_URI_ANDROID;
//   } else if (Platform.isIOS) {
//     return GOOGLE_REDIRECT_URI_IOS;
//   }
//   return '';
// }
