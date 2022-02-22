import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter SnackBar Demo'),
        ),
        body: SnackBarr(),
      );
  }
}

class SnackBarr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: const Text('Show SnackBar', style: TextStyle(fontSize: 25.0),),
        textColor: Colors.white,
        color: Colors.blue,
        padding: const EdgeInsets.all(8.0),
        splashColor: Colors.grey,
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Hey! This is a SnackBar message.'),
            duration: const Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}