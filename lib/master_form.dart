import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'display_form.dart';


class MasterForm extends StatelessWidget {
  const MasterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master Form'),
        leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: () { Navigator.of(context).pop(); },
        ),
      ),

      body:  MyCustomForm(),
          // DisplayForm(cno, name),
      );
      /*DefaultTabController(
        length: 2,
         child :Scaffold(
           appBar: AppBar(
             title: const Text('Master Form'),
             bottom: const TabBar(
               tabs:[
                 Tab(icon :Icon(Icons.contacts), text: "Form" ,),
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
      ); */

  }
}

// enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyCustomFormState extends State<MyCustomForm> {
  // BestTutorSite _site = BestTutorSite.javatpoint;

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final otherController = TextEditingController();
  final myTextfield = TextEditingController();
  List selectedItems = [];
  String radioVal = '' ;
  String cno = '';
  String name = '';
  String txtField = '';

  void initState()
  {
    setState(() {
      radioVal = arr[0];
    });
    super.initState();

  }
  _saveValue(){
    cno = numberController.text;
    name = nameController.text;
    txtField = myTextfield.text;
    radioVal = otherController.text;
  }

  String text = '0';

  Map<String, bool> values = {
    'Nagpur'  : false,
    'Pune'    : false,
    'Bangalore' : false,
    'New Delhi' : false,
  };



  final List<String> arr = <String>[
    'Java',
    'C++',
    'Python',
    'Others',
  ];

  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(

      // child:Center(
      child:Form(
        key: _formKey,
        child: Column(

          // crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            const SizedBox(width: 10,),

            const Center(child: Text('Form with multiple inputs. ',style: TextStyle(fontSize: 20.0))),
            const Divider(),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Full Name',
              ),
              /*validator: (value){
                if(value?.isEmpty??true){
                  text = 'Please enter Full Name';
                  return text;
                }
                return null;
              },*/
              controller: nameController,
            ),

            const Divider(),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Contact Number',
              ),
              /*validator: (value){
                if(value?.isEmpty??true){
                  text = 'Please enter valid number';
                  return text;
                }
                return null;
              },*/
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              controller: numberController,
            ),

            const Divider(),

            const Text('Preferred work locations',style: TextStyle(fontSize: 20.0), ),

           ListView(
             controller: ScrollController(),
              shrinkWrap: true,
              children: values.keys.map((String key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: values[key],
                  onChanged: (value) {
                    setState(() {
                      values[key] = value!;
                      selectedItems.clear();
                      values.forEach((key, value) {
                        if(value){
                          selectedItems.add(key);
                        }
                      });
                    });
                    // print(key);
                  },
                );
              }).toList(),
            ),


            /*__________________________Some Code Here____________________*/
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount : arr.length,
            //     itemBuilder: (BuildContext context, int index) {
            //     return Container(
            //       height: 50,
            //       margin: const EdgeInsets.all(2),
            //       color: Colors.blueAccent,
            //       child: Center(
            //         child: Text(arr[index], style: const TextStyle(fontSize: 20 , color: Colors.black),),
            //       ),
            //     );
            //     },
            // ),


          /* ListView(
              controller: ScrollController(),
              shrinkWrap: true,
              children: arr.map((elements){
                return Container(
                  child: Text(elements),
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(15),
                  color: Colors.green[100],
                );
              }).toList(),
            ),*/



           // CheckboxListTile(
           //    // secondary: const Icon(Icons.alarm),
           //    title: const Text('Nagpur'),
           //    subtitle: const Text('440023'),
           //    checkColor: Colors.white,
           //    activeColor: Colors.blueAccent,
           //    value: valuefirst,
           //    onChanged: (value) {
           //      setState(() {
           //        print ("$value");
           //        valuefirst = value!;
           //      });
           //    },
           //  ),

            // CheckboxListTile(
            //   // secondary: const Icon(Icons.alarm),
            //   title: const Text('Pune'),
            //   subtitle: const Text('411035'),
            //   checkColor: Colors.white,
            //   activeColor: Colors.blueAccent,
            //   value: valuesecond,
            //   onChanged: (value) {
            //     setState(() {
            //       // print ("$value");
            //       valuesecond = value!;
            //     });
            //   },
            // ),


            /*__________________________Some Code Here____________________*/

            const Divider(),

            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text('Preferred technology ',style: TextStyle(fontSize: 20.0), ),
            ),

            ListView(
              controller: ScrollController(),
              shrinkWrap: true,
              children: arr.map((element) {
                return  ListTile(
                  title : Text(element),
                  leading: Radio(
                    value: element,
                    groupValue: radioVal,
                    onChanged: (String? val){
                      setState(() {
                        radioVal = val!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),

           if(radioVal == 'Others')
             TextFormField(
               decoration: const InputDecoration(
                 hintText: 'Enter Other technology....',
               ),
               controller: otherController,
             ),



           //Hard Coded Radio Buttons
           /* ListTile(
              title: const Text('Pizza'),
              leading: Radio(
                value: 1,
                groupValue: _site,
                onChanged: (int? val) {
                  setState(() {
                    _site = val!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('HotDog'),
              leading: Radio(
                value: 2,
                groupValue: _site,
                onChanged: (int? value) {
                  setState(() {
                    _site = value!;

                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Kadhi Chawal'),
              leading: Radio(
                value: 3,
                groupValue: _site,
                onChanged: (int? value) {
                  setState(() {
                    _site = value!;
                  });
                },
              ),
            ),*/



            const Divider(),

            const Text('Opinions ',style: TextStyle(fontSize: 20.0), ),



            Padding(
              padding: const EdgeInsets.only(top: 20.00 , bottom: 20.00),
              child: TextField(
                controller: myTextfield,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Put your opinions here.....',
                ),
              ),
            ),



            Center(
              child: ElevatedButton(
                onPressed: (){
                  _saveValue();
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context) => DisplayForm(cno ,name, selectedItems , radioVal , txtField)));

                },
                child: const Text('Share to Screen Two'),
              ),
            ),


          ],
        ),

      ),
      // ),
    );
  }
}

