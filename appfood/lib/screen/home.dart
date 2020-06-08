import 'package:appfood/screen/signin.dart';
import 'package:appfood/screen/signup.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
          child: ListView(children: <Widget>[
        showDrawerHeader(),
        signInMenu(),
        signUpMenu()
      ]));

  ListTile signInMenu() => ListTile(
        leading: Icon(Icons.android),
        title: Text('Sign In'),
        onTap:(){
        MaterialPageRoute route = MaterialPageRoute(builder: (value) => Signin());
        Navigator.push(context, route);
        }
      );
      
  ListTile signUpMenu() => ListTile(
        leading: Icon(Icons.data_usage),
        title: Text('Sign Register'),
        onTap: (){
          MaterialPageRoute route = MaterialPageRoute(builder:(value) => SignUp());
          Navigator.push(context, route);
        },
      );

// ListTitle signinMenu(){
//   return ListTitle(
//     leading:Icons(Icons.signin),
//     title:Text('Sign in')
//   );
// }

  UserAccountsDrawerHeader showDrawerHeader() => UserAccountsDrawerHeader(
      accountName: Text('Gues'), accountEmail: Text('Please Login'));
}
