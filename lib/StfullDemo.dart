import 'package:flutter/material.dart';

class StfullDemo extends StatefulWidget {
  const StfullDemo({Key? key}) : super(key: key);

  @override
  StfullDemoState createState() => StfullDemoState();
}

class StfullDemoState extends State<StfullDemo> {
  int i = 0;
   Color setColor=Colors.green;
   bool cb=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (i == 0) {
                            i = 0;
                          } else {
                            i--;
                          }
                        });
                      },
                      child: const Icon(Icons.remove),
                    ),
                    Text(i.toString(), style: TextStyle(fontSize: 30),),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          i++;
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              MaterialButton(onPressed:(){
                   setState(() {
                   });
              }, child: Text('submit'),
              color: setColor,),
              Row(
                children: [
                  Checkbox(value: cb, onChanged: (val){
                     setState(() {
                       cb=val!;
                     });
                  }),
                  GestureDetector(child: Text('accept')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
