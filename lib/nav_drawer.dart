import 'package:flutter/material.dart';
import 'package:untitled/second_route.dart';

import 'second_route.dart';
import 'alertDialog.dart';
import 'card.dart';
import 'parent_widget_page.dart';
import 'screen_one.dart';
// import 'screen_two.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           DrawerHeader(
              child: const Text("Hey Entrepreneur,", style: TextStyle(color: Colors.white, fontSize: 25),),
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: const AssetImage('assets/entre.jpg'),
                  colorFilter: ColorFilter.mode(Colors.blue.withOpacity(0.8), BlendMode.modulate,),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Factorial Finder'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_alert),
            title: const Text('Alert Dialog'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyAlert()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_alert),
            title: const Text('Card '),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCard()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_alert),
            title: const Text('Inter Widget Communication '),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScreenOne(value: null,flag: 'N',)),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_alert),
            title: const Text('IWC F(x) '),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ParentWidget()),
              );
            },
          ),

        ],
      ),
    );
  }
}
