
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Factorial Finder'),
            leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.of(context).pop(); },),
          ),
          body:
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: MyCustomForm(),
              ),
              Center(
                  child: ElevatedButton(
                    onPressed: () { Navigator.pop(context); },
                    child: const Text('Go Back'),
                  )
              ),
            ],
          ),
        )

    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  String text = '0';
  void _findFact(){
    int num = int.parse(titleController.text );
    int sum =  1 ;
      setState((){
        for (int i=2 ; i<=num ; i++)
          {
            sum = sum * i ;
          }
        text = sum.toString();
      });
     // titleController.text = text.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
    child:Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          TextFormField(

            decoration: const InputDecoration(
              hintText: 'Enter the number',
            ),
            validator: (value){
              if(value?.isEmpty??true){
                text = 'Please enter valid number';
                return text;
              }
              return null;
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
            controller: titleController,
          ),
          ElevatedButton(
            onPressed: _findFact,
            child: const Text('Find Factorial'),
          ),
          Text(text),
        ]
      )

    ),
    );
  }
}
