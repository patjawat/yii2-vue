import 'package:flutter/material.dart';

//class needs to extend StatefulWidget since we need to make changes to the bottom app bar according to the user clicks
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar
  String text = "Food Pada";

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.pink.shade700,
      appBar: AppBar(title: Text('Menu'), backgroundColor: Colors.blueGrey),
      body: SafeArea(
        child: Container(
        color: Colors.greenAccent,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.edit, size: 48, color: Colors.white),
              Icon(Icons.motorcycle, size: 148),
              Icon(Icons.home, size: 48),
            ]),
      )), 
      //specify the location of the FAB
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          FloatingActionButton(child: Container(child: Icon(Icons.add))),
      bottomNavigationBar: BottomAppBar(
          color: Colors.pink,
          shape: CircularNotchedRectangle(),
          child: Container(
              margin: EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(children: <Widget>[
                IconButton(
                    icon: Icon(Icons.add, color: Colors.white), onPressed: null)
              ]))),
    );
  }
}
