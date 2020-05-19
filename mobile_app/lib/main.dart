import 'package:flutter/material.dart';
import 'package:my_app/screens/home.dart';

void main() {
  runApp(MyApp());
}

class  MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      home:Home()
    );
  }
}