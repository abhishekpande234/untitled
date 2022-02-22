import 'package:flutter/material.dart';
import 'master_form.dart';
// import 'display_form.dart';
import 'snack_bar_page.dart';

class MasterMain extends StatelessWidget {

  const MasterMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
        appBar: AppBar(
        title: const Text('Master Form'),
          bottom: const TabBar(
            tabs:[
              Tab(icon :Icon(Icons.contacts), text: "Form"),
              Tab(icon : Icon(Icons.add), text: "Display Form"),
            ],
          ),
    leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.of(context).pop(); },
    ),
    ),

         body: TabBarView(
           children: [
             const MyCustomForm(),
             SnackBarPage(),
             // DisplayForm(cno, name),
           ],
         ),
    ),
    );
  }
}
