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
            ButtomTable()
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickedCentreFAB = !clickedCentreFAB; //to update the animated container
          });
        },
        tooltip: "Centre FAB",
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.add),
        ),
        elevation: 4.0,
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
