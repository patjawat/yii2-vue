import 'package:appfood/utility/my_style.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Signin'),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
              end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.red]
                  )),
            // mainAxisSize: MainAxisSize.min,
            child: Center(
                child: Column(
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().showTitle(),
                userForm(),
                SizedBox(
                  height: 5.0,
                ),
                passwdForm(),
                loginButtom()
              ],
            ))));
  }

  Widget userForm() => Container(
      width: 300.0,
      child: TextField(
       style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
    
        prefixIcon: Icon(Icons.account_box),
        labelText: 'ชื่อเข้าใช้งาน',
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: MyStyle().darkColor)), //ใส่ขอบ txtInput
        focusedBorder: OutlineInputBorder(), //คงกรอบไว้เหมืินเดิมเมื่อ focus
      )));

  Widget passwdForm() => Container(
      width: 300.0,
      child: TextField(
          decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: 'รหัสผ่าน',
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: MyStyle().darkColor)), //ใส่ขอบ txtInput
        focusedBorder: OutlineInputBorder(), //คงกรอบไว้เหมืินเดิมเมื่อ focus
      )));

  Widget loginButtom() => Container(
          child: RaisedButton(
        child: Text("Login"),
        onPressed: null,
      ));
}
