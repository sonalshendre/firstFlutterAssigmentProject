import 'package:flutter/material.dart';

import 'orderFrom.dart';

class DetailPage extends StatelessWidget {
  DetailPage(
      {Key? key,
      this.imagePath = '',
      this.productFname = '',
      this.productFprice = ''})
      : super(key: key);
  String imagePath = '';
  String productFname = '';
  String productFprice = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(imagePath),
                Text(
                  productFname,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  productFprice,
                  style: TextStyle(fontSize: 20),
                ),
                Text('Get 20% discount on your first order'),
                MaterialButton(onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrderFormDemo(
                        product_Name: productFname,
                      ),
                    ),
                  );
                },
                  color: Colors.red,
                  child: Text('order Now'),
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
