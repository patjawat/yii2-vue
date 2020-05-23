import 'package:flutter/material.dart';
import 'package:my_app/screens/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget showLogo() {
    return Container(width: 150.0, child: Image.asset('images/logo.png'));
  }

  Widget showAppName() {
    return Text('Patjawat Store',
        style: TextStyle(
            fontSize: 20.0, color: Colors.blue.shade200, fontFamily: 'Kanit'));
  }

  Widget loginBtn() {
    return RaisedButton(
        color: Colors.blue.shade700,
        child: Text('Login', style: TextStyle(color: Colors.white)),
        onPressed: () {
          print('Login user');
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => Register());
          Navigator.of(context).push(materialPageRoute);
        });
  }

  Widget registerBtn() {
    return RaisedButton(
        child: Text('Register'),
        onPressed: () {
          print('register user');
        });
  }

  Widget showBtn() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(children: <Widget>[
          loginBtn(),
          SizedBox(
            width: 10.0,
          ),
          registerBtn(),
        ]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      // กำหนดสีพื้นหลัง
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellow.shade700, Colors.blue.shade700],
              begin: Alignment.centerLeft,
              end: Alignment(-1.0, 1.0))),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          showLogo(),
          showAppName(),
          SizedBox(
            height: 20.0,
          ),
          showBtn()
        ],
      )),
    )));
  }
}
