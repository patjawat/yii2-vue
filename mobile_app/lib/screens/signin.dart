import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget userCtl() {
    return Container(
      width:350.0,
      child:TextField(
        decoration:InputDecoration(
          labelText:'username',
          prefixIcon: Icon(Icons.account_box)
        )
      )
    );
  }

  Widget passwdCtl() {
    return Container(
      width:350.0,
      child:TextField(
        decoration:InputDecoration(
          labelText:'Password',
          prefixIcon: Icon(Icons.lock)
        )
      )
    );
  }
  Widget btnLogin(){
    return Container(
              child: RaisedButton(
              child: Text('Login'),
              onPressed: () {
                
              }
              )
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:SingleChildScrollView(
                  child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              userCtl(),
              passwdCtl(),
              btnLogin(),
            ]
          ),
        )
      )
    );
  }

  Container showLogo() {
    return Container(
            width:120.0,
          child:Image.asset('images/login.png')
          );
  }

 
}