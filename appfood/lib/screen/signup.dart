import 'package:flutter/material.dart';

import '../utility/normal_dialog.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String shooseType,username,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
        body:Center(
          child: Container(
            width:350.0,
            decoration:BoxDecoration(),
            child:Column(
             children: <Widget>[
               SizedBox(
                 height: 30.0,
               ),
               Center(child:Text('Register Form')),
  
               formUsername(),
               formPasswd(),
              userRadio(),
              superUserRadio(),
              submitButton()
             ],
            ),
          ),
        )
    );
  }
Row userRadio() => Row(
  children: <Widget>[
    Radio(value:'user', 
    groupValue: shooseType, 
    onChanged:(value)=>{
      setState(()=>{
        shooseType = value
      })
    }),
    Text('ผู้ใช้งาน')
  ]
);

Row superUserRadio() => Row(
  children: <Widget>[
    Radio(value:'manager', 
    groupValue: shooseType, 
    onChanged:(value)=>{
      setState(()=>{
        shooseType = value
      }),
      
    }
    ),
    Text('ผู้ดูแลระบบ')
  ]
);

Widget formUsername() => TextField(
  onChanged:(value) => username = value.trim(),
            decoration:InputDecoration(
              prefixIcon: Icon(Icons.supervised_user_circle),
              labelText:'ชื่อเข้าใช้งาน',
            )
           );



Widget formPasswd() => TextField(
  onChanged:(value) => password = value.trim(),
            decoration:InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText:'รหัสผ่าน'
            )
           );

Widget submitButton() => RaisedButton(
  child: Text("Register"),
  onPressed:()=>{
    if(username.isEmpty || username == null || password.isEmpty || username == null || shooseType.isEmpty || shooseType == null){
    normalDialog(context, 'ต้องไม่ใช่ค่าว่าง')
    }else{
      print('OK')
    }
  }
  );

}