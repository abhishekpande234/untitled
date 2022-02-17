import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'count.dart';


class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int num=9;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Parent Widget Page'),
          leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.of(context).pop(); },),
        ),
       body :  Center(
          child:
          Count(
             num : num,
              onCountChange: (int val) { Future.delayed(const Duration(seconds : 5), () async {if (kDebugMode) {
                (num+= val) ;
              }});
              },
            // onCountChange:  (int val) {setState(() => { num+= val });
            // },
            // onCountSelected: () => print("Selected the counter!"),

          ),
        ),
       //  body: Center(
       //    child: Row(
       //      mainAxisAlignment: MainAxisAlignment.center,
       //      children: [
       //        IconButton(onPressed: (){
       //          setState(() => num += -1);
       //        }, icon: const Icon(Icons.arrow_back)),
       //        TextButton(child: Text("$num"),
       //          onPressed: () => print("Selected the counter!"),
       //        ),
       //        IconButton(onPressed: (){
       //          setState(() => num += 1);
       //        }, icon: const Icon(Icons.arrow_forward)),
       //      ],
       //    ),
       //  ),
      ),

    );
  }
}

