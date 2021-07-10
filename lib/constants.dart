import 'package:flutter/material.dart';

// Colors
const kBackgroundColor = Color(0xff191720);
const kTextFieldFill = Color(0xff1E1C24);
// TextStyles
const kHeadline = TextStyle(
  color: Colors.white,
  fontSize: 34,
  fontWeight: FontWeight.bold,
);

const kBodyText = TextStyle(
  color: Colors.grey,
  fontSize: 15,
);

const kButtonText = TextStyle(
  color: Colors.black87,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const kBodyText2 =
    TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white);

// const primaryColor = Color(0xFF82B21E);
// const welcomePrimaryColor = Color(0xFF2F6400);
// const secondaryColor = Color(0xffF5F5DC);

//for emulator
// const String finalUrl = 'http://10.0.2.2:3000';
//for real device
const String finalUrl = 'http://192.168.1.66:4000';

//auth
const String signinUrl = '$finalUrl/signin';
const String signupUrl = '$finalUrl/signup';
