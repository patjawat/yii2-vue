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
      appBar: AppBar(title: Text('Menu'), backgroundColor: Colors.blueGrey),
      body: SafeArea(
          child: Column(children: <Widget>[
        Container(
          height: 100,
          color: Colors.red,
        ),
        Container(
          height: 200,
          color: Colors.green,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    height: 250,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 250,
                    color: Colors.pink,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 250,
                    color: Colors.black26,
                  ),
                ),
            ]
          ),
        ),
        Container(height: 100, color: Colors.blue),
      ])), //specify the location of the FAB
    );
  }
}
