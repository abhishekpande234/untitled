import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'screen_one.dart';

//import 'screen_one.dart';

class ScreenTwo extends StatefulWidget {

  static ValueNotifier<int> counter = ValueNotifier<int>(0);
  // ScreenTwo({key key});
  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  int sum = ScreenTwo.counter.value;
  int prevVal = ScreenTwo.counter.value;

  // int gettersum()
  // {
  //   return sum;
  // }
  mySnackBar(BuildContext context){
    final snackBar = SnackBar(
      content: const Text('Hey! This is a SnackBar message.'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          sum = prevVal;
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // void actionSnackBar(BuildContext context, int index){
  //   setState((){
  //     sum = prevVal;
  //   });
  // }

  void showToast(){
    Fluttertoast.showToast(
        msg: 'Change in value of Parent widget: Successful',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.black
    );
  }

  navigateToScreenOne(){
    return Timer(
        const Duration(seconds:2),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (BuildContext context) => ScreenOne (value : sum , flag : 'S')))
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.of(context).pop(); },),
          title: const Text('Screen Two'),
        ),
        body:
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: <Widget> [
                        IconButton(onPressed: (){ScreenTwo.counter.value -= 1; sum = ScreenTwo.counter.value ;}, icon: const Icon(Icons.arrow_back)),
                        ValueListenableBuilder(
                            valueListenable: ScreenTwo.counter,
                            builder: (BuildContext context, count , child){
                              return Text('$count');

                            }),
                        IconButton(onPressed: (){ScreenTwo.counter.value += 1; sum = ScreenTwo.counter.value ;}, icon: const Icon(Icons.arrow_forward)),
                      ],
                    ) ,
                    // Text("$num"),
                    ElevatedButton(
                      child: const Text('Goto Screen One'),
                      onPressed: (){
                        navigateToScreenOne();
                        mySnackBar(context);
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(builder: (BuildContext context) => ScreenOne (value : sum , flag : 'S'))
                        // );

                        // showToast();
                      },
                    ),

                    // ElevatedButton(
                    //   child: const Text('View Snackbar'),
                    //   onPressed: (){
                    //     mySnackBar(context);
                    //   },
                    // ),

                    SnackBarClass(),

                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}




mySnackBar(BuildContext context){
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
}

class SnackBarClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Show SnackBar'),
        onPressed: () {
          mySnackBar(context);
        },
      ),
    );
  }
}


