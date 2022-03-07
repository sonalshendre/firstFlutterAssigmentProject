import 'package:flutter/material.dart';
import 'package:untitled/userInfo.dart';

import 'detailPage.dart';
import 'listOfProductPage.dart';

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
            color: const Color(0xFF311B92),
            child: Column(
              children: [

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF4527A0),
                          Color(0xff512da8),
                          Color(0xB59C3AB7),
                          Color(0x9C8C3AFF),
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children:[Image.asset(
                            'assets/combos.jpeg',
                            width: 300,
                            height: 150,
                          ),
                          Text( '   many combos are available in best prices...'),]
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              'assets/combo2.jpeg',
                              width: 300,
                              height: 150,
                            ),
                            Text('     special offer...')
                          ],
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
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onDoubleTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                            imagePath: 'assets/lavaca.jpeg',
                                            productFname:
                                                'choco loaded lava cake',
                                            productFprice: '\$ 90',
                                          )),
                                );
                              },
                              child: Image.asset(
                                'assets/lavaca.jpeg',
                                width: 200,
                                height: 220,
                              ),
                            ),
                            const Center(
                              child: Text(
                                'lava cake',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onDoubleTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ProductListPage(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/biryani.gif',
                                width: 150,
                                height: 100,
                              ),
                            ),
                            const Text(
                              'best biryani ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            const Text(
                              'at ony \$160',
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset('assets/paneerroll.jpeg',
                                width: 150, height: 100),
                            const Text(
                              'paneer roll \$75',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
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
                const SizedBox(
                  height: 10,
                ),
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
        decoration: const BoxDecoration(
          color: Color(0xff6a1b9a),
        ),
        margin: const EdgeInsets.all(10),
        height: 200,
        width: 150,
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                child: Image.asset(
                  productImagepath,
                  width: 130,
                  height: 150,
                ),
              ),
            ),
            Text(
              productname,
              style: const TextStyle(fontSize: 15, color: Colors.white),
              maxLines: 2,
            ),
            Text(
              productPrice,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        )),
  );
}
