import 'package:flutter/material.dart';
// import 'package:witpark/ForgotPassword.dart';
import 'LoginPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: ForgotPassword(),
    home: LoginPage(),
    theme: ThemeData(primarySwatch: Colors.amber),
  ));
}
