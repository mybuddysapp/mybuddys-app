import 'package:flutter/material.dart';

const String HOST = 'http://192.168.1.202';
// const String HOST = 'http://localhost';
const String URL = '$HOST:8080';

const String API_URL = '$URL/api/v1';
// const String API_URL = 'http://192.168.1.134:8080/api/v1';

//SUPABASE
const String SUPABASE_URL = '$HOST:8000';
const String SUPABASE_ANON_KEY =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE';

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