import 'package:flutter/material.dart';

class MyAlert extends StatelessWidget {
  const MyAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
          leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.of(context).pop(); },),
        title: const Text('Alert Boxes'),
    ),
    body:
    Column(
    children: [


      Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        child: const Text('Show Basic alert'),
        onPressed: (){
          Center(
            child: showAlertDialog(context),
          );
        },

      ),
        ),
      ],
    ),
    ),
    );
  }
}

showAlertDialog(BuildContext context)
{
  //Creating Button in Alert Box
  Widget okButton = TextButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: const Text("OK"),
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Simple Alert"),
    content: const Text("This is an alert message."),
    actions:[
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context){
      return alert;
    }
  );
}
