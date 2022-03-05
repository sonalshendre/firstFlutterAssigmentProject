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
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset('assets/foodDelivery.png'),
          ),
          centerTitle: true,
          title: Text(
            'FastDelivery!',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          actions: [
            Icon(Icons.phone),
            Icon(Icons.notifications),
          ],
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(

                children: [
                  Image.asset('assets/combos.jpeg',width: 350,height: 250,),
                  SizedBox(width: 5,),
                  Image.asset('assets/combo2.jpeg',width: 350,height: 250,),
                  SizedBox(width: 5,),
                  Image.asset('assets/combos3.jpeg',width: 350,height: 250,),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                image_container(
                    productname: 'Panir Capsicum pizza',
                    productPrice: 'only at \$200'),
                image_container(productImagepath: 'assets/burgerI.jpeg',
                productname: 'cheese Burger',
                  productPrice: 'at only \$150',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                image_container(
                  productImagepath: 'assets/garlicb.jpeg',
                    productname: 'Garlic bread',
                    productPrice: 'just at \$70'),
                image_container(productImagepath: 'assets/burgerI.jpeg',
                  productname: 'cheese Burger',
                  productPrice: 'at only \$150',
                ),
              ],
            )
          ],
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
    elevation: 5,
    shadowColor: Colors.lightBlue,
    child: Container(
        margin: EdgeInsets.all(10),

        height: 200,
        width: 150,
        color: Colors.grey,
        child: Column(
          children: [
            Image.asset(
              productImagepath,
              width: 130,
              height: 150,
              
            ),
            Text(
              productname,
              style: TextStyle(fontSize: 15),
              maxLines: 2,
            ),
            Text(productPrice)
          ],
        )),
  );
}
