import 'package:flutter/material.dart';

Future<void> normalDialog(BuildContext context, String msg) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(msg),
      children: <Widget>[
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('OK')
            ]
          )
        )
      ],
    ),
  );
}
