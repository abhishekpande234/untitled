import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'screen_two.dart';


class ScreenOne extends StatefulWidget {
  int? value;
  String flag;

  ScreenOne({required this .value,required this.flag});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  int num = 5;

  void showToast(){
    Fluttertoast.showToast(
      msg: 'Redirected to Screen Two',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.black
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.flag == 'S'){
      setState(() {
        num = widget.value!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.of(context).pop(); },),
          title: const Text('Screen One'),

        ),
        body:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    Text("$num"),
                    ElevatedButton(
                      child: const Text('Goto Screen Two'),
                      onPressed: (){
                        ScreenTwo.counter.value = num;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>  ScreenTwo()
                          ),
                        );
                        showToast();
                      },
                    ),
                    // Text("$num"),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}