import 'package:flutter/material.dart';
import 'package:untitled/thankyou.dart';

class OrderFormDemo extends StatefulWidget {
  OrderFormDemo({Key? key, this.product_Name = ''}) : super(key: key);
  String product_Name = '';

  @override
  _OrderFormDemoState createState() => _OrderFormDemoState();
}

class _OrderFormDemoState extends State<OrderFormDemo> {

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fill the detail',
                  style: TextStyle(fontSize: 20),
                ),
                Text('Product Name : ${widget.product_Name}'),
                TextFormField(
                  controller: nameController,
                  decoration: inputField(
                      hintext: 'Enter Your Name', lable: 'Full Name'),
                ),
                SizedBox(
                  width: 10,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? 'Please Enter valid email' : null;
                  },
                  decoration: inputField(
                    hintext: 'Enter Your Email Address',
                    lable: 'Enter Email',
                  ),
                  onChanged: (val) {},
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  width: 10,
                ),
                TextFormField(
                  decoration: inputField(
                    hintext: 'Enter Your Address',
                    lable: 'Address',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: inputField(
                      hintext: 'Enter Your Mobile Number',
                      lable: 'Mobile Number'),
                ),
                SizedBox(
                  width: 10,
                ),
                TextFormField(
                  decoration:
                      inputField(hintext: 'Description', lable: 'order Detail'),
                ),
                MaterialButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ThanksPage(
                            user_name: nameController.text,
                          ),
                        ),
                      );
                    }
                  },
                  textColor: Colors.white,
                  color: Colors.redAccent,
                  child: Text('submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration inputField({
  String hintext = '',
  String lable = '',
  String? errorT = null,
}) {
  return InputDecoration(
    hintText: hintext,
    label: Text(
      lable,
      style: TextStyle(color: Colors.black),
    ),
    errorText: errorT,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 5,
        color: Colors.grey,
        style: BorderStyle.solid,
      ),
    ),
    border: OutlineInputBorder(
        borderSide: BorderSide(
      width: 2,
      color: Colors.black,
    )),
  );
}
