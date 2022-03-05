import 'package:flutter/material.dart';

class MenuDemo extends StatefulWidget {
  const MenuDemo({Key? key}) : super(key: key);

  @override
  _MenuDemoState createState() => _MenuDemoState();
}

class _MenuDemoState extends State<MenuDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFF311B92),
            child: Column(
              children: [
                Container(
                  color: Colors.purple,
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/foodDelivery.png', width: 70, height: 70,),
                        SizedBox(width: 5,),
                        Text('FastDelivery!', style: TextStyle(fontSize: 25),),
                        SizedBox(width: 140,),
                        Icon(Icons.notifications),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFF4527A0),
                        Color(0xff512da8),
                        Color(0xB59C3AB7),
                        Color(0x9C8C3AFF),
                      ], begin: Alignment.bottomRight,
                        end: Alignment.topLeft,),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/combos.jpeg',
                          width: 300,
                          height: 150,
                        ),
                        Image.asset(
                          'assets/combo2.jpeg',
                          width: 300,
                          height: 150,
                        ),
                        Image.asset(
                          'assets/combos3.jpeg',
                          width: 200,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(child: Image.asset('assets/lavaca.jpeg',width: 200,height: 250,)),
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset('assets/biryani.gif',width: 150,height: 100,),
                            Text( 'best biryani' ,style: TextStyle(fontSize: 20,color: Colors.white),),
                            SizedBox(height: 10,),
                            Image.asset('assets/paneerroll.jpeg',width: 150,height: 100),
                            Text('paneer roll',style: TextStyle(fontSize: 20,color: Colors.white),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    image_container(
                        productname: 'Panir Capsicum pizza',
                        productPrice: 'only at \$200'),
                    image_container(
                      productImagepath: 'assets/burgerI.jpeg',
                      productname: 'cheese Burger',
                      productPrice: 'at only \$150',
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    image_container(
                        productImagepath: 'assets/garlicb.jpeg',
                        productname: 'Garlic bread',
                        productPrice: 'just at \$70'),
                    image_container(
                      productImagepath: 'assets/lava1.jpeg',
                      productname: 'Choco lava Cake',
                      productPrice: 'at only \$170',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget image_container({
  String productImagepath = 'assets/HomeMadepizza.jpeg',
  String productname = '',
  String productPrice = '',
  double containerHeight = 200,
  double containerwidht = 150,
}) {
  return Card(
    elevation: 1,
    shadowColor: Colors.purple,
    child: Container(
        decoration: BoxDecoration(
          color: Color(0xff6a1b9a),

        ),
        margin: EdgeInsets.all(10),
        height: 200,
        width: 150,

        child: Column(
          children: [
            Image.asset(
              productImagepath,
              width: 130,
              height: 150,
            ),
            Text(
              productname,
              style: TextStyle(fontSize: 15, color: Colors.white),
              maxLines: 2,
            ),
            Text(productPrice,
              style: TextStyle(color: Colors.white),),
          ],
        )),
  );
}
