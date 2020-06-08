import 'package:flutter/material.dart';
import 'package:my_app/screens/signin.dart';

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
      // appBar: AppBar(title: Text('Menu'), backgroundColor: Colors.blueGrey),
      body: SafeArea(
          child: Container(
              child: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Color(0xFF3be2a5),
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(
                  'https://miro.medium.com/max/3200/0*LjBPCQFGjmSJ6D46.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ))),
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
                    icon: Icon(Icons.add, color: Colors.white), 
                    onPressed:(){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Signin()));
                    }
                    )
              ]))),
    );
  }
}
