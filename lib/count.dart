import 'package:flutter/material.dart';
import 'parent_widget_page.dart';

class Count extends StatelessWidget {
  final int num;
  Count(this.num);




  @override
  Widget build(BuildContext context) {
    return  Text("$num");
  }
}

