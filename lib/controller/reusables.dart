import 'package:flutter/material.dart';

class ReusableFunctionsWidgets {

  // popup dialog to show a text
  showPopUpDialog(String text, context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
