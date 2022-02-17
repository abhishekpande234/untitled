import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'screen_one.dart';

//import 'screen_one.dart';

// class ScreenTwo extends StatefulWidget {
//   static ValueNotifier<int> counter = ValueNotifier<int>(0);
//   @override
//   State<ScreenTwo> createState() => _ScreenTwoState();
// }
//
// class _ScreenTwoState extends State<ScreenTwo> {
//
//   //final int num;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.of(context).pop(); },),
//           title: const Text('Screen Two'),
//         ),
//         body:
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Center(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: <Widget> [
//                         IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
//                         ValueListenableBuilder(
//                             valueListenable: counter,
//                             builder: (BuildContext context, count , child){
//                               return Text('$count');
//                             }),
//                         IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward)),
//                       ],
//                     ) ,
//                     ElevatedButton(
//                       child: const Text('Goto Screen One'),
//                       onPressed: (){
//                         Navigator.pop(context);
//
//                       },
//
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class ScreenTwo extends StatefulWidget {
  static ValueNotifier<int> counter = ValueNotifier<int>(0);


  // ScreenTwo({key key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  int sum = ScreenTwo.counter.value;

  void showToast(){
    Fluttertoast.showToast(
        msg: 'Change in value of Parent widget: Successful',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.black
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => ScreenOne (value : sum , flag : 'S'))
                          );
                          showToast();
                        },
                      ),
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

// class ScreenTwo extends StatelessWidget {
//   static ValueNotifier<int> counter = ValueNotifier<int>(0);
//   int num;
//   final Function callback;
//   ScreenTwo({Key? key, required this.num, required this.callback }) : super(key: key);
//   int sum = ScreenTwo.counter.value;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.of(context).pop(); },),
//           title: const Text('Screen Two'),
//         ),
//         body:
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Center(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: <Widget> [
//                         IconButton(onPressed: (){ScreenTwo.counter.value -= 1; sum = ScreenTwo.counter.value ;}, icon: const Icon(Icons.arrow_back)),
//                         ValueListenableBuilder(
//                             valueListenable: ScreenTwo.counter,
//                             builder: (BuildContext context, count , child){
//                               return Text('$count');
//
//                             }),
//                         IconButton(onPressed: (){ScreenTwo.counter.value += 1; sum = ScreenTwo.counter.value ;}, icon: const Icon(Icons.arrow_forward)),
//                       ],
//                     ) ,
//                     // Text("$num"),
//                     ElevatedButton(
//                       child: const Text('Goto Screen One'),
//                       onPressed: (){
//                         callback(sum);
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) =>  ScreenOne(sum)),
//                         );
//
//                       },
//                     ),
//                     Text("${ScreenTwo.counter}.value"),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

