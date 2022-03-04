import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class  ContainerDemo  extends StatelessWidget {
  const ContainerDemo ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar( title: Text('sonal'),
         
        ),
          endDrawer: const Drawer( backgroundColor: Colors.black,),
          body: Center(
            child: Container(
              height: 300 ,
                width: 300,

        decoration:  BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.lightBlue,Colors.white,Colors.green]),
          color: Colors.deepPurpleAccent,
          borderRadius: const BorderRadiusDirectional.only(topEnd:const Radius.circular(10)),
          border: Border.all( color: Colors.black,width: 2)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(
                height: 80,
                width: 80,
                color: Colors.pink,

              ),
              const SizedBox(
                height: 10,width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: Center(child: Column(
                  children: [
                    const Text('sonal'),
                    const Icon(Icons.image,color: Colors.white),

                  ],
                )),
              ),

            ],),


),
          )
),
      );

  }
}
