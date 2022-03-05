import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RegisterationFromDemo.dart';
import 'StfullDemo.dart';
import 'containerAssignment.dart';
import 'containerDemo.dart';
import 'dateAndTimePicker.dart';
import 'foodMenuApp.dart';

main() {
  runApp(const MaterialApp(
   //home: MyApp(),
   // home: ContainerDemo(),
   // home:  SecondAssignment(),
   // home: StfullDemo(),
    //  home: RegisterationDemo(),
      home: MenuDemo(),
      //home:DateNTimePickerDemo(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        drawer: const Drawer(child: Center(child: Text('i am drawer'))),
        appBar: AppBar(
            title: const Center(
                child: Text(
          'my first app',
          style: TextStyle(color: Colors.cyanAccent),
        ))),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: 'camera'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.image),
                label: 'photos')
          ],
          backgroundColor: Colors.blueGrey,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('sonal');
          },
          child: const Icon(Icons.add_alarm_rounded),
        ),
        
        body:

        
        Column(
          children: [
            Text(
                'Hello World',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 30.0,
                  backgroundColor: Colors.greenAccent,
                ),
              ),
            Image.network('https://manavshah123.github.io/static/img/quizoo.png')
          ],
        ),
       
       
       backgroundColor: Colors.purple,
      ),
    );
  }
}
