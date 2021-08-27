import 'package:flutter/material.dart';
import 'package:witpark/HomePage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.amber),
  ));
}
