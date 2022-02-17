import 'package:flutter/material.dart';


class Count extends StatelessWidget {
  final int num;
  // final VoidCallback onCountSelected;
  final Function(int) onCountChange;

    const Count({required this.num, required this.onCountChange});





  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(onPressed: onCountChange(1), icon: const Icon(Icons.arrow_back)),
          Text("$num"),
          // onPressed: ()=> onCountSelected(),
        // ),
        IconButton(onPressed: onCountChange(-1), icon: const Icon(Icons.arrow_forward)),
      ],
    );
  }
}

