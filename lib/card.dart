import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Music'),
            leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.of(context).pop(); },),
          ),
          body:
          Column(
            children: <Widget>[
               Center(
                   child: Container(
                      width: 300,
                      height: 200,
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        color: Colors.blue,
                        elevation:10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            ListTile(
                              leading: Icon(Icons.album, size:60),
                              title:Text('Excuses',
                                  style: TextStyle(fontSize: 30.0),),
                              subtitle: Text('AP Dhillon',
                                  style: TextStyle(fontSize: 18.0),),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.center,
                              buttonPadding:EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10),
                              children: <Widget> [
                                Icon( Icons.arrow_back, size:40),
                                Icon( Icons.play_circle, size:48),
                                Icon( Icons.arrow_forward, size:40 ),
                              ],
                            ),
                          ],
                        )
                    ),

                ),
              ),
            ],
          ),
        )

    );
  }
}