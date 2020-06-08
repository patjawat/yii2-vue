import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Colors.blue.shade700;
  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/user-login.png'),
    );
  }
  Text showTitle() => Text('Patjawat Food');


  MyStyle();
}
