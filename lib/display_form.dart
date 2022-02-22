

import 'package:flutter/material.dart';

class DisplayForm extends StatefulWidget {
  String cno;
  String name;
  List  selectedItems;
  String radioVal;
  String txtField;
  DisplayForm(this.cno, this.name, this.selectedItems,this.radioVal, this.txtField,{Key? key}) : super(key: key);

  @override
  _DisplayMasterState createState() => _DisplayMasterState();
}

class _DisplayMasterState extends State<DisplayForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.of(context).pop(); },),
      ),
      body: Column(
        children: [
          Text(widget.name),
          Text(widget.cno),
          ListView(
            controller: ScrollController(),
            shrinkWrap: true,
            children: widget.selectedItems.map((elements){
              return Center(child: Text(elements));
            }).toList(),
          ),
          Text(widget.radioVal),
          Text(widget.txtField),
        ],
      ),
    );
  }
}
