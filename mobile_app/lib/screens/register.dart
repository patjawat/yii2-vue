import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget RegisterBtn() {
    return IconButton();
  }

Widget ButtomTable() {
  return BottomAppBar(
          shape:CircularNotchedRectangle(),
          child: Container(height: 60.0, color: Colors.purple.shade700)
          );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ลงทะเบียน')),
      body: Container(
        child: Column(
          children: <Widget>[
            // ButtomTable()
          ],
        )
      ),
      
 
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context).pop(),
      //   child: Icon(Icons.add),
      // ),

      bottomNavigationBar: BottomAppBar(
          shape:CircularNotchedRectangle(),
          child: Container(height: 60.0, color: Colors.purple.shade700)
          ),
    );
  }
}
