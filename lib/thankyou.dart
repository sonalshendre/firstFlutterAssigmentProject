import 'package:flutter/material.dart';

class ThanksPage extends StatelessWidget {
  var user_name;

   ThanksPage({Key? key,this.user_name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Card(
        elevation: 2,
      shadowColor: Colors.deepPurple,
        child: Container(
          margin: EdgeInsets.all(20),
          width: 400,
          height: 200,
          color: Colors.purple,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Thankyou!',style: TextStyle(fontSize: 30,color: Colors.red),),
            Text(user_name,style: TextStyle(fontSize: 20,color: Colors.white),),
          ],
        ),),
      )),
    );
  }
}
